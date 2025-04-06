import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/constants/constance.dart';

class CustomText extends StatelessWidget{

 final String? text;
 final TextAlign? textAlign;
 final String? fontFamily;
 final TextDecoration? textDecoration;
 final double? fontSize;
 final double? height;
 Color? color = Get.isDarkMode ?  AppColor.backGroundColorWhite:FontColor.fontBlack;

 final FontWeight? fontWeight;
 final int? maxLines;
 final TextOverflow? overflow;

  double? wordSpacing;


 CustomText( {super.key,
  required this.text,
   this.fontSize= 14,
   this.textDecoration,
   this.color,
   this.fontWeight= FontWeight.w500,
   this.maxLines = 10000,
   this.wordSpacing,   this.fontFamily = 'Edu-Regular', this.textAlign,
   this.overflow = TextOverflow.ellipsis, this.height = 1.2,});


  @override
  Widget build(BuildContext context) {
    return Text(
        text.toString().tr,
        maxLines: maxLines,
        textAlign: textAlign,
        style: TextStyle(
          overflow: overflow,
          fontFamily: fontFamily,
          decoration: textDecoration,
          wordSpacing: wordSpacing,
          fontSize: fontSize,
          height: height,
          color: color,
          fontWeight: fontWeight,
        ),
      
    );
  }
  }


