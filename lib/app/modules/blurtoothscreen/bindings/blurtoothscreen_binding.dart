import 'package:get/get.dart';

import '../controllers/blurtoothscreen_controller.dart';

class BlurtoothscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlurtoothscreenController>(
      () => BlurtoothscreenController(),
    );
  }
}
