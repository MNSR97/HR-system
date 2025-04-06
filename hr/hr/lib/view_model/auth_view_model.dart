import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hr/constants/constance.dart';
import 'package:hr/model/user_model.dart';
import 'package:hr/preferences.dart';
import 'package:hr/screens/authScreen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_nav_screen.dart';
import '../fcm_notification.dart';
import '../helper/extentions.dart';

class AuthViewModel extends GetxController {
  SharedPreferences? prefs;
  UserModel userModel = UserModel();
  RxString token = ''.obs;
  RxBool loading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController codeFromSMSController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  String _verificationId = '';


  Future<void> verifyPhoneNumber() async {
    try {
      loading.value = true;
      await _auth.verifyPhoneNumber(
        phoneNumber: '+962${phoneNumberController.text}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          snackbar('Error', 'verification_failed');
          loading.value = false;
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          loading.value = false;
          snackbar('Success', 'verification_code_sent');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
          loading.value = false;
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      snackbar('Error', 'error_during_verification');
    } finally {
      loading.value = false;
    }
  }

  Future<void> signInWithPhoneNumber() async {
    try {
      loading.value = true;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: codeFromSMSController.text,
      );
      UserCredential userCredential =
      await _auth.signInWithCredential(credential);
      String? token = await userCredential.user?.getIdToken();

      if (token != null && token.isNotEmpty) {
        var existingUser = await _firestore
            .collection('employee')
            .where('phoneNumber', isEqualTo: phoneNumberController.text)
            .get();

        if (existingUser.docs.isNotEmpty) {
          String existingUserId = existingUser.docs.first.id;
          await _fetchUserData(existingUserId);
          await Preferences.saveUserLoggedIn(true);

          DocumentSnapshot userDoc =
          await _firestore.collection('employee').doc(existingUserId).get();

          if (userDoc.exists) {
            bool isAdmin = userDoc['admin'] ?? false;
            await Preferences.setAdmin(isAdmin);
            Get.offAll(MyBottomNavigationBarScreen(admin: isAdmin));
          } else {
            Get.snackbar('Error', 'user_document_not_exists'.tr);
          }
        } else {
          Get.snackbar('Failed', 'Please sign up first');
        }
      } else {
        Get.snackbar('Error', 'failed_to_retrieve_token'.tr);
      }
    } catch (e) {
      Get.snackbar('Error', 'error_signing_in'.tr + ': $e');
    } finally {
      loading.value = false;
    }

  }

  Future<void> signUpWithEmailAndPassword() async {
    try {
      loading.value = true;

      var existingUser = await _firestore
          .collection('employee')
          .where('phoneNumber', isEqualTo: phoneNumberController.text)
          .get();

      if (existingUser.docs.isNotEmpty) {
        snackbar('Error', 'phone_number_in_use'.tr);
        return;
      }

      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      String uid = userCredential.user!.uid;

      await _firestore.collection('employee').doc(uid).set({
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'email': emailController.text,
        'phoneNumber': "+962${phoneNumberController.text}",
        "admin": false,
        "userId": uid,
      });

      await _fetchUserData(uid);
      await Preferences.saveUserLoggedIn(true);
      await Preferences.setAdmin(false);
      Get.offAll(MyBottomNavigationBarScreen());
      Get.snackbar('Success', 'sign_up_successful'.tr);
    } catch (e) {
      Get.snackbar('Error', 'error_signing_up'.tr + ': $e');
    } finally {
      loading.value = false;
    }
  }

  Future<void> updateEmployeeData({
    String firstName = "",
    String lastName = "",
    String phoneNumber = '',
    bool admin = false,
    String uid = "",
  }) async {
    try {
      var userId = await Preferences.getUserId();

      if (firstName != "") {
        await Preferences.setFirstName(firstName);
        await _firestore
            .collection('employee')
            .doc(uid != "" ? uid : userId)
            .update({
          'firstName': firstName,
        });
      }

      if (lastName != "") {
        await Preferences.setLastName(lastName);
        await _firestore
            .collection('employee')
            .doc(uid != "" ? uid : userId)
            .update({
          'lastName': lastName,
        });
      }

      if (phoneNumber != "") {
        await Preferences.setPhone(phoneNumber);
        await _firestore
            .collection('employee')
            .doc(uid != "" ? uid : userId)
            .update({
          'phoneNumber': "+962$phoneNumber",
        });
      }

      if (admin == true) {
        await Preferences.setAdmin(admin);
        await _firestore
            .collection('employee')
            .doc(uid != "" ? uid : userId)
            .update({
          'admin': admin,
        });
      }

      if (firstName.isNotEmpty || lastName.isNotEmpty || phoneNumber.isNotEmpty) {
        Get.offAll(const SplashScreen());
      }
    } catch (e) {
      Get.snackbar('Error', 'error_updating_document'.tr + ': $e');
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      loading.value = true;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      String uid = userCredential.user!.uid;

      DocumentSnapshot userDoc =
      await _firestore.collection('employee').doc(uid).get();
      bool isAdmin = userDoc['admin'] ?? false;

      await _fetchUserData(uid);
      await Preferences.saveUserLoggedIn(true);
      await Preferences.setAdmin(isAdmin);
      Get.offAll(MyBottomNavigationBarScreen(admin: isAdmin));
      Get.snackbar('Success', 'signed_in_successfully'.tr);
    } catch (e) {
      Get.snackbar('Error', 'error_signing_in'.tr + ': $e');
    } finally {
      loading.value = false;
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      loading.value = true;

      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        snackbar('Error'.tr, 'user_document_not_exists'.tr);
        return;
      }

      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);

