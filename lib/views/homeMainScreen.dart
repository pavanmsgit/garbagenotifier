import 'package:flutter/material.dart';
import 'package:garbagenotifier/controllers/location_controller.dart';
import 'package:get/get.dart';
import 'package:garbagenotifier/const/appColors.dart';
import 'package:garbagenotifier/controllers/authController.dart';
import 'package:garbagenotifier/controllers/homeController.dart';
import 'package:garbagenotifier/preferences/userDataPrefs.dart';
import 'package:garbagenotifier/widgets/appBars.dart';
import 'package:garbagenotifier/widgets/appBottomNavBar.dart';
import 'package:garbagenotifier/widgets/spinner.dart';
import 'package:garbagenotifier/widgets/willPopBottomSheet.dart';
import 'package:permission_handler/permission_handler.dart';


class HomeScreenMain extends StatefulWidget {
  const HomeScreenMain({Key? key}) : super(key: key);

  @override
  State<HomeScreenMain> createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {
  final HomeController hc = Get.put(HomeController());

  getLocationPermissionOnStart() async {
    var status = await Permission.locationWhenInUse.status;

    print(status);
  }


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authController.getUserProfile();
      getLocationPermissionOnStart();
      locationController.getLocationPermission();
      locationController.getLatestAddress().whenComplete(() => true);

    });
    super.initState();
  }

  var email;

  checkPrefs()async{
    email = await UserData().getUserEmail();
    debugPrint("THIS IS USER PHONE NUMBER $email");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Spinner(
        child: Scaffold(
          backgroundColor: AppColor.tertiaryColor,

          body: Obx(
                () => hc.screens.elementAt(hc.selectedTab.value),
          ),

          bottomNavigationBar: const AppBottomNav(),

        ),
      ),
    );
  }
}
