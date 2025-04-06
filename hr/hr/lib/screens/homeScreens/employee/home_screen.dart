import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/helper/extentions.dart';
import 'package:hr/screens/homeScreens/employee/leave_requests/leave_out_request_screen.dart';
import 'package:hr/screens/homeScreens/employee/notifications_screen.dart';
import 'package:hr/view_model/auth_view_model.dart';
import 'package:hr/widgets/custom_auth_form.dart';
import '../../../constants/constance.dart';
import '../../../widgets/another_custom_widgets/custom_text.dart';
import 'attendance/attendance_screen.dart';
import 'attendance/checkout_screen.dart';
import 'calender_screen.dart';
import 'leave_requests/leave_request_screen.dart';
import 'work_timer_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _screens = [
    {
      'title': AppText.attendance,
      'icon': AppImage.attendance,
      'screen': AttendanceScreen(),
    },
    {
      'title': AppText.checkOut,
      'icon': AppImage.exit,
      'screen': CheckOutScreen(),
    },
    {
      'title': AppText.leaveRequest,
      'icon': AppImage.worksheet,
      'screen': LeaveRequestScreen(),
    },
    {
      'title': AppText.leaveOutRequest,
      'icon': AppImage.worksheet,
      'screen': LeaveOutRequestsScreen(),
    },
    {
      'title': AppText.workTimer,
      'icon': AppImage.timer,
      'screen': WorkTimerScreen(),
    },
    // Uncomment and add CalendarScreen when needed
    // {
    //   'title': AppText.calendar,
    //   'icon': Icons.calendar_today,
    //   'screen': CalendarScreen(),
    // },
    {
      'title': AppText.notifications,
      'icon': AppImage.notification,
      'screen': NotificationScreen(),
    },
  ];

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
            ),
          ),
          Column(
            children: [
              CustomAppBarForm(
                text: AppText.homeScreen,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
                  child: GridView.builder(
                    itemCount: _screens.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns in the grid
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.5, // Aspect ratio of items
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
                            border: Border.all(
                              color: Colors.blueAccent,
                              width: 1.20,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: Image.asset(screen['icon']),
                              ),
                              10.height,
                              CustomText(
                                text: screen['title'],
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
