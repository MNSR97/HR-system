import 'package:flutter/material.dart';
import 'package:hr/helper/extentions.dart';
import 'package:hr/widgets/custom_border_auth.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import '../../constants/constance.dart';
import '../../helper/validators/validators.dart';
import '../../view_model/auth_view_model.dart';
import '../../widgets/another_custom_widgets/custom_button.dart';
import '../../widgets/another_custom_widgets/custom_phone_field.dart';
import '../../widgets/another_custom_widgets/custom_text.dart';
import '../../widgets/another_custom_widgets/custom_text_form_fiald.dart';
import '../../widgets/custom_auth_form.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool checkBox = false;
  bool errorFiald = true;

  bool validateFirstName = true;
  bool validateLastName = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthViewModel>(
          init: AuthViewModel(),
          builder: (authViewModel) {
            return Form(
              key: _formKey,
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      CustomAppBarForm(
                        text: AppText.Edit,
                        logo: true,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.044),
                        child: Column(
                          children: [
                            (Get.height * 0.04).height,
                            customTextFormFiald(
                                controller: authViewModel.firstNameController,
                                validate: validateFirstName,
                                validator: (value) {
                                  setState(() {});
                                  // if(!Validators.isEmail(value)){
                                  //   return "Email wrong";
                                  // }
                                  if (value.isEmpty) {
                                    validateFirstName = false;
                                    return '';
                                  } else {
                                    validateFirstName = true;
                                  }
                                },
                                hintText: AppText.FIRST_NAME),
                            (Get.height * 0.0125).height,
                            customTextFormFiald(
                                controller: authViewModel.lastNameController,
                                validate: validateLastName,
                                validator: (value) {
                                  setState(() {});
                                  // if(!Validators.isEmail(value)){
                                  //   return "Email wrong";
                                  // }
                                  if (value.isEmpty) {
                                    validateLastName = false;
                                    return '';
                                  } else {
                                    validateLastName = true;
                                  }
                                },
                                hintText: AppText.LAST_NAME),
                            (Get.height * 0.0125).height,
                            (Get.height * 0.0125).height,
                            customTextFormFiald(
                                controller: authViewModel.phoneNumberController,
                                validate: errorFiald,
                                phone: true,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  setState(() {});

                                  if (value.isEmpty) {
                                    errorFiald = false;
                                    return '';
                                  } else if (value.length < 9) {
                                    errorFiald = false;
                                    return '';
                                  } else {
                                    errorFiald = true;
                                  }
                                },
                                hintText: AppText.PHONE_NUMBER),
                            (Get.height * 0.0225).height,
                            Obx(
                              () {
                                return authViewModel.loading.value
                                    ? SizedBox(
                                        width: Get.width * .2,
                                        height: Get.width * .2,
                                        child: Lottie.asset(AppImage.load))
                                    : CustomButton.buttonStyle(
                                        text: AppText.UPDATE,
                                        onPressed: () {
                                          if (validateFirstName) {
                                            authViewModel.updateEmployeeData(
                                                firstName: authViewModel
                                                    .firstNameController.text);
                                          }
                                          if (validateLastName) {
                                            authViewModel.updateEmployeeData(
                                              lastName: authViewModel
                                                  .lastNameController.text,
                                            );
                                          }
                                          if(  authViewModel
                                              .phoneNumberController
                                              .text ==
                                              ""){

                                          }else
                                          if (errorFiald && authViewModel
                                              .phoneNumberController
                                              .text.length > 8) {
                                            authViewModel.updateEmployeeData(
                                                phoneNumber: authViewModel
                                                    .phoneNumberController
                                                    .text);
                                          }
                                        },
                                      );
                              },
                            ),
                            (Get.height * 0.05).height,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
