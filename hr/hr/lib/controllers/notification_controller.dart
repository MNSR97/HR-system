import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/preferences.dart';

class NotificationController extends GetxController {
  var notifications = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    try {
      String userId = await Preferences.getUserId();
      // Fetch notifications for the current user only
      var snapshot = await FirebaseFirestore.instance
          .collection('notifications')
          .where('userId', isEqualTo: userId)
          .get();

      notifications.value = snapshot.docs.map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>}).toList();
    } catch (e) {
      Get.snackbar('Error'.tr, 'fetch_notifications_failed'.tr);
    }
  }

  Future<void> deleteNotification(String notificationId) async {
    try {
      // Delete the notification from Firestore
      await FirebaseFirestore.instance
          .collection('notifications')
          .doc(notificationId)
          .delete();

      // Update the list after deletion
      notifications.removeWhere((notification) => notification['id'] == notificationId);
      Get.snackbar('Success'.tr, 'notification_deleted_successfully'.tr);
    } catch (e) {
      Get.snackbar('Error'.tr, 'delete_notification_failed'.tr);
    }
  }
}
