import 'package:flutter/material.dart';
import 'package:garbagenotifier/const/appColors.dart';
import 'package:garbagenotifier/const/appImages.dart';
import 'package:garbagenotifier/const/screen_size.dart';
import 'package:garbagenotifier/controllers/authController.dart';
import 'package:permission_handler/permission_handler.dart';

import '../controllers/location_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  getLocationPermissionOnStart() async {
    var status = await Permission.locationWhenInUse.status;

    print(status);
  }

  @override
  Widget build(BuildContext context) {
    ///CHECKS AUTHENTICATION STATUS
    authController.checkAuth();
    authController.getUserProfile();
    locationController.getLocationPermission();
    locationController.getLatestAddress();
    getLocationPermissionOnStart();

    return Scaffold(

      body: Container(
        color: AppColor.tertiaryColor,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(),
            Expanded(
              child:CircleAvatar(
                backgroundColor: AppColor.tertiaryColor,
                radius: ScreenSize.width(context) * 0.25,
                child: Center(
                  child: Image.asset(
                    AppImages.appLogo,
                    height: ScreenSize.height(context) * 0.25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
