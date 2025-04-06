import 'package:flutter/material.dart';

import '../constants/constance.dart';
import 'another_custom_widgets/custom_text.dart';

class CustomBorderAuth extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final Color? color;

  const CustomBorderAuth({
    Key? key,
    required this.onTap,
    required this.text,
     this.color = FontColor.fontBlack,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: FontColor.fontGreyLight),
        ),
        padding: const EdgeInsets.all(5),
        child: CustomText(
          text: text,
          fontSize: 12,
          color: color,

        ),
      ),
    );
  }
}
