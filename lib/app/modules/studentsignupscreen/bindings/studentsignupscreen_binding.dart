import 'package:get/get.dart';

import '../controllers/studentsignupscreen_controller.dart';

class StudentsignupscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentsignupscreenController>(
      () => StudentsignupscreenController(),
    );
  }
}
