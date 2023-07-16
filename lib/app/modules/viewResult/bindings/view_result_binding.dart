import 'package:get/get.dart';

import '../controllers/view_result_controller.dart';

class ViewResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewResultController>(
      () => ViewResultController(),
    );
  }
}
