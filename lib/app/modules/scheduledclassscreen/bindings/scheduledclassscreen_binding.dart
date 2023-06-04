import 'package:get/get.dart';

import '../controllers/scheduledclassscreen_controller.dart';

class ScheduledclassscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduledclassscreenController>(
      () => ScheduledclassscreenController(),
    );
  }
}
