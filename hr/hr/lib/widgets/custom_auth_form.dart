import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/helper/extentions.dart';

import '../constants/constance.dart';
import 'another_custom_widgets/custom_text.dart';

class CustomAppBarForm extends StatelessWidget {
  final String text;
  final bool wlecome_back;
  final bool logo;

  const CustomAppBarForm(
      {super.key, required this.text, this.wlecome_back = false,  this.logo = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          height: Get.height * .1,
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              !wlecome_back ? SizedBox() :   Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: AppText.WELCOME_BACK.tr + ',',
                  fontSize: 14,
                  color: AppColor.backGroundColorWhite,
                ),
              ),
              Center(
                child: CustomText(
                  text: text,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Edu-Regular",
                  color: AppColor.backGroundColorWhite,
                ),
              ),
            ],
          ),
        ),
        !logo ?  const SizedBox(): (Get.height * 0.04).height,
        !logo ?  const SizedBox():    Center(
            child: Image.asset(AppImage.logo,width: Get.width *.4,height: Get.width *.3 ,fit: BoxFit.fill,)),

      ],
    );
  }
}
