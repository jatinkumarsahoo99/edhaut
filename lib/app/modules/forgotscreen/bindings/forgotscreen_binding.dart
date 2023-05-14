import 'package:get/get.dart';

import '../controllers/forgotscreen_controller.dart';

class ForgotscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotscreenController>(
      () => ForgotscreenController(),
    );
  }
}
