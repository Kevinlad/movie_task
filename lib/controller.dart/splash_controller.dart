import 'package:get/get.dart';
import 'dart:async';

import 'package:movie_task/bottom_navigation/bottom_navigation.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 3), () {
      Get.to(BottomBar());
    });
  }
}
