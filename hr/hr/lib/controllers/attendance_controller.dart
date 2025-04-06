import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr/model/user_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hr/preferences.dart';

class AttendanceController extends GetxController {
  var currentPosition = Rx<Position?>(null);
  var currentAddress = ''.obs;
  var workStartTime = TimeOfDay(hour: 0, minute: 0).obs;
  var workEndTime = TimeOfDay(hour: 23, minute: 59).obs;
  var companyLocation = Rx<Position?>(null);
  var isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    Future.wait([
      getUserData(),
      getWorkTime(),
      getCompanyLocation(),
    ]);
  }

  UserModel userModel = UserModel();

  Future<void> getUserData() async {
    isLoading.value = true;
    try {
      userModel = await Preferences.getUser() ?? UserModel();
    } catch (e) {
      Get.snackbar('Error'.tr, 'failed_to_get_user_data'.tr.trParams({'error': e.toString()}));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getWorkTime() async {
    isLoading.value = true;
    try {
      var workTimeDoc = await FirebaseFirestore.instance
          .collection('work_time')
          .doc('admin')
          .get();
      if (workTimeDoc.exists) {
        var data = workTimeDoc.data();
        if (data != null) {
          String startHour = data['startHour'].toString();
          String startMinute = data['startMinute'].toString();
          String endHour = data['endHour'].toString();
          String endMinute = data['endMinute'].toString();

          workStartTime.value = _parseTime("$startHour:$startMinute");
          workEndTime.value = _parseTime("$endHour:$endMinute");
        }
      }
    } catch (e) {
      Get.snackbar('Error'.tr, 'failed_to_get_work_time'.tr.trParams({'error': e.toString()}));
    } finally {
      isLoading.value = false;
    }
  }

  TimeOfDay _parseTime(String timeStr) {
    final parts = timeStr.split(":");
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  Future<void> getCompanyLocation() async {
    isLoading.value = true;
    try {
      var companyLocationDoc = await FirebaseFirestore.instance
          .collection('location')
          .doc('company')
          .get();

      if (companyLocationDoc.exists) {
        var data = companyLocationDoc.data();
        if (data != null) {
          double? latitude = data['latitude']?.toDouble();
          double? longitude = data['longitude']?.toDouble();

          if (latitude != null && longitude != null) {
            companyLocation.value = Position(
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
            print("Company Location: $latitude, $longitude");
          } else {
            companyLocation.value = null;
            Get.snackbar('Error'.tr, 'invalid_company_location_data'.tr);
          }
        } else {
          companyLocation.value = null;
          Get.snackbar('Error'.tr, 'company_location_data_not_found'.tr);
        }
      } else {
        companyLocation.value = null;
        Get.snackbar('Error'.tr, 'company_location_document_not_found'.tr);
      }
    } catch (e) {
      print("Error fetching company location: $e");
      Get.snackbar('Error'.tr, 'failed_to_get_company_location'.tr.trParams({'error': e.toString()}));
      companyLocation.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCurrentLocation() async {
    isLoading.value = true;
    var status = await Permission.location.request();

    if (status.isGranted) {
      try {
        currentPosition.value = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        if (currentPosition.value != null) {
          currentAddress.value =
          "${currentPosition.value!.latitude}, ${currentPosition.value!.longitude}";
          print("Current Position: ${currentPosition.value!.latitude}, ${currentPosition.value!.longitude}");

          if (await isSameDayCheckIn() == false) {
            // Check if the user has already checked in today
            if (_isWithinWorkTime()) {
              if (_isNearCompanyLocation()) {
                await registerAttendance('checkIn');
              } else {
                Get.snackbar('Error'.tr, 'must_be_near_company_to_check_in'.tr);
              }
            } else {
              Get.snackbar('Error'.tr, 'can_only_check_in_during_work_hours'.tr);
            }
          } else {
            Get.snackbar('Error'.tr, 'You have already registered'.tr);
          }
        } else {
          Get.snackbar('Error'.tr, 'failed_to_get_current_position'.tr);
        }
      } catch (e) {
        print("Error getting current position: $e");
        Get.snackbar('Error'.tr, 'an_error_occurred_retrieving_current_location'.tr);
      }
    } else if (status.isDenied) {
      Get.snackbar('Error'.tr, 'please_grant_location_access_permission'.tr);
    } else if (status.isPermanentlyDenied) {
      Get.snackbar('Error'.tr, 'please_enable_location_access_in_phone_settings'.tr);
    }

    isLoading.value = false;
  }

  Future<bool> isSameDayCheckIn() async {
    var now = DateTime.now();
    var currentDate = DateTime(now.year, now.month, now.day);

    var checkInSnapshot = await FirebaseFirestore.instance
        .collection('attendance')
        .where('uid', isEqualTo: userModel.userId)
        .where('date', isEqualTo: currentDate.toIso8601String())
        .where('type', isEqualTo: 'checkIn')
        .get();

    return checkInSnapshot.docs.isNotEmpty;
  }
  Future<bool> isSameDayCheckIForLogout() async {
    var now = DateTime.now();
    var currentDate = DateTime(now.year, now.month, now.day);

    var checkInSnapshot = await FirebaseFirestore.instance
        .collection('leave_attendance')
        .where('uid', isEqualTo: userModel.userId)
        .where('date', isEqualTo: currentDate.toIso8601String())
        .where('type', isEqualTo: 'checkOut')
        .get();

    return checkInSnapshot.docs.isNotEmpty;
  }

  bool _isWithinWorkTime() {
    final now = TimeOfDay.now();
    return (now.hour > workStartTime.value.hour ||
        (now.hour == workStartTime.value.hour &&
            now.minute >= workStartTime.value.minute)) &&
        (now.hour < workEndTime.value.hour ||
            (now.hour == workEndTime.value.hour &&
                now.minute <= workEndTime.value.minute));
  }

  bool _isNearCompanyLocation() {
    if (companyLocation.value == null || currentPosition.value == null) {
      print("Company Location or Current Position is null");
      return false;
    }

    double companyLat = companyLocation.value!.latitude;
    double companyLng = companyLocation.value!.longitude;
    double currentLat = currentPosition.value!.latitude;
    double currentLng = currentPosition.value!.longitude;

    print("Company Location: Latitude: $companyLat, Longitude: $companyLng");
    print("Current Position: Latitude: $currentLat, Longitude: $currentLng");

    double distance = Geolocator.distanceBetween(
      companyLat,
      companyLng,
      currentLat,
      currentLng,
    );

    print("Calculated Distance: $distance meters");

    // Check if distance is within threshold
    bool isNear = distance <= 300.0;
    print("Is Near Company Location: $isNear");

    return isNear;
  }


  Future<void> checkOut() async {
    isLoading.value = true;
    var status = await Permission.location.request();

    if (status.isGranted) {
      try {
        currentPosition.value = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        if (currentPosition.value != null) {
          currentAddress.value =
          "${currentPosition.value!.latitude}, ${currentPosition.value!.longitude}";

          if (await isSameDayCheckIn() ) {
            if (_isWithinWorkTime() && _isNearCompanyLocation()) {
              if(await isSameDayCheckIForLogout()){
                Get.snackbar('Error'.tr, 'You are logged out today'.tr);
              }else{
                await registerAttendance('checkOut');
              }

            } else if (!_isNearCompanyLocation()) {
              Get.snackbar('Error'.tr, 'must_be_near_company_to_check_out'.tr);
            } else {
              Get.snackbar('Error'.tr, 'can_only_check_in_during_work_hours'.tr);
            }
          } else {
            Get.snackbar('Error'.tr, 'can_only_check_out_on_same_day'.tr);
          }
        } else {
          Get.snackbar('Error'.tr, ''.tr);
        }
      } catch (e) {
        print("Error getting current position: $e");
        Get.snackbar('Error'.tr, 'an_error_occurred_retrieving_current_location'.tr);
      }
    } else if (status.isDenied) {
      Get.snackbar('Error'.tr, 'please_grant_location_access_permission'.tr);
    } else if (status.isPermanentlyDenied) {
      Get.snackbar('Error'.tr, 'please_enable_location_access_in_phone_settings'.tr);
    }

    isLoading.value = false;
  }

  Future<void> registerAttendance(String type) async {
    try {
      String collectionName = type == 'checkOut' ? 'leave_attendance' : 'attendance';

      var now = DateTime.now();
      var currentDate = DateTime(now.year, now.month, now.day);

      if (type == 'checkOut') {
        var checkInSnapshot = await FirebaseFirestore.instance
            .collection('attendance')
            .where('uid', isEqualTo: userModel.userId)
            .where('date', isEqualTo: currentDate.toIso8601String())
            .where('type', isEqualTo: 'checkIn')
            .get();

        if (checkInSnapshot.docs.isNotEmpty) {
          await FirebaseFirestore.instance.collection(collectionName).add({
            'uid': userModel.userId,
            'date': currentDate.toIso8601String(),
            'time': now.toIso8601String(),
            'location': currentAddress.value,
            'type': 'checkOut',
          });

          Get.snackbar('Success'.tr, 'check_out_successful'.tr);
        } else {
          Get.snackbar('Error'.tr, 'no_check_in_record_found_for_today'.tr);
        }
      } else {
        await FirebaseFirestore.instance.collection(collectionName).add({
          'uid': userModel.userId,
          'date': currentDate.toIso8601String(),
          'time': now.toIso8601String(),
          'location': currentAddress.value,
          'type': 'checkIn',
        });

        Get.snackbar('Success'.tr, 'checked_in_successfully'.tr);
      }
    } catch (e) {
      Get.snackbar('Error'.tr, 'failed_to_register_attendance'.tr.trParams({'error': e.toString()}));
    }
  }

}
