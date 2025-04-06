import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/widgets/another_custom_widgets/custom_button.dart';
import 'package:hr/widgets/another_custom_widgets/custom_text.dart';
import 'package:lottie/lottie.dart';
import '../../../constants/constance.dart';
import '../../../controllers/admin/manage_requests_controller.dart';
import '../../../widgets/custom_auth_form.dart';

class ManageRequestsScreen extends StatefulWidget {
  @override
  State<ManageRequestsScreen> createState() => _ManageRequestsScreenState();
}

class _ManageRequestsScreenState extends State<ManageRequestsScreen> {
  bool check = true;

  @override
  Widget build(BuildContext context) {
    final ManageRequestsController controller = Get.put(ManageRequestsController());

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Image.asset(
                AppImage.background,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Column(
              children: [
                const CustomAppBarForm(
                  text: AppText.manageRequests, // Updated text
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton.buttonStyle(
                        text: AppText.leaveRequests, // Updated text
                        onPressed: () {
                          controller.setRequestType("leave");
                          setState(() {
                            check = true;
                          });
                        },
                        colorText: check ? Colors.white : Colors.black,
                        colorButton: check ? AppColor.primaryColor : Colors.white,
                        width: Get.width * .4,
                        height: Get.height * .07,
                        borderSize: 12,
                      ),
                      CustomButton.buttonStyle(
                        text: AppText.leaveOutRequests, // Updated text
                        onPressed: () {
                          controller.setRequestType("leave_out");
                          setState(() {
                            check = false;
                          });
                        },
                        colorText: !check ? Colors.white : Colors.black,
                        colorButton: !check ? AppColor.primaryColor : Colors.white,
                        width: Get.width * .4,
                        height: Get.height * .07,
                        borderSize: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * .2),
            child: Obx(() {
              if (controller.loading.value) {
                return Center(
                  child: Lottie.asset(AppImage.load),
                );
              }

              if (controller.leaveRequests.isEmpty) {
                return Center(
                  child: CustomText(
                    text: AppText.noRequests, // Updated text
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: controller.leaveRequests.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var request = controller.leaveRequests[index];
                  var requestId = request.id;
                  var data = request.data() as Map<String, dynamic>;

                  return Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: data['leaveType'] ?? AppText.requestTypeNotSpecified, // Updated text
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 8),
                        CustomText(
                          text: data['reason'] ?? AppText.requestReasonNotSpecified, // Updated text
                          fontSize: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: data['name'] ?? AppText.notSpecified, // Updated text
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                                CustomText(
                                  text: data['email'] ?? AppText.notSpecified, // Updated text
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                ElevatedButton.icon(
                                  icon: const Icon(Icons.check, color: Colors.white),
                                  label: CustomText(text: AppText.approve), // Updated text
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    textStyle: const TextStyle(fontSize: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () => controller.approveRequest(requestId),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton.icon(
                                  icon: const Icon(Icons.close, color: Colors.white),
                                  label: CustomText(text: AppText.reject), // Updated text
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    textStyle: const TextStyle(fontSize: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () => controller.rejectRequest(requestId),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
