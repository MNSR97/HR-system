import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constance.dart';
import 'custom_text.dart';



class CustomButton {

  static Center
  buttonStyle(
      {
       required String? text,
        Color? colorButton = AppColor.buttonColor,
        required Function()? onPressed,
        double? borderSize = 5,
         double? width,
         double? height,
         double? fontSize = 13,
        Color colorText= AppColor.backGroundColorWhite,
        Color colorBorder = Colors.transparent,
      })
  {
    return Center(
      child: SizedBox(
        width: width ?? Get.width,
        height:height ?? Get.height *  (38 /800),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: colorBorder),
              borderRadius: BorderRadius.circular(borderSize!)),
          onPressed: onPressed,
          color: colorButton,
          child: CustomText(
            text: text,
            fontSize: fontSize,
            color: colorText,
          ),
        ),
      ),
    );
  }
}






