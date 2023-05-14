import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
   SplashscreenView({Key? key}) : super(key: key);
  SplashscreenController controller = Get.find<SplashscreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFECFAF),
      body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/logo.jpg',fit: BoxFit.fill),
          )
      ),
    );
  }
}
