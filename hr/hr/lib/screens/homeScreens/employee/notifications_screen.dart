import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/notification_controller.dart';
import '../../../notification_service.dart';
import '../../../widgets/another_custom_widgets/custom_text.dart';
import '../../../widgets/custom_auth_form.dart';
import '../../../constants/constance.dart';

class NotificationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (controller) {
        return Scaffold(
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Stack(
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
                    text: AppText.notifications,
                  ),
                ),
                Positioned(
                  top: 100,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Obx(() {
                    if (controller.notifications.isEmpty) {
                      return Center(
                        child: CustomText(
                          text: AppText.noNotifications,
                          fontSize: 20,
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: controller.notifications.length,
                      itemBuilder: (context, index) {
                        var notification = controller.notifications[index];
                        var notificationId = notification['id'] ?? '';

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            title: CustomText(
                              text: notification['title'] ?? 'No Title',
                            ),
                            subtitle: CustomText(
                              text: notification['body'] ?? 'No Message',
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomText(
                                  text: notification['date'] ?? '',
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    _showDeleteConfirmationDialog(context, notificationId, controller);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String notificationId, NotificationController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText(text: AppText.deleteConfirmationTitle),
          content: CustomText(text: AppText.deleteConfirmationContent),
          actions: [
            TextButton(
              child: CustomText(text: AppText.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: CustomText(text: AppText.delete),
              onPressed: () {
                controller.deleteNotification(notificationId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
