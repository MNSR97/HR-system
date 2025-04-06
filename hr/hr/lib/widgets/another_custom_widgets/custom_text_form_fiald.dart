import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/bottom_nav_screen.dart';
import 'package:hr/widgets/another_custom_widgets/custom_textformfield.dart';
import '../../constants/constance.dart';

class customTextFormFiald extends StatelessWidget {
  final TextEditingController? controller;
  final bool validate;
  int? maxLength;
  final bool question;
  final bool phone;
  final TextInputType keyboardType;
  final String? Function(dynamic)? validator;
  final  void Function(String)? onChanged;
  final String hintText;

  customTextFormFiald({
    super.key,
    required this.controller,
    this.maxLength,
    required this.validate,
    this.keyboardType = TextInputType.text,
    required this.validator,
    required this.hintText,  this.question = false, this.onChanged,  this.phone = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField.textFieldStyle(
        validate: validate,
        controller: controller,
        hintText: hintText,
        phone: phone,
        onChanged: onChanged,
        hintColor: FontColor.fontGrey,
        fontSize: 14,
        maxLength: maxLength,
        keyboardType: keyboardType,
        width: Get.width * (328 / 360),
        maxLines: question ? 3 : 1,
        height:  
        question ? Get.height * (82 / 800) : 
        (validate ? Get.height * (41 / 800) : Get.height * (51 / 800)),
        validator: validator);
  }
}
