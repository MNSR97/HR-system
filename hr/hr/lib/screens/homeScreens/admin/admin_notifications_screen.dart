import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/helper/extentions.dart';
import 'package:hr/widgets/another_custom_widgets/custom_text.dart';
import '../../../constants/constance.dart';
import '../../../widgets/custom_auth_form.dart';
import '../../../controllers/notification_controller.dart';
import '../../../notification_service.dart';

class AdminNotificationsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (controller) {
        controller.fetchNotifications();
        return Scaffold(
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                Expanded(
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
                        left: 16,
                        right: 16,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: titleController,
                                decoration: InputDecoration(
                                  labelText: AppText.notificationTitle.tr,
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppText.enterNotificationTitle;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: bodyController,
                                decoration: InputDecoration(
                                  labelText: AppText.notificationBody.tr,
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppText.enterNotificationBody;
                                  }
                                  return null;
                                },
                                maxLines: 3,
                              ),
                              const SizedBox(height: 32),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await NotificationService().sendNotificationToAll(
                                      title: titleController.text,
                                      body: bodyController.text,
                                    );
                                  }
                                },
                                child: CustomText(text: AppText.sendNotification),
                              ),
                              50.height,
                              Obx(() {
                                if (controller.notifications.isEmpty) {
                                  return Center(
                                    child: CustomText(
                                      text: AppText.noNotifications,
                                      fontSize: 20,
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(16.0),
                                  itemCount: controller.notifications.length,
                                  itemBuilder: (context, index) {
                                    var notification = controller.notifications[index];
                                    return Card(
                                      child: ListTile(
                                        title: CustomText(
                                          text: notification['title'] ?? AppText.noTitle,
                                        ),
                                        subtitle: CustomText(
                                          text: notification['body'] ?? AppText.noMessage,
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
                                                Get.defaultDialog(
                                                  title: AppText.confirmDeletion,
                                                  content: CustomText(
                                                      text: AppText.confirmDeleteNotification),
                                                  confirm: ElevatedButton(
                                                    onPressed: () async {
                                                      await controller.deleteNotification(
                                                          notification['id']);
                                                      Get.back(); // Close the dialog
                                                    },
                                                    child: CustomText(text: AppText.delete),
                                                  ),
                                                  cancel: ElevatedButton(
                                                    onPressed: () {
                                                      Get.back(); // Close the dialog
                                                    },
                                                    child: CustomText(text: AppText.cancel),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
