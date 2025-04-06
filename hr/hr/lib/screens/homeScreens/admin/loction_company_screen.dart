import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hr/controllers/admin/location_company_controller.dart';
import 'package:hr/widgets/another_custom_widgets/custom_button.dart';
import '../../../constants/constance.dart';
import '../../../widgets/custom_auth_form.dart';

class LoctionCompanyScreen extends StatefulWidget {
  @override
  State<LoctionCompanyScreen> createState() => _LoctionCompanyScreenState();
}

class _LoctionCompanyScreenState extends State<LoctionCompanyScreen> {
  final LocationCompanyController controller =
  Get.put(LocationCompanyController());

  TextEditingController locationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              const CustomAppBarForm(
                text: AppText.location, // Updated text
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: locationController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: AppText.enterCompanyLocation.tr, // Updated text
                          ),
                          onChanged: (value) {
                            controller.location.value = value;
                            locationController.text = value;
                            setState(() {});
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppText.addLocation.tr; // Updated text
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        CustomButton.buttonStyle(
                          text: AppText.saveLocation.tr, // Updated text
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              var locationText = locationController.text;
                              // تقسيم النص باستخدام الفاصلة
                              var locationParts = locationText.split(',');
                              print("location : $locationText");

                              if (locationParts.length == 2) {
                                try {
                                  double latitude = double.parse(locationParts[0]);
                                  double longitude = double.parse(locationParts[1]);

                                  Position position = Position(
                                    latitude: latitude,
                                    longitude: longitude,
                                    accuracy: 0.0,
                                    altitude: 0.0,
                                    altitudeAccuracy: 0.0,
                                    heading: 0.0,
                                    headingAccuracy: 0.0,
                                    speed: 0.0,
                                    speedAccuracy: 0.0,
                                    timestamp: DateTime.now(),
                                  );

                                  controller.updateLocation(position);
                                } catch (e) {
                                  // عرض رسالة خطأ إذا كان تنسيق الموقع غير صحيح
                                  Get.snackbar(
                                    AppText.error.tr, // تأكد من أن "AppText.error" موجودة في ملف الترجمة
                                    AppText.invalidLocationFormat.tr, // تأكد من أن "AppText.invalidLocationFormat" موجودة في ملف الترجمة
                                  );
                                }
                              } else {
                                // عرض رسالة خطأ إذا كان عدد الأجزاء في النص غير صحيح
                                Get.snackbar(
                                  AppText.error.tr, // تأكد من أن "AppText.error" موجودة في ملف الترجمة
                                  AppText.locationFormat.tr, // تأكد من أن "AppText.locationFormat" موجودة في ملف الترجمة
                                );
                              }
                            }

                          },
                        ),

                       const SizedBox(height: 20),
                        CustomButton.buttonStyle(
                          text: AppText.getCurrentLocation.tr, // Updated text
                          onPressed: () async {
                            await controller.getCurrentLocation();
                            locationController.text = controller.location.value;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
