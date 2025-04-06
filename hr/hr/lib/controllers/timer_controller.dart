import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  var startTime = const TimeOfDay(hour: 9, minute: 0).obs; // Default start time
  var endTime = const TimeOfDay(hour: 17, minute: 0).obs; // Default end time

  var remainingHourTime = "".obs;
  var remainingMinuteTime = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchWorkTime(); // Fetch start and end time on initialization
  }

  Future<void> fetchWorkTime() async {
    try {
      var doc = await FirebaseFirestore.instance.collection('work_time').doc('admin').get();
      if (doc.exists) {
        startTime.value = TimeOfDay(
          hour: doc['startHour'],
          minute: doc['startMinute'],
        );
        endTime.value = TimeOfDay(
          hour: doc['endHour'],
          minute: doc['endMinute'],
        );

        _calculateTimeRemaining();
      }
    } catch (e) {
      Get.snackbar('Error'.tr, 'fetch_work_time_failed'.tr);
    }
  }

  void _calculateTimeRemaining() {
    final now = TimeOfDay.now();
    final endTimeInMinutes = endTime.value.hour * 60 + endTime.value.minute;
    final nowInMinutes = now.hour * 60 + now.minute;

    final remainingMinutes = endTimeInMinutes - nowInMinutes;

    if (remainingMinutes > 0) {
      remainingHourTime.value = (remainingMinutes ~/ 60).toString();
      remainingMinuteTime.value = (remainingMinutes % 60).toString();
    } else {
      remainingHourTime.value = "0";
      remainingMinuteTime.value = "0";
    }
  }

  Future<void> updateWorkTime(TimeOfDay newStartTime, TimeOfDay newEndTime) async {
    try {
      await FirebaseFirestore.instance.collection('work_time').doc('admin').set({
        'startHour': newStartTime.hour,
        'startMinute': newStartTime.minute,
        'endHour': newEndTime.hour,
        'endMinute': newEndTime.minute,
      });
      startTime.value = newStartTime;
      endTime.value = newEndTime;
      Get.snackbar('Success'.tr, 'work_time_updated_successfully'.tr);
      _calculateTimeRemaining(); // Recalculate remaining time after update
    } catch (e) {
      Get.snackbar('Error'.tr, 'update_work_time_failed'.tr);
    }
  }
}
