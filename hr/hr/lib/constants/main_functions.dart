import 'package:flutter/material.dart';
import 'package:get/get.dart';


void navigate(context, navigateTo, bool inableBack) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => navigateTo,
    ),
    (route) => inableBack,
  );
}

