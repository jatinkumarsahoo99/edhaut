import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/Const.dart';
import '../../../data/SharedPref.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/Snack.dart';
import '../../loginscreen/LoginResponseModel.dart';
import '../../loginscreen/NewLoginResponseModel.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController
  NewLoginResponseModel? loginResponseModel;
  SharedPref sharedPref = SharedPref();
  var login;
  final count = 0.obs;
  @override
  void onInit() {
    callTimer();
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

  void callTimer() {
    Timer(Duration(seconds: 3), fetchLocalData);
  }


  void navigateToWelcomeScreen() async {
    Get.offAllNamed(Routes.SIGNUPSCREEN);
  }

  void fetchLocalData() async {
    login = await sharedPref.getKey(Const.IS_LOGIN);
    // loginResponseModel = await sharedPref.getKey(Const.LOGIN_DATA);
    if (login != null && login.replaceAll("\"", "") == "true") {

      loginResponseModel = NewLoginResponseModel.fromJson(jsonDecode( await sharedPref.getKey(Const.LOGIN_DATA)));

      if(loginResponseModel!.body![0].role == "rol001"){
        Get.offAllNamed(Routes.DASHBOARD);
      }else if(loginResponseModel!.body![0].role== "rol002"){
        Get.offAllNamed(Routes.TEACHER_DASHBOARD);
      }else if(loginResponseModel!.body![0].role == "rol003"){
        Get.offAllNamed(Routes.ADMINDASHBOARD);
      }else{
        Get.toNamed(Routes.LOGINSCREEN);
      }
    }
    else{
      Get.toNamed(Routes.LOGINSCREEN);
    }
  }



}
