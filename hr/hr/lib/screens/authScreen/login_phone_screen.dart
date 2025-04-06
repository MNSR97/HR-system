import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hr/widgets/custom_border_auth.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lottie/lottie.dart';
import 'package:hr/constants/constance.dart';
import 'package:hr/constants/main_functions.dart';
import 'package:hr/helper/extentions.dart';
import 'package:hr/screens/authScreen/login_email_screen.dart';
import 'package:hr/screens/authScreen/sign_up_screen.dart';
import 'package:hr/view_model/auth_view_model.dart';
import 'package:hr/widgets/another_custom_widgets/custom_button.dart';
import 'package:hr/widgets/another_custom_widgets/custom_text.dart';
import 'package:hr/widgets/another_custom_widgets/custom_text_form_fiald.dart';
import 'package:get/get.dart';
import '../../helper/validators/validators.dart';
import '../../widgets/custom_auth_form.dart';


class LoginPhoneScreen extends StatefulWidget {
  const LoginPhoneScreen({super.key});

  @override
  State<LoginPhoneScreen> createState() => _LoginPhoneScreenState();
}

class _LoginPhoneScreenState extends State<LoginPhoneScreen> {
  String initialCountry = 'QA';
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'QA');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool buttonTextChange = true;
  bool errorFiald = true;
  bool validateCode = true;
  Timer? _timer;
  bool _buttonVisible = false;
  int time = 30;
  int timeCheck = 30;

  void _startTimer() {
    _buttonVisible = true;
    timeCheck = time;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeCheck > 0) {
          timeCheck--;
        } else {
          _buttonVisible = false;
          _timer!.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
                     const CustomAppBarForm(
                        text: AppText.LOGIN,    logo: true,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.044),
                        child: Column(
                          children: [


                            (Get.height * 0.04).height,
                            // appSizeHeight(appSizeHeight: 40),

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
                                  }  else {
                                    errorFiald = true;
                                  }
                                },
                                hintText: AppText.PHONE_NUMBER),

                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CustomText(
                                    text: AppText.WAIT_SMS_COD,
                                    fontSize: 10,
                                    color: FontColor.fontGrey,
                                  ),
                                )),
                            (Get.height * 0.02625).height,
                            customTextFormFiald(
                                controller: authViewModel.codeFromSMSController,
                                validate: validateCode,
                                keyboardType: TextInputType.number,
                                maxLength: 6,
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    buttonTextChange = true;
                                  } else {
                                    buttonTextChange = false;
                                  }
                                  setState(() {});
                                },
                                validator: (value) {
                                  setState(() {});
                                  // if(!Validators.isEmail(value)){
                                  //   return "Email wrong";
                                  // }
                                  if (value.isEmpty) {
                                    validateCode = false;
                                    return '';
                                  } else {
                                    validateCode = true;
                                  }
                                },
                                hintText: AppText.CODE_FROM_SMS),

                            (Get.height * 0.025).height,

                            Obx(() => InkWell(
                                  onTap: _buttonVisible
                                      ? null
                                      : () {
                                          setState(() {
                                            _startTimer();
                                          });
                                         authViewModel.verifyPhoneNumber();
                                        },
                                  child: Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: CustomText(
                                          text: AppText.RESIND_CODE,
                                          fontSize: 13,
                                          color: FontColor.fontBlack,
                                          textDecoration: TextDecoration.underline,
                                        ),
                                      ),
                                      authViewModel.loading.value ||
                                              _timer == null ||
                                              timeCheck == 0
                                          ? const SizedBox.shrink()
                                          : Row(
                                              children: [
                                                appSizeWidth(appSizeWidth: 20),
                                                CustomText(
                                                  text: '$timeCheck',
                                                  fontSize: 12,
                                                  // color: timeCheck > 10
                                                  //     ? Colors.black
                                                  //     : Colors.red,
                                                ),
                                              ],
                                            ),
                                    ],
                                  ),
                                )),
                            (Get.height * 0.05).height,
                            Obx(() => authViewModel.loading.value
                                ? SizedBox(
                                    width: Get.width * .2,
                                    height: Get.width * .2,
                                    child: Lottie.asset('assets/lottie/load.json'))
                                : CustomButton.buttonStyle(

                                    text:  AppText.LOGIN_IN_NOW,
                                    onPressed: () {
                                      if (buttonTextChange) {
                                        // _verifyPhoneNumber();
                                      } else if (_formKey.currentState!
                                          .validate()) {
                                       authViewModel.signInWithPhoneNumber();
                                      }
                                    },
                                    width: Get.width,
                                    height: Get.height * .0475)),
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
                                        child: FittedBox(child: CustomText(text: 'Continue using Google',fontSize: 13,color: Colors.black,)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),),

                            (Get.height * 0.1).height,

                            CustomBorderAuth(onTap: (){
                              navigate(context, const LoginScreen(), true);
                            }, text: AppText.LOGIN_WITH_EMAIL),

                            // (Get.height * 0.01875).height,
                            appSizeHeight(appSizeHeight: 15),

                            CustomBorderAuth(
                              onTap: (){
                                navigate(context, const SignUpScreen(), false);
                              },
                              text: AppText.DONT_HAVE_ACCOUNT_SIGNUP.tr + " "+  AppText.SIGNUP.tr,
                              color: FontColor.fontGreyDark,
                            ),

                            (Get.height * 0.03).height,
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
