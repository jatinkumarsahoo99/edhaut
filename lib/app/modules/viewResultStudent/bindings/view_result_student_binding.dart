import 'package:get/get.dart';

import '../controllers/view_result_student_controller.dart';

class ViewResultStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewResultStudentController>(
      () => ViewResultStudentController(),
    );
  }
}
