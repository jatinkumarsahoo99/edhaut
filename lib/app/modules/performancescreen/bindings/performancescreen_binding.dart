import 'package:get/get.dart';

import '../controllers/performancescreen_controller.dart';

class PerformancescreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerformancescreenController>(
      () => PerformancescreenController(),
    );
  }
}
