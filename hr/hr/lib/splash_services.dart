import 'dart:async';
import 'package:get/get.dart';
import 'package:hr/bottom_nav_screen.dart';
import '../preferences.dart';
import 'screens/authScreen/login_email_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SplashServices extends GetxController {
  splash() async {
    bool userLoggedIn = await Preferences.getUserLoggedIn();

      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? token = await messaging.getToken();
      Preferences.setFCMToken(token!);
    bool? admin = await Preferences.getAdmin();


     print("admin : $admin");
      Timer(const Duration(seconds: 2),() async {
    if (userLoggedIn) {
      await Future.wait([

      ]);

        Get.offAll( MyBottomNavigationBarScreen(
          admin: admin ?? false,
        ));



    } else {
      Get.offAll(const LoginScreen());
    }
    });
  }
}
