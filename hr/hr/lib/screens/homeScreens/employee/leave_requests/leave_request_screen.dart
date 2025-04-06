import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/helper/extentions.dart';
import 'package:hr/widgets/another_custom_widgets/custom_button.dart';
import 'package:hr/widgets/another_custom_widgets/custom_text_form_fiald.dart';
import 'package:hr/widgets/another_custom_widgets/custom_textformfield.dart';
import '../../../../constants/constance.dart';
import '../../../../controllers/leave_controller.dart';
import '../../../../widgets/custom_auth_form.dart';

class LeaveRequestScreen extends StatefulWidget {
  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  TextEditingController typeController = TextEditingController();

  TextEditingController resoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool validateType = true;

  bool validateResone = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: GetBuilder<LeaveController>(
            init: LeaveController(),
            builder: (controller) {
              return Stack(
                children: [
                  Positioned.fill(
                      child: SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: Image.asset(
                          AppImage.background,
                          fit: BoxFit.fill,
                        ),
                      )),
                  Column(
                    children: [
                      // Wrap only the TextField widgets with Obx
                      CustomAppBarForm(text: AppText.leaveRequests),
                      10.height,
                      customTextFormFiald(
                          controller: typeController,
                          validate: validateType,
                          onChanged: (value) =>
                              controller.updateLeaveType(value),
                          validator: (value) {
                            setState(() {
                              validateType = value.isNotEmpty;
                            });
                            if (value.isEmpty) {
                              return "";
                            }
                            return null;
                          },
                          hintText: AppText.leaveType),

                      16.height, // Add space between the fields

                      customTextFormFiald(
                          controller: resoneController,
                          validate: validateResone,
                          question: true,
                          onChanged: (value) =>
                              controller.updateLeaveReason(value),
                          validator: (value) {
                            setState(() {
                              validateResone = value.isNotEmpty;
                            });
                            if (value.isEmpty) {
                              return "";
                            }
                            return null;
                          },
                          hintText: AppText.leaveReason),
                      30.height,
                      CustomButton.buttonStyle(
                        text: AppText.submitRequest,
                        width: Get.width * .4,
                        height: Get.height * .04,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.submitLeaveRequest();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
