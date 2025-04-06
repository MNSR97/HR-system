import 'package:flutter/material.dart';
import 'package:hr/widgets/custom_border_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:hr/constants/constance.dart';
import 'package:hr/constants/main_functions.dart';
import 'package:hr/helper/extentions.dart';
import 'package:hr/helper/validators/validators.dart';
import 'package:hr/screens/authScreen/login_email_screen.dart';
import 'package:hr/screens/authScreen/sign_up_screen.dart';
import 'package:hr/view_model/auth_view_model.dart';
import 'package:hr/widgets/another_custom_widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:hr/screens/authScreen/login_phone_screen.dart';

import '../../widgets/another_custom_widgets/custom_text.dart';
import '../../widgets/another_custom_widgets/custom_text_form_fiald.dart';
import '../../widgets/custom_auth_form.dart';


class ChangePasswored extends StatefulWidget {
  const ChangePasswored({super.key});

  @override
  State<ChangePasswored> createState() => _ChangePassworedState();
}

class _ChangePassworedState extends State<ChangePasswored> {

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool validateEmail = true;
  bool validatePassword = true;
  bool validateconfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
        init: AuthViewModel(),
        builder: (authViewModel) {
          return Scaffold(
            backgroundColor: AppColor.backGroundColorWhite,
            body: Form(
              key: _formKey,
              child: SafeArea(
                child: Column(
                  children: [
                    const CustomAppBarForm(
                    text: AppText.change_password,
                      logo: true,
                  ),

                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width * 0.044),
                          child: Column(
                            children: [

                              (Get.height * 0.04).height,
                              // customTextFormFiald(
                              //     controller: emailController,
                              //     validate: validateEmail,
                              //     keyboardType: TextInputType.emailAddress,
                              //     validator: (value) {
                              //       setState(() {});
                              //       // if(!Validators.isEmail(value)){
                              //       //   return "Email wrong";
                              //       // }
                              //       if (value.isEmpty) {
                              //         validateEmail = false;
                              //         return '';
                              //       } else if (!Validators.isEmail(value!)) {
                              //         validateEmail = false;
                              //
                              //         return '';
                              //       } else {
                              //         validateEmail = true;
                              //       }
                              //     },
                              //     hintText: AppText.E_MAIL),
                              // (Get.height * 0.0125).height,
                              customTextFormFiald(
                                  controller: passwordController,
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
                                  hintText: AppText.new_password),
                              (Get.height * 0.0125).height,
                              customTextFormFiald(
                                  controller: confirmPasswordController,
                                  validate: validateconfirmPassword,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    setState(() {});

                                    // if (value.isEmpty ||
                                    //     passwordController.text !=
                                    //         confirmPasswordController.text) {
                                    //   validateconfirmPassword = false;
                                    //   return '';
                                    // } else

                                      if (!Validators.validateStrongPassword(
                                        value!)) {
                                      validateconfirmPassword = false;
                                      return '';
                                    } else {
                                      validateconfirmPassword = true;
                                    }
                                  },
                                  hintText: AppText.confirmePassword),
                              (Get.height * 0.05).height,
                              CustomButton.buttonStyle(
                                fontSize: 14,
                                text: AppText.change_password,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    authViewModel.changePassword(

                                        currentPassword: passwordController.text, newPassword: confirmPasswordController.text);
                                  }
                                  setState(() {});
                                },
                              ),
                              // (Get.height * 0.1).height,
                              // CustomBorderAuth(onTap: (){
                              //   navigate(context, const LoginScreen(), true);
                              // }, text: AppText.LOGIN_WITH_EMAIL),
                              //
                              // (Get.height * 0.018).height,
                              // CustomBorderAuth(onTap: (){
                              //   navigate(context, const LoginPhoneScreen(), true);
                              //
                              // }, text:  AppText.LOGIN_WITH_PHONE),
                              //

                              (Get.height * 0.018).height,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
