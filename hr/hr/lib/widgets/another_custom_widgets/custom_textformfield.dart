import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hr/widgets/another_custom_widgets/custom_text.dart';
import '../../constants/constance.dart';

class CustomTextFormField {
  static Widget textFieldStyle({
    String hintText = "",
    double? width,
    TextInputAction? textInputAction,
    double? height,
    bool obscureText = false,
    bool phone = false,
    required bool validate,
    void Function(String)? onChanged,
    int? maxLines = 1,
    Widget? suffixIcon,
    double fontSize = 15,
    double hintFontSize = 14,
    double widthBorder = 1,
    TextAlign textAlign = TextAlign.start,
    FontWeight fontWeight = FontWeight.w300,
    Color hintColor = Colors.black,
    Color borderColor = FontColor.fontGreyLight,

    TextEditingController? controller,
    String? Function(dynamic value)? validator,
    FocusNode? focusNode,
    TextInputType keyboardType = TextInputType.emailAddress,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    IconButton? prefixIcon,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: !validate ? height! - height *.2 : height ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border: Border.all(
                color: !validate
                    ? FontColor.fontRed
                    : Colors.transparent), // Change border color on error
          ),
          child:
          Stack(
            children: [
          !phone ? const SizedBox() :   TextFormField(
           textDirection:  Get.locale == Locale("ar") ? TextDirection.rtl :  TextDirection.ltr,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(color: borderColor, width: widthBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: const BorderSide(
                      color: Colors.black), // Change border color on focus
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: const BorderSide(
                      color: Colors.transparent), // Change border color on error
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: const BorderSide(
                      color: Colors.transparent), // Change border color on focus error
                ),
                hintText: '+962',
                hintStyle: TextStyle(color: hintColor, fontSize: hintFontSize),
                errorStyle: const TextStyle(
                  height: 0
                ), // Hide default error text
                counterText: '', // Hide the counter text
              ),
            ),
              TextFormField(
                obscureText: obscureText,
                keyboardType: keyboardType,
                textAlign: textAlign,
                maxLength: phone ? 9 : maxLength,
                maxLines: maxLines,
                minLines: maxLines == 1 ? 1 : maxLines,
                style: TextStyle(fontSize: fontSize),

                inputFormatters: inputFormatters,
                validator: validator,
                onChanged: onChanged,
                textInputAction: textInputAction,
                focusNode: focusNode,
                textDirection:  Get.locale == Locale("ar") ? TextDirection.rtl :  TextDirection.ltr,
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(color: borderColor, width: widthBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(
                        color: Colors.black), // Change border color on focus
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(
                        color: Colors.transparent), // Change border color on error
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(
                        color: Colors.transparent), // Change border color on focus error
                  ),
                  suffixIcon: suffixIcon,
                  hintText: hintText.tr,
                  prefixIcon: prefixIcon,
                  contentPadding:  EdgeInsets.symmetric(horizontal: phone ? 50 : 10,vertical:   !validate ? 0 : 15),
                  hintStyle: TextStyle(color: hintColor, fontSize: hintFontSize),
                  errorStyle: const TextStyle(
                    height: 0,
                  ), // Hide default error text
                  counterText: '', // Hide the counter text
                ),
              ),
            ],
          ),
        ),
        if (!validate)
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: CustomText(
              text: AppText.ERROR,
              color: FontColor.fontRed,
              fontSize: 11.5,
            ),
          ),
      ],
    );
  }
}
