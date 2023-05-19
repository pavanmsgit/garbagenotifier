
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:garbagenotifier/models/posters.dart';
import 'package:get/get.dart';

import '../services/posterService.dart';

final PosterController posterController = Get.find<PosterController>();

class PosterController extends GetxController {

  List<Posters> poster = [];
  PosterService posterService = PosterService();

  ///UPDATES LIST NEWS ITEM
  getPosters() async {
    poster = await posterService.allPosters();
    update();
  }


}
