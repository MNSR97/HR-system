import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../splash_services.dart';
import 'package:hr/constants/constance.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isOnline = true;
  SplashServices splashServices = Get.put(SplashServices());
  // CategoryViewModel categoryViewModel = Get.put(CategoryViewModel());
  // VendorViewModel vendorViewModel = Get.put(VendorViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.splash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColorWhite,
      body: GetBuilder<SplashServices>(
        init: SplashServices(),
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              AppImage.logo,
              width: Get.width * .4,
              height: Get.width * .4,
            )),
          ],
        ),
      ),
    );
  }
}
