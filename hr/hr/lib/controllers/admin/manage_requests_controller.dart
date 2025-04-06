import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hr/helper/extentions.dart';
import '../../notification_service.dart';

class ManageRequestsController extends GetxController {
  var leaveRequests = <DocumentSnapshot>[].obs;
  var leaveRequestsType = 'leave'; // 'leave' for leave requests, 'leave_out' for leave out requests

  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRequests();
  }

  void setRequestType(String type) {
    leaveRequestsType = type;
    fetchRequests();
  }

  void fetchRequests() async {
    var collection = FirebaseFirestore.instance.collection(
        leaveRequestsType == 'leave' ? 'leave_requests' : 'leave_out_requests'
    );

    try {
      var snapshot = await collection.get();
      leaveRequests.value = snapshot.docs;
    } catch (e) {
      print('Error fetching requests: $e');
      snackbar('Error'.tr, 'failed_to_fetch_requests'.trParams({'error': e.toString()}));
    }
  }

  Future<void> approveRequest(String requestId) async {
    loading.value = true;

    var collection = FirebaseFirestore.instance.collection(
        leaveRequestsType == 'leave' ? 'leave_requests' : 'leave_out_requests'
    );

    try {
      var doc = await collection.doc(requestId).get();
      var data = doc.data() as Map<String, dynamic>?;

      if (data == null) {
        snackbar('Error'.tr, 'error_no_data_found'.tr);
        return;
      }

      // Update the request status
      await collection.doc(requestId).update({
        'status': 'approved',
      });

      NotificationService notificationService = NotificationService();

      // Send notification if token is available
      var fcmToken = data['token'];
      if (fcmToken != null && fcmToken.isNotEmpty) {
        final FirebaseFirestore _firestore = FirebaseFirestore.instance;

        await _firestore.collection('notifications').add({
          'title': ''.tr,
          'body': 'request_approved_successfully'.tr,
          'userId': data['uid'],
          'date': DateTime.now().toIso8601String(),
        });

        await notificationService.sendNotification(
          title: ''.tr,
          body: 'request_approved_successfully'.tr,
          fcmToken: fcmToken,
        );
      } else {
        snackbar('Warning'.tr, 'notification_send_failed'.tr);
      }

      // Delete the request
      await collection.doc(requestId).delete();

      fetchRequests();
      snackbar('Success'.tr, 'request_approved_successfully'.tr);
    } catch (e) {
      print('Error approving request: $e');
      snackbar('Error'.tr, 'failed_to_approve_request'.trParams({'error': e.toString()}));
    } finally {
      loading.value = false;
    }
  }

  Future<void> rejectRequest(String requestId) async {
    loading.value = true;
    var collection = FirebaseFirestore.instance.collection(
        leaveRequestsType == 'leave' ? 'leave_requests' : 'leave_out_requests'
    );

    try {
      var doc = await collection.doc(requestId).get();
      var data = doc.data() as Map<String, dynamic>?;

      if (data == null) {
        snackbar('Error'.tr, 'error_no_data_found'.tr);
        return;
      }

      // Update the request status
      await collection.doc(requestId).update({
        'status': 'rejected',
      });

      NotificationService notificationService = NotificationService();

      // Send notification if token is available
      var fcmToken = data['token'];
      if (fcmToken != null && fcmToken.isNotEmpty) {
        final FirebaseFirestore _firestore = FirebaseFirestore.instance;

        await _firestore.collection('notifications').add({
          'title': '',
          'body': 'failed_to_approve_request'.tr,
          'userId': data['uid'],
          'date': DateTime.now().toIso8601String(),
        });

        await notificationService.sendNotification(
          title:  '',
          body: 'failed_to_approve_request'.tr,
          fcmToken: fcmToken,
        );
      } else {
        snackbar('Warning'.tr, 'notification_send_failed'.tr);
      }

      // Delete the request
      await collection.doc(requestId).delete();

      fetchRequests();
      snackbar('Success'.tr, 'request_rejected_successfully'.tr);
    } catch (e) {
      print('Error rejecting request: $e');
      snackbar('Error'.tr, 'failed_to_reject_request'.trParams({'error': e.toString()}));
    } finally {
      loading.value = false;
    }
  }
}
