import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/constants/constance.dart';
import 'package:hr/helper/extentions.dart';
import 'package:hr/preferences.dart';
import 'package:hr/widgets/another_custom_widgets/custom_text.dart';

import '../../../controllers/language_controller.dart';
import '../../../view_model/auth_view_model.dart';
import '../../../widgets/custom_auth_form.dart';
import '../../../widgets/custom_profile_lists/custom_profile_list.dart';
import '../../authScreen/change_passwored.dart';
import '../edit_profile_screen.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthViewModel>(
          init: AuthViewModel(),
          builder: (authViewModel) {
            authViewModel.getShared();
            final user =
                authViewModel; // Assuming you have a user model in AuthViewModel

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
                    const CustomAppBarForm(text: AppText.profile), // Updated text
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                    width: 35,
                                    height: 35,
                                    child: Image.asset(AppImage.user)),
                                10.width,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: user.name, // Display user name
                                      fontSize: 22.0,
                                      fontFamily: "Edu-Regular",
                                      fontWeight: FontWeight.w500,
                                    ),
                                    3.height,
                                    CustomText(
                                      text: user.email, // Display user email
                                      fontSize: 12.0,
                                      fontFamily: "Edu-Regular",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            50.height,
                            CustomProfileList(
                              text: AppText.editProfile, // Updated text
                              icon: AppImage.edit,
                              onTap: () {
                                Get.to(const EditProfileScreen());
                              },
                            ),

                            CustomProfileList(
                              text: AppText.changePassword, // Updated text
                              icon: AppImage.changePassword,
                              onTap: () {
                                Get.to(const ChangePasswored());
                              },
                            ),
                            CustomProfileList(
                              text: AppText.logout, // Updated text
                              icon: AppImage.exit,
                              onTap: () {
                                Preferences.logout();
                              },
                            ),
                            10.height,
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.primaryColor),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: ListTile(
                                title: Row(
                                  children: [
                                    // Add your translation-related text here
                                    CustomText(text: AppText.language),
                                    const Spacer(),
                                    DropdownButton<String>(
                                      value: Get.locale?.languageCode,
                                      items:  [
                                        DropdownMenuItem(
                                          value: 'en',
                                          child: CustomText(text:'English'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'ar',
                                          child: CustomText(text:'العربية'),
                                        ),
                                      ],
                                      onChanged: (locale) {
                                        if (locale != null) {
                                          Get.find<LanguageController>().changeLanguage(locale);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
