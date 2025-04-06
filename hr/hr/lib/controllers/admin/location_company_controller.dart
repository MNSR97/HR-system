import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hr/helper/extentions.dart';

import '../../constants/main_functions.dart';

class LocationCompanyController extends GetxController {
  var location = ''.obs;

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      snackbar(
        'Error'.tr,
        'location_services_disabled'.tr,
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        snackbar(
          'Error'.tr,
          'location_permissions_denied'.tr,
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      snackbar(
        'Error'.tr,
        'location_permissions_denied_forever'.tr,
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    location.value = '${position.latitude}, ${position.longitude}'; // Update to use comma for separation

    updateLocation(position); // Call updateLocation to save the position to Firestore
  }

  void updateLocation(Position position) {
    // Check if position is null
    if (position == null) {
      snackbar(
        'Error'.tr,
        'invalid_position_data'.tr,
      );
      return;
    }

    // Save the location to Firestore
    FirebaseFirestore.instance.collection('location').doc('company').set({
      'latitude': position.latitude,
      'longitude': position.longitude,
    }).then((_) {
      snackbar(
        'Success'.tr,
        'location_updated_successfully'.tr,
      );
    }).catchError((error) {
      snackbar(
        'Error'.tr,
        'failed_to_update_location'.trParams({'error': error.toString()}),
      );
    });
  }


}
