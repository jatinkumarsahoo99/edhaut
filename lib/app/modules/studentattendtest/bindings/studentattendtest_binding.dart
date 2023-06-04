import 'package:get/get.dart';

import '../controllers/studentattendtest_controller.dart';

class StudentattendtestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentattendtestController>(
      () => StudentattendtestController(),
    );
  }
}
