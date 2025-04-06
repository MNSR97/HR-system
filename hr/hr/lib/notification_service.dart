import 'dart:convert';
import 'package:get/get.dart';
import 'package:hr/preferences.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationService {
  final String projectId = 'hradmin-ff6f6';
  final String clientEmail =
      'firebase-adminsdk-g2cye@hradmin-ff6f6.iam.gserviceaccount.com';
  final String privateKey =  "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC8aOnWgBqYciok\niMzlBIiYKlSMpDcRrJUOeAllmr043HGuVhc3agRt1L2urVofCExwwOWpHSJLpSPL\nk2X/FfVQY+4Plx9U1EDWVpxESVlXpnMSSiEviK49K/5rd2r0Mwx5GW1gOXe5RLSl\n3b57S0sgR/mH7Exh035xe1FFCFHbLvK0axoDha9fYaPXclhAeP+ymJOQJVv8SxAL\nsAxyG0/RVO34P4BOGGkP/U/gZPG/EeteZMPauX7jn96KM7XdTJs5XWIoNv9vhrTi\nO16VZWm9UJDi5dfpPOyMEypCsEIe9yqeLJEjtKeZF2l3ZRNetxWqnWJz7kVfmtec\nAXgJ/LcRAgMBAAECggEABXO1/gz0kBAgKfDbOH6VRw11B0GWfhx/zvSQZYw48Ob4\no2xGdVYcGRNGlqIZrTOV1i6vyqEvIZAemTzLfxpbIBuXK0RyzbcrZeRpVtTGSQH2\nGxux6oSmkZq2/NQ+oCDEyfGPW6EoFrBvN4xDT4EsFCvfA7TV2EAY7ObeEPzC1SBB\nnoTTOcCW9weDQH/Z25VN/+Qex7ID6EQfpHjZz24AM/uqPJxMl41gd8eBdDjo7ITu\nwm52fn8Ekx3GoK4Fo54ks2NkglufkvXWT3lnxcgeXgFZaf/n8+x1CcMRJxDQPzMJ\nbhbU/frXAIDqay07GNsy+VDXvPiVyeMK97A9X5T3QQKBgQD/jS08J1mpT0IeX38/\nyGk09xHmI+UAZV2odAeb4MGrQFQeweDmlmx63GvcdnX8j1sfFvLGiEO7Vne2jprt\nrj63rsDEfJNzG1493dqGGCnou9hr132NYpB8sOKhQ5nApyaBhd4pJ2RWSUvUWXqH\noEA30sZjaEl2N9mtktXwt7NfUQKBgQC8vZGlQUvCWXWdi7YzXb31wEKGzo9lvCE6\nUvlrvwcPyvT8KRxAOOlskrkHy8koX79mUinwtMGism0Co4VeLCoZ1j6CDE65fzTf\nbG0p9tBi3Gb4PWc8B3l96GM1yFQpkirVTdQCjJcOCCs7vbUNir10m6aPtDPdDfoz\nQoVul3trwQKBgHpzgGhhhqINO2ZoZgX/FwJtHSOEsZd1+uHb70Vu9f4EDgrK5eQ3\n0fUxJ3H1RWXmn0gPa/dblfDvZt+QB4a6Ro0nbHD6LIEsbQUCCFLWw0YktHhAQoX7\n47YL4Bxb0xGwRlAsAB8CJB8AchhnY8IXNI5LLgq2DvVZn7F/OYply8pxAoGAW2Bo\nEBrhw9Et6T2H06yR2FXhn4SH1lhTufoL+Yc9sv6uxxpcLBeho0gRvt2BoUNh1fb3\niSrqCIvbzQg//IzjQSkBkFLHFnWosna7DzMIRqSwUYTg4yY3QqbsyVAYtxumEykf\n+K/6PffkfoLlEg5WlQr6g95Zsa8fsAuHsDg0r8ECgYEA40F3gCXkMdJw+NTJL2Ap\nmyYsav9X3yS4cXGQJSMAdQpmn3Nwd27hqZZuDBpewElVBEP4XUgfOdCdjFVZuXyF\nu17ucALEbg8l/vUKVkXunlDYgQutHoF6eBlZwwHH2k5b2T7ZltBCBe98IfDb+hsO\nuWHEiXyu9kz2sKXuSiTi400=\n-----END PRIVATE KEY-----\n";
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendNotificationToAll({required String title, required String body}) async {
    try {
      // Fetch all FCM tokens from Firestore
      var snapshot = await _firestore.collection('employee').get();
      final tokens = snapshot.docs
          .map((doc) => {
        'token': doc.data()['token'] as String?,
        'userId': doc.id, // Assuming userId is the document ID, which is a String
      })
          .where((entry) => entry['token'] != null)
          .toList();

      // إرسال الإشعار لكل مستخدم وحفظه في مجموعة notifications
      for (var entry in tokens) {
        var token = entry['token'] as String?;
        var userId = entry['userId'] as String;


        // تأكد من أن token ليس فارغًا وأنه ليس هو نفس token الحالي
        if (token != null && token.isNotEmpty) {
          await sendNotification(title: title, body: body, fcmToken: token);
          await _firestore.collection('notifications').add({
            'title': title,
            'body': body,
            'userId': userId,
            'date': DateTime.now().toIso8601String(), // إضافة التاريخ والوقت
          });
        }
      }
      Get.snackbar('تم الإرسال', 'تم إرسال الإشعار بنجاح');
      print('Notification sent to all users and saved in Firestore.');
    } catch (e) {
      Get.snackbar('فشل في الإرسال', 'فشل في إرسال الإشعارات: $e');
      print('Failed to send notifications: $e');
    }
  }

  Future<void> sendNotification({required String title, required String body, required String fcmToken}) async {
    if (fcmToken == "") {
      return;
    }
    final String endpoint =
        'https://fcm.googleapis.com/v1/projects/$projectId/messages:send';

    final accountCredentials = ServiceAccountCredentials(
      clientEmail,
      ClientId('', ''),
      privateKey,
    );

    final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    final httpClient = await clientViaServiceAccount(accountCredentials, scopes);

    final Map<String, dynamic> notification = {
      'title': title,
      'body': body,
    };

    final Map<String, dynamic> message = {
      'message': {
        'token': fcmToken,
        'notification': notification,
      }
    };

    final response = await httpClient.post(
      Uri.parse(endpoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification: ${response.statusCode}');
      print('Response: ${response.body}');
    }

    httpClient.close();
  }
}
