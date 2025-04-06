import 'package:get/get.dart';
import '../controllers/admin/location_company_controller.dart';
import '../controllers/admin/manage_requests_controller.dart';
import '../controllers/attendance_controller.dart';
import '../controllers/language_controller.dart';
import '../controllers/leave_controller.dart';
import '../controllers/timer_controller.dart';
import '../controllers/calendar_controller.dart';
import '../controllers/notification_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendanceController());
    Get.lazyPut(() => LeaveController());
    Get.lazyPut(() => TimerController());
    Get.lazyPut(() => CalendarController());
    Get.lazyPut(() => NotificationController());
    Get.lazyPut(() => LanguageController());
    Get.lazyPut(() => ManageRequestsController());


  }
}
