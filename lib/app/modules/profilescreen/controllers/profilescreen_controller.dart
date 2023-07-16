import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/Const.dart';
import '../../../data/SharedPref.dart';
import '../../loginscreen/NewLoginResponseModel.dart';

class ProfilescreenController extends GetxController {
  //TODO: Implement ProfilescreenController
  SharedPref sharedPref = SharedPref();
  Rx<String> studentName = Rx<String>("");
  Rx<String> emailId = Rx<String>("");
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
        emailId.value = (loginResponseModel!.body![0].email ??"");
        studentName.refresh();
        emailId.refresh();
      }
    }
  }
  final count = 0.obs;
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

  void increment() => count.value++;
}
