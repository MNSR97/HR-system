import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/helper/extentions.dart';
import 'package:lottie/lottie.dart';
import '../../../constants/constance.dart';
import '../../../controllers/timer_controller.dart';
import '../../../widgets/another_custom_widgets/custom_text.dart';
import '../../../widgets/custom_auth_form.dart';

class WorkTimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TimerController>(
        init: TimerController(),
        builder: (controller) {
          controller.fetchWorkTime();
          return SizedBox(
            width: Get.width,
            height: Get.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: Image.asset(
                      AppImage.background,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Positioned(
                  top: 0,
                  child: CustomAppBarForm(
                    text: AppText.timer,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Get.width * .8,
                        height: Get.height * .3,
                        child: Lottie.asset(AppImage.json_timer),
                      ),
                      20.height,
                      CustomText(
                        text: AppText.remainingTime,
                        fontSize: 18,
                      ),
                      20.height,
                      Obx(() {
                        return CustomText(
                          text: '${controller.remainingHourTime.value} h : ${controller.remainingMinuteTime.value} m',
                          fontSize: 28,
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
