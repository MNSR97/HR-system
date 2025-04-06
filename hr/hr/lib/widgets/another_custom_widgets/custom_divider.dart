import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/helper/extentions.dart';
import '../../constants/constance.dart';

class CustomDivider extends StatelessWidget {
  final double widthPadding;
  final double heightPadding;
  const CustomDivider({super.key,  this.widthPadding = 0.0,  this.heightPadding = 0.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Get.width * (widthPadding / 360) ,vertical: Get.height * (heightPadding /800)),
      child: const Divider(
        color: FontColor.fontGreyLight,
        thickness: 1,
        height: 1,
      ),
    );
  }
}
