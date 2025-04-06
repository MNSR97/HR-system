import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/helper/extentions.dart';
import 'package:hr/widgets/another_custom_widgets/custom_button.dart';
import 'package:hr/widgets/another_custom_widgets/custom_text.dart';
import 'package:hr/widgets/custom_auth_form.dart';
import 'package:lottie/lottie.dart';
import '../../../../constants/constance.dart';
import '../../../../controllers/attendance_controller.dart';

class CheckOutScreen extends StatelessWidget {
  final AttendanceController controller = Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: SizedBox(
                width: Get.width,
                height: Get.height,
                child: Image.asset(
                  AppImage.background,
                  fit: BoxFit.fill,
                ),
              )),
          Column(
            children: [
              CustomAppBarForm(text: AppText.checkOut),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: Get.width * .8,
                          height: Get.height * .2,
                          child: Lottie.asset(AppImage.json_registor)),

                      const SizedBox(height: 20),
                      Obx(() => CustomButton.buttonStyle(
                          text: AppText.registerCheckOut,
                          colorButton:
                          controller.isLoading.value
                              ? Colors.transparent
                              : AppColor.primaryColor,
                          onPressed: controller.isLoading.value
                              ? () {}
                              : () {
                            controller.checkOut();
                          })),
                      5.height,
                      // Obx(() => CustomText(
                      //   text: controller.isLoading.value
                      //       ? ""
                      //       : "success",
                      //   color: Colors.green[500],
                      // )),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
