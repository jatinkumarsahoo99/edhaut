import 'package:get/get.dart';

import '../controllers/forgotpin_controller.dart';

class ForgotpinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotpinController>(
      () => ForgotpinController(),
    );
  }
}
