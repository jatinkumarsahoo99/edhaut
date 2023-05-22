import 'package:get/get.dart';

import '../controllers/admindashboard_controller.dart';

class AdmindashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdmindashboardController>(
      () => AdmindashboardController(),
    );
  }
}
