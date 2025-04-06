import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/helper/extentions.dart';
import 'package:hr/preferences.dart';
import 'package:hr/widgets/another_custom_widgets/custom_text.dart';

import '../../constants/constance.dart';

class CustomProfileList extends StatelessWidget {
  final String text;
  final String icon;
  final void Function() onTap;
  const CustomProfileList({Key? key, required this.text, required this.icon,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(8)
      ),
      child: ListTile(
        title: Row(
          children: [
            SizedBox(
                width: Get.width * 0.08,
                child: Image.asset(icon)),
            10.width,
            CustomText(text:text,fontSize: 18,),
          ],
        ),
        onTap:onTap ),
    );
  }
}
