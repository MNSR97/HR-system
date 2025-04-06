import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/helper/extentions.dart';
import 'package:hr/widgets/another_custom_widgets/custom_button.dart';
import 'package:lottie/lottie.dart';
import '../../../constants/constance.dart';
import '../../../controllers/timer_controller.dart';
import '../../../widgets/another_custom_widgets/custom_text.dart';
import '../../../widgets/custom_auth_form.dart';

class AdminWorkTimeScreen extends StatelessWidget {
  final TimerController timerController = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: SizedBox(width: Get.width,height: Get.height,
            child: Image.asset(AppImage.background,fit: BoxFit.fill,),)),
          Column(
            children: [
              const CustomAppBarForm(
                text: AppText.workTimeSettings,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width:Get.width *.8,
                          height: Get.height *.15,
                          child: Lottie.asset(AppImage.json_timer)),
                      50.height,

                      Obx(() => CustomText(
                        text: '${AppText.currentStartTime.tr}: ${timerController.startTime.value.format(context)}',
                        fontSize: 18,
                        color: Colors.blue,
                      )),
                      10.height,
                      CustomButton.buttonStyle(
                          text: AppText.selectStartTime,
                          onPressed: () async {
                            TimeOfDay? selectedTime = await showTimePicker(
                              context: context,
                              initialTime: timerController.startTime.value,
                            );
                            if (selectedTime != null) {
                              timerController.startTime.value = selectedTime;
                            }
                          }),
                      30.height,
                      Obx(() => CustomText(
                        text: '${AppText.currentEndTime.tr}: ${timerController.endTime.value.format(context)}',
                        fontSize: 18,
                        color: Colors.blue,
                      )),
                      10.height,
                      CustomButton.buttonStyle(
                          text: AppText.selectEndTime,
                          onPressed: () async {
                            TimeOfDay? selectedTime = await showTimePicker(
                              context: context,
                              initialTime: timerController.endTime.value,
                            );
                            if (selectedTime != null) {
                              timerController.endTime.value = selectedTime;
                            }
                          }),
                      50.height,
                      CustomButton.buttonStyle(
                          width: Get.width * .3,
                          text: AppText.saveWorkTime,
                          onPressed: () async {
                            timerController.updateWorkTime(
                                timerController.startTime.value,
                                timerController.endTime.value);
                          }),
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
