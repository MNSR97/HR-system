import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/constants/constance.dart';

import '../widgets/another_custom_widgets/custom_text.dart';


extension padding on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());
}

// if  height device  = 800 in figma  "design"
Widget appSizeHeight({required double appSizeHeight}) {
  final size = (Get.height * (appSizeHeight / 800)).height;
  return size;
}

// if  width device  = 360 in figma  "design"
Widget appSizeWidth({required double appSizeWidth}) {
  final size = (Get.width * (appSizeWidth / 360)).width;
  return size;
}

enum PaymentMethod { visa, paypal, cashOnDelivery }

SnackbarController snackbar(
   String title,
   String message,
) {
  return Get.snackbar('', '',
      messageText: CustomText(
        text: message.tr,
        fontSize: 14,
      ),
      titleText: CustomText(
        text: title.tr,
        fontSize: 16,
      ),
      colorText: FontColor.fontBlack,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: Get.width * (16 / 360)),
      margin: EdgeInsets.zero,
      animationDuration: const Duration(milliseconds: 1000),
      duration: const Duration(milliseconds: 1500),
      snackPosition: SnackPosition.TOP);
}
