import 'package:get/get.dart';

import '../controllers/studentdashboard_controller.dart';

class StudentdashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentdashboardController>(
      () => StudentdashboardController(),
    );
  }
}
