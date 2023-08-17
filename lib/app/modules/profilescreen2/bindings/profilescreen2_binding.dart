import 'package:get/get.dart';

import '../controllers/profilescreen2_controller.dart';

class Profilescreen2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Profilescreen2Controller>(
      () => Profilescreen2Controller(),
    );
  }
}
