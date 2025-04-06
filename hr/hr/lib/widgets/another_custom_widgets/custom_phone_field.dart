// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:hr/widgets/another_custom_widgets/custom_text.dart';
// import '../../constants/constance.dart';
//
// String codeCountry = '+973';
//
// class CustomPhoneField extends StatefulWidget {
//   bool errorFiald;
//   PhoneNumber phoneNumber;
//   final TextEditingController phoneNumberController;
//   final void Function(bool)? onInputValidated;
//
//   CustomPhoneField({
//     Key? key,
//     required this.errorFiald,
//     required this.phoneNumber,
//     required this.phoneNumberController,
//     required this.onInputValidated,
//   }) : super(key: key);
//
//   @override
//   _CustomPhoneFieldState createState() => _CustomPhoneFieldState();
// }
//
// class _CustomPhoneFieldState extends State<CustomPhoneField> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: Get.height * 0.06125,
//           width: Get.width,
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color: widget.errorFiald
//                     ? FontColor.fontGreyLight
//                     : FontColor.fontRed),
//           ),
//           child: InternationalPhoneNumberInput(
//             onInputChanged: (PhoneNumber number) {
//               setState(() {
//                 // widget.phoneNumber.isoCode = number.isoCode;
//                 widget.phoneNumber = number;
//                 codeCountry = widget.phoneNumber.dialCode.toString();
//               });
//             },
//             onInputValidated: (bool value) {
//               setState(() {
//                 widget.errorFiald = !value;
//                 if (widget.onInputValidated != null) {
//                   widget.onInputValidated!(value);
//                 }
//               });
//             },
//             ignoreBlank: false,
//             errorMessage: AppText.ERROR,
//             validator: (p0) {
//               if (p0!.isEmpty) {
//                 widget.errorFiald = true;
//                 return null;
//               }
//               return null;
//             },
//             selectorConfig: const SelectorConfig(
//               selectorType: PhoneInputSelectorType.DROPDOWN,
//             ),
//             hintText: AppText.PHONE_NUMBER,
//             inputBorder: InputBorder.none,
//             autoValidateMode: AutovalidateMode.disabled,
//             initialValue: widget.phoneNumber,
//             textStyle: const TextStyle(
//               fontSize: 14,
//               color: FontColor.fontBlack,
//             ),
//             textFieldController: widget.phoneNumberController,
//           ),
//         ),
//         if (!widget.errorFiald)
//           Padding(
//             padding: const EdgeInsets.only(top: 5.0),
//             child: CustomText(
//               text: AppText.ERROR,
//               color: FontColor.fontRed,
//               fontSize: 11.5,
//             ),
//           ),
//       ],
//     );
//   }
// }
