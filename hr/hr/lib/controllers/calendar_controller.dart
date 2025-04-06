import 'package:get/get.dart';

class CalendarController extends GetxController {
  var focusedDay = DateTime.now().obs;
  var selectedDay = Rx<DateTime?>(null);

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
  }

// يمكنك إضافة منطق لإدارة أحداث التقويم هنا
}
