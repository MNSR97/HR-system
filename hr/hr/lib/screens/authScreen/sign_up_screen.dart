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
import 'login_email_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController confirmPasswordController =
  TextEditingController();


  bool checkBox = false;
  bool errorFiald = true;

  bool validateFirstName = true;
  bool validateLastName = true;
  bool validateEmail = true;
  bool validatePassword = true;
  bool validateConfirmPassword = true;

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
                        text: AppText.SIGNUP,
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
                            customTextFormFiald(
                                controller: authViewModel.emailController,
                                validate: validateEmail,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  setState(() {});
                                  // if(!Validators.isEmail(value)){
                                  //   return "Email wrong";
                                  // }
                                  if (value.isEmpty) {
                                    validateEmail = false;
                                    return '';
                                  } else if (!Validators.isEmail(value!)) {
                                    validateEmail = false;
                                    return '';
                                  } else {
                                    validateEmail = true;
                                  }
                                },
                                hintText: AppText.E_MAIL),
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
                                  } else {
                                    errorFiald = true;
                                  }
                                },
                                hintText: AppText.PHONE_NUMBER),

                            (Get.height * 0.0225).height,
                            customTextFormFiald(
                                controller: authViewModel.passwordController,
                                validate: validatePassword,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  setState(() {});

                                  if (value.isEmpty) {
                                    validatePassword = false;
                                    return '';
                                  } else if (!Validators.validateStrongPassword(
                                      value!)) {
                                    validatePassword = false;
                                    return '';
                                  } else {
                                    validatePassword = true;
                                  }
                                },
                                hintText: AppText.password),
                            (Get.height * 0.0225).height,
                            customTextFormFiald(
                                controller: confirmPasswordController,
                                validate: validateConfirmPassword,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  setState(() {});

                                  if (value.isEmpty) {
                                    validateConfirmPassword = false;
                                    return '';
                                  } else if (!Validators.validateStrongPassword(
                                      value!)) {
                                    validateConfirmPassword = false;
                                    return '';
                                  } else
                                  if (authViewModel.passwordController.text !=
                                      confirmPasswordController.text) {
                                    validateConfirmPassword = false;
                                    return '';
                                  } else {
                                    validateConfirmPassword = true;
                                  }
                                },
                                hintText: AppText.confirmePassword),
                            (Get.height * 0.0225).height,
                            Obx(
                                  () {
                                return authViewModel.loading.value
                                    ? SizedBox(
                                    width: Get.width * .2,
                                    height: Get.width * .2,
                                    child:
                                    Lottie.asset('assets/lottie/load.json'))
                                    : CustomButton.buttonStyle(

                                  text: AppText.SIGNUP,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      authViewModel.signUpWithEmailAndPassword(

                                      );
                                    }
                                    setState(() {});
                                  },
                                );
                              },
                            ),
                            (Get.height * 0.05).height,
                            CustomBorderAuth(onTap: () {
                              Get.to(const LoginScreen());
                            },
                              text: AppText.ALREADY_HAVE_ACCOUNT_LOGIN + " " + AppText.LOGIN,
                              color: FontColor.fontGrey,),

                            (Get.height * 0.05).height,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
