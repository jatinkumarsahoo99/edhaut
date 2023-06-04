import 'package:get/get.dart';

import '../controllers/attendtestbystudent_controller.dart';

class AttendtestbystudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendtestbystudentController>(
      () => AttendtestbystudentController(),
    );
  }
}
