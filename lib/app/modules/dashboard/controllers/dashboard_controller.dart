import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/Const.dart';
import '../../../data/SharedPref.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/MyWidget.dart';
import '../../loginscreen/NewLoginResponseModel.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final count = 0.obs;
  Rx<String> studentName = Rx<String>("");
  SharedPref sharedPref = SharedPref();
  List<String> header = ['All','CBSE','ICSE','HSCE/CHSE'];
  NewLoginResponseModel? loginResponseModel;
  var login;
  void fetchLocalData() async {
    login = await sharedPref.getKey(Const.IS_LOGIN);
    // loginResponseModel = await sharedPref.getKey(Const.LOGIN_DATA);
    if (login != null && login.replaceAll("\"", "") == "true") {
      loginResponseModel = NewLoginResponseModel.fromJson(
          jsonDecode(await sharedPref.getKey(Const.LOGIN_DATA)));
      if(loginResponseModel!.body != null){
        studentName.value = (loginResponseModel!.body![0].name ??"");
        studentName.refresh();
      }
    }
  }
  @override
  void onInit() {
    fetchLocalData();
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
