import 'package:get/get.dart';
enum userType{
  Teacher,
  Student
}
class ForgotscreenController extends GetxController {
  //TODO: Implement ForgotscreenController

  final count = 0.obs;
  Rx<userType> user = Rx<userType>(userType.Student);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
