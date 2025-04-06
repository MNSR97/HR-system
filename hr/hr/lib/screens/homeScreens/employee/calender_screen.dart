import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/widgets/custom_auth_form.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../constants/constance.dart';
import '../../../controllers/calendar_controller.dart';
import '../../../widgets/another_custom_widgets/custom_text.dart';

class CalendarScreen extends StatelessWidget {
  final CalendarController controller = Get.put(CalendarController());

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
            ),
          ),
          Column(
            children: [
              CustomAppBarForm(text: AppText.calendar),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Obx(() => TableCalendar(
                        firstDay: DateTime.utc(2020, 1, 1),
                        lastDay: DateTime.utc(2030, 12, 31),
                        focusedDay: controller.focusedDay.value,
                        selectedDayPredicate: (day) {
                          return isSameDay(controller.selectedDay.value, day);
                        },
                        onDaySelected: controller.onDaySelected,
                      )),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Add new events
                        },
                        child: CustomText(text: AppText.addNewEvent),
                      ),
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
