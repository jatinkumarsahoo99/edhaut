import 'package:edhaut/app/data/ApiFactory.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/Const.dart';
import '../../../data/SharedPref.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/MyWidget.dart';
import '../../../widgets/Snack.dart';
import '../../ConnectorController.dart';
import '../LoginResponseModel.dart';

class LoginscreenController extends GetxController {
  //TODO: Implement LoginscreenController

  final count = 0.obs;
  List<TextEditingController> textEditingController =
  [new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
  ];
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
  SharedPref sharedPref = SharedPref();
  validate(){
    if(textEditingController[0].text == null || textEditingController[0].text == ""){
      Snack.callError("Please enter email");
    }else if(textEditingController[1].text == null || textEditingController[1].text == ""){
      Snack.callError("Please enter your password");
    }else{
      MyWidgets.showLoading3();
      Get.find<ConnectorController>().GETMETHODCALL(
          api: ApiFactory.LOGIN+textEditingController[0].text+
          '&password='+textEditingController[1].text,
          fun: (Map<String,dynamic> map){
            if(map['code'] == "success"){
              LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(map);
              sharedPref.save(Const.LOGIN_DATA, loginResponseModel);
              sharedPref.save(Const.IS_LOGIN, "true");
              Get.back();
              if(loginResponseModel!.body!.userRole == "rol001"){
                Get.offAllNamed(Routes.DASHBOARD);
              }else if(loginResponseModel!.body!.userRole == "rol002"){
                Get.offAllNamed(Routes.TEACHER_DASHBOARD);
              }else if(loginResponseModel!.body!.userRole == "rol003"){
                Get.offAllNamed(Routes.ADMINDASHBOARD);
              }else{
                Get.back();
                Snack.callError("Something went wrong JKS");
              }
              // Get.toNamed(Routes.DASHBOARD);
            }else{
              Get.back();
              Snack.callError(map['message']??"Something went wrong");
            }

            });
    }
  }

  void increment() => count.value++;
}
