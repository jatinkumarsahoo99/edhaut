import 'package:get/get.dart';

import '../controllers/attendclassstudent_controller.dart';

class AttendclassstudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendclassstudentController>(
      () => AttendclassstudentController(),
    );
  }
}
