import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hr/constants/constance.dart';
import 'package:hr/fcm_notification.dart';
import 'package:hr/helper/binding.dart';
import 'package:hr/controllers/language_controller.dart';
import 'package:hr/helper/languages.dart';
import 'package:hr/screens/authScreen/splash_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Initialize Firebase Messaging Service
  FirebaseMessagingService().initialize();

  // Initialize Shared Preferences
  final prefs = await SharedPreferences.getInstance();
  final languageCode = prefs.getString('languageCode') ?? 'en';
  // Register the language controller and update locale
  Get.put(LanguageController()); // Register the language controller
  final languageController = Get.find<LanguageController>();

// Update the locale based on saved preference
  await languageController.changeLanguage(languageCode);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      translations: Languages(),
      locale: Get.locale,
      fallbackLocale: Locale('en'),

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primaryColor,
          primary: AppColor.primaryColor,
        ),
        useMaterial3: false,
      ),
      builder: (context, child) {
        return SafeArea(
          child: child!,
        );
      },
      home: const SplashScreen(),
    );
  }
}
