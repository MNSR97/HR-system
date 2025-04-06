import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/constants/constance.dart';
import 'package:hr/screens/homeScreens/admin/admin_dashboard_screen.dart';
import 'package:hr/screens/homeScreens/admin/admin_profile_screen.dart';
import 'package:hr/screens/homeScreens/employee/profile_screen.dart';

import 'screens/homeScreens/employee/home_screen.dart';

class MyBottomNavigationBarScreen extends StatefulWidget {
  final bool admin;

  const MyBottomNavigationBarScreen({
    super.key,
    this.admin = false,
  });

  @override
  _MyBottomNavigationBarScreenState createState() =>
      _MyBottomNavigationBarScreenState();
}

class _MyBottomNavigationBarScreenState
    extends State<MyBottomNavigationBarScreen> {
  int _selectedIndex = 0;

  final _widgetOptions = [
     HomeScreen(),
    const ProfileScreen(), // Add profile screen option
  ];

  final _widgetOptionsAdmin = [
     AdminDashboardScreen(),
    const AdminProfileScreen(), // Add profile screen option
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widget.admin
            ? _widgetOptionsAdmin.elementAt(_selectedIndex)
            : _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SizedBox(
                width: Get.width * .05,
                height: Get.width * .05,
                child: Icon(
                  Icons.home,
                  size: 22,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SizedBox(
                width: Get.width * .05,
                height: Get.width * .05,
                child: Icon(
                  Icons.person,
                  size: 22,
                ),
              ),
              label: ''),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: AppColor.primaryColor.withOpacity(.2),
        selectedItemColor: AppColor.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
