import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/user_model.dart';
import 'package:hr/screens/authScreen/splash_screen.dart';

class Preferences {
  // Save User ID
  static Future<void> setUserId( String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  // Save First Name
  static Future<void> setFirstName(String firstName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName);
  }

  // Save Last Name
  static Future<void> setLastName(String lastName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastName', lastName);
  }

  // Save Email
  static Future<void> setEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  // Save Phone
  static Future<void> setPhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone', phone);
  }

  // Get User ID
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId') ?? '';
  }

  // Get First Name
  static Future<String> getFirstName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('firstName') ?? '';
  }

  // Get Last Name
  static Future<String> getLastName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastName') ?? '';
  }

  // Get Email
  static Future<String> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') ?? '';
  }

  // Get Phone
  static Future<String> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('phone') ?? '';
  }

  // Check if user is logged in
  static Future<void> saveUserLoggedIn(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('userLoggedIn', isLoggedIn);
  }

  static Future<bool> getUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('userLoggedIn') ?? false;
  }

  // Token
  // static Future<String?> getToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('token');
  // }
  //
  // static Future<void> setToken(String token) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('token', token);
  // }

  // FCM Token
  static Future<String?> getFCMToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('fcmToken') ?? '';
  }

  static Future<void> setFCMToken(String fcmToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fcmToken', fcmToken);
  }

  // Admin
  static Future<bool?> getAdmin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('admin') ?? false;
  }

  static Future<void> setAdmin(bool admin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('admin', admin);
  }

  // Logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await saveUserLoggedIn(false);
    await prefs.clear();
    Get.offAll(const SplashScreen());
  }

  // Save UserModel to SharedPreferences
  static Future<void> setUser(UserModel userModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userModel', jsonEncode(userModel.toJson()));
  }

  // Retrieve UserModel from SharedPreferences
  static Future<UserModel?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userModelString = prefs.getString('userModel');
    if (userModelString != null) {
      return UserModel.fromJson(jsonDecode(userModelString));
    }
    return null;
  }
}
