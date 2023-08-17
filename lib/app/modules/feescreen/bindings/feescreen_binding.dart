import 'package:get/get.dart';

import '../controllers/feescreen_controller.dart';

class FeescreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeescreenController>(
      () => FeescreenController(),
    );
  }
}