      snackbar('Success'.tr, 'password_changed_successfully'.tr);
      Get.back();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        snackbar('Error'.tr, 'The current password is incorrect.'.tr);
      } else if (e.code == 'weak-password') {
        snackbar('Error'.tr, 'The new password is too weak.'.tr);
      } else {
        snackbar('Error'.tr, 'error_changing_password'.tr);
      }
    } catch (e) {
      snackbar('Error'.tr, 'error_changing_password'.tr +' : $e');
    } finally {
      loading.value = false;
    }
  }
  Future<void> resetPassword() async {
    try {
      loading.value = true;
      await _auth.sendPasswordResetEmail(email: emailController.text);
      Get.snackbar('Success', 'password_reset_email_sent'.tr);
    } catch (e) {
      Get.snackbar('Error', 'error_sending_reset_email'.tr + ': $e');
    } finally {
      loading.value = false;
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> googleSignIn() async {
    try {
      loading.value = true;
      _googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        String? userId = user.uid;
        var existingUser = await _firestore
            .collection('employee')
            .where('userId', isEqualTo: userId)
            .get();

        if (existingUser.docs.isNotEmpty) {
          var userDoc = existingUser.docs.first;
          await _fetchUserData(userId);
          await Preferences.saveUserLoggedIn(true);

          bool isAdmin = userDoc['admin'] ?? false;
          await Preferences.setAdmin(isAdmin);
          Get.offAll(MyBottomNavigationBarScreen(admin: isAdmin));
          snackbar('Success'.tr, 'google_sign_in_successful'.tr);
        } else {
          // User doesn't exist in Firestore, create a new record
          await _firestore.collection('employee').doc(userId).set({
            'firstName': user.displayName?.split(' ').first ?? '',
            'lastName': user.displayName?.split(' ').last ?? '',
            'email': user.email,
            'phoneNumber': user.phoneNumber ?? '',
            'admin': false,
            'userId': userId,
          });

          await _fetchUserData(userId);
          await Preferences.saveUserLoggedIn(true);
          await Preferences.setAdmin(false);
          Get.offAll(MyBottomNavigationBarScreen());
          snackbar('Success'.tr, 'google_sign_in_successful'.tr);
        }
      } else {
        snackbar('Error'.tr, 'google_sign_in_failed'.tr);
      }
    } catch (e) {
      snackbar('Error'.tr, 'error_during_google_sign_in'.tr);
    } finally {
      loading.value = false;
    }
  }

  Future<void> _fetchUserData(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('employee').doc(uid).get();
      if (doc.exists) {
        userModel = UserModel.fromFirestore(doc.data() as Map<String, dynamic>);
        await Preferences.setUser(userModel);
        print('userModel : ${userModel.toJson()}');
        await setShared(); // Update local variables after fetching
      } else {
        snackbar('Error'.tr, 'No user data found for uid: $uid');
      }
    } catch (e) {
      snackbar('Error'.tr, 'Error fetching user data: $e');
    }
  }

  String name = '';
  String email = '';
  String phone = '';
  String userId = '';

  Future<void> setShared() async {
    await Preferences.setFirstName('${userModel.firstName}');
    await Preferences.setLastName('${userModel.lastName}');
    await Preferences.setEmail('${userModel.email}');
    await Preferences.setPhone('${userModel.phoneNumber}');
    await Preferences.setUserId('${userModel.userId}');
    update();
  }

  Future<void> getShared() async {
    name =
        '${await Preferences.getFirstName()} ${await Preferences.getLastName()}';
    email = await Preferences.getEmail();
    phone = await Preferences.getPhone();
    userId = await Preferences.getUserId();

    update();
  }

  String? fcmToken = "";

  Future<void> _getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    Preferences.setFCMToken(token!);

    print("user id $userId");
    if (userId.isNotEmpty) {
      await _firestore.collection('employee').doc(userId).update({
        'token': token,
      });
    }

    print("FCM Token: $token");
    fcmToken = token;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getShared();
    _getToken();
  }
}
