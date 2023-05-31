import 'package:get/get.dart';

import '../controllers/groupchatscreen_controller.dart';

class GroupchatscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupchatscreenController>(
      () => GroupchatscreenController(),
    );
  }
}
