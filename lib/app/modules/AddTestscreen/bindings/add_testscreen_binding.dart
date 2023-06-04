import 'package:get/get.dart';

import '../controllers/add_testscreen_controller.dart';

class AddTestscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTestscreenController>(
      () => AddTestscreenController(),
    );
  }
}
