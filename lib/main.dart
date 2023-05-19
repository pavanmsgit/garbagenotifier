import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:garbagenotifier/const/appColors.dart';
import 'package:garbagenotifier/controllers/authController.dart';
import 'package:garbagenotifier/controllers/launch_controller.dart';
import 'package:garbagenotifier/controllers/posterController.dart';
import 'package:garbagenotifier/controllers/itemsController.dart';
import 'package:garbagenotifier/views/splash_screen.dart';
import 'package:garbagenotifier/widgets/willPopBottomSheet.dart';
import 'controllers/homeController.dart';
import 'controllers/location_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GetStorage.init();

  Get.put(AuthController());
  Get.put(HomeController());
  Get.put(LocationController());
  Get.put(ItemsController());
  Get.put(LaunchController());
  Get.put(PosterController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    // final pushNotificationService = NotificationService(firebaseMessaging);
    // pushNotificationService.initialise();

    return WillPopScope(
      onWillPop: () => onWillPop(context),

      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Garbage Notifier',
        color: AppColor.primaryColor,
        theme: ThemeData(
          primaryColor: AppColor.primaryColor,
          appBarTheme:const AppBarTheme(
            backgroundColor: Colors.black,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}


