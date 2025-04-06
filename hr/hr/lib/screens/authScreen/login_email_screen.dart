import 'package:flutter/material.dart';
import 'package:hr/widgets/custom_border_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:hr/constants/constance.dart';
import 'package:hr/constants/main_functions.dart';
import 'package:hr/helper/extentions.dart';
import 'package:hr/helper/validators/validators.dart';
import 'package:hr/screens/authScreen/change_passwored.dart';
import 'package:hr/screens/authScreen/sign_up_screen.dart';
import 'package:hr/view_model/auth_view_model.dart';
import 'package:hr/widgets/another_custom_widgets/custom_button.dart';
import 'package:hr/widgets/another_custom_widgets/custom_text.dart';
import 'package:hr/widgets/another_custom_widgets/custom_text_form_fiald.dart';
import 'package:get/get.dart';
import 'package:hr/screens/authScreen/login_phone_screen.dart';

import '../../widgets/custom_auth_form.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool validateEmail = true;
  bool validatePassword = true;

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
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      CustomAppBarForm(
                        text: AppText.LOGIN,
                        wlecome_back: true,
                        logo: true,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.044),
                        child: Column(
                          children: [

                            (Get.height * 0.04).height,
                            customTextFormFiald(
                                controller:    authViewModel.emailController,
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
                                    return '';
                                  } else {
                                    validateEmail = true;
                                  }
                                },
                                hintText: AppText.E_MAIL),
                            (Get.height * 0.0125).height,
                            customTextFormFiald(
                                controller:    authViewModel.passwordController,
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


                            (Get.height * 0.05).height,
                            Obx(
                              () {
                                return authViewModel.loading.value
                                    ? SizedBox(
                                        width: Get.width * .2,
                                        height: Get.width * .2,
                                        child:
                                            Lottie.asset('assets/lottie/load.json'))
                                    : CustomButton.buttonStyle(

                                        text: AppText.LOGIN_IN_NOW,
                                        onPressed: () {
                                          if (_formKey.currentState!.validate()) {
                                            authViewModel.signInWithEmailAndPassword(

                                            );
                                          }
                                          setState(() {});
                                        },
                                      );
                              },
                            ),
                            (Get.height * 0.02).height,
                        Center(
                          child:  SizedBox(
                            height: Get.width*.12,
                            width:  Get.width,
                            child: ElevatedButton(
                              style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(
                                AppColor.backGroundColorWhite
                              )),
                              onPressed: () {
                                authViewModel.googleSignIn();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Image.asset('assets/images/google.png',width: 20,),
                                  10.width,
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FittedBox(child: CustomText(text: 'Continue using Google'.tr,fontSize: 13,color: Colors.black,)),
                                  ),
                                ],
                              ),
                            ),
                          ),),

                            (Get.height * 0.1).height,


                            CustomBorderAuth(
                              onTap: (){
                                navigate(context, const LoginPhoneScreen(), true);

                              },
                              text: AppText.LOGIN_WITH_PHONE,
                            ),

                            (Get.height * 0.018).height,
                            CustomBorderAuth(
                              onTap: (){
                                navigate(context, const SignUpScreen(), false);
                              },
                              text: AppText.DONT_HAVE_ACCOUNT_SIGNUP.tr + " "+  AppText.SIGNUP.tr,
                              color: FontColor.fontGreyDark,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
