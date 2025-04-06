import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/preferences.dart';

class LeaveController extends GetxController {
  var leaveType = ''.obs;
  var leaveReason = ''.obs;
  var leaveOutRequests = <QueryDocumentSnapshot<Map<String, dynamic>>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLeaveOutRequests();
  }

  void updateLeaveType(String type) {
    leaveType.value = type;
  }

  void updateLeaveReason(String reason) {
    leaveReason.value = reason;
  }

  Future<void> submitLeaveRequest() async {
    var userId = await Preferences.getUserId();
    var token = await Preferences.getFCMToken();
    var name =
        "${await Preferences.getFirstName()} ${await Preferences.getLastName()}";
    var email = await Preferences.getEmail();
    var phone = await Preferences.getPhone();
    await FirebaseFirestore.instance.collection('leave_requests').add({
      'uid': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'leaveType': leaveType.value,
      'reason': leaveReason.value,
      'timestamp': FieldValue.serverTimestamp(),
      'status': 'pending',
      'token': token,
    });

    Get.snackbar('Success'.tr, 'leave_request_submitted_successfully'.tr);
  }

  Future<void> submitLeaveOutRequest() async {
    var userId = await Preferences.getUserId();
    var token = await Preferences.getFCMToken();
    var name =
        "${await Preferences.getFirstName()} ${await Preferences.getLastName()}";
    var email = await Preferences.getEmail();
    var phone = await Preferences.getPhone();
    await FirebaseFirestore.instance.collection('leave_out_requests').add({
      'name': name,
      'email': email,
      'phone': phone,
      'uid': userId,
      'leaveType': leaveType.value,
      'reason': leaveReason.value,
      'timestamp': FieldValue.serverTimestamp(),
      'status': 'pending',
      'token': token,
    });

    Get.snackbar('Success'.tr, 'leave_out_request_submitted_successfully'.tr);
  }

  Future<void> fetchLeaveOutRequests() async {
    var snapshot =
    await FirebaseFirestore.instance.collection('leave_out_requests').get();
    leaveOutRequests.value = snapshot.docs;
  }
}
