import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/helper/extentions.dart';
import 'package:hr/widgets/custom_auth_form.dart';
import '../../../constants/constance.dart';
import '../../../widgets/another_custom_widgets/custom_text.dart';
import '../employee/work_timer_screen.dart';
import 'add_work_time.dart';
import 'loction_company_screen.dart';
import 'manage_requests_screen.dart';
import 'admin_notifications_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _screens = [
    {
      'title': AppText.addCompanyLocation,
      'icon': AppImage.location,
      'screen': LoctionCompanyScreen(),
    },

    {
      'title': AppText.manageRequests,
      'icon':  AppImage.order,
      'screen': ManageRequestsScreen(),
    },
    {
      'title': AppText.notifications,
      'icon': AppImage.notification,
      'screen': AdminNotificationsScreen(),
    },
    {
      'title': AppText.addWorkTime,
      'icon': AppImage.timer,
      'screen': AdminWorkTimeScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: SizedBox(width: Get.width,height: Get.height,
            child: Image.asset(AppImage.background,fit: BoxFit.fill,),)),
          Column(
            children: [
               CustomAppBarForm(text: AppText.adminDashboard,),
              Expanded(
                child: Container(
                  //  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    itemCount: _screens.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns in the grid
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.5, // Aspect ratio for grid items
                    ),
                    itemBuilder: (context, index) {
                      final screen = _screens[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(screen['screen']);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor.withOpacity(0.008),
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.blueAccent, width: 2.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(screen['icon'])),

                              10.height,
                              CustomText(
                                text :screen['title'],
                                fontSize: 16.0,
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
