import 'package:get/get.dart';

import '../../../data/Const.dart';
import '../../../data/SharedPref.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/MyWidget.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final count = 0.obs;
  SharedPref sharedPref = SharedPref();
  List<String> header = ['All','CBSE','ICSE','HSCE/CHSE'];
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
  logout(){
    MyWidgets.showLoading3();
    sharedPref.remove(Const.IS_LOGIN);
    sharedPref.remove(Const.LOGIN_DATA);
    Get.offAllNamed(Routes.LOGINSCREEN);
    Get.back();
  }

  void increment() => count.value++;
}
