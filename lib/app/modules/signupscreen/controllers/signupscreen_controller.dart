import 'dart:developer';

import 'package:edhaut/app/data/app_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/ApiFactory.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/MyWidget.dart';
import '../../../widgets/Snack.dart';
import '../../ConnectorController.dart';

class SignupscreenController extends GetxController {
  //TODO: Implement SignupscreenController

  List<TextEditingController> textEditingController =
  [new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
  ];

  final count = 0.obs;
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

  validateField(){
    if(textEditingController[0].text == null || textEditingController[0].text == ""){
      Snack.callError("Please enter username");
    }else if(textEditingController[1].text == null || textEditingController[1].text == ""){
      Snack.callError("Please enter email");
    }else if(!AppData.isValidEmail(textEditingController[1].text)){
      Snack.callError("Please enter valid email");
    }else if(textEditingController[2].text == null || textEditingController[2].text == ""){
      Snack.callError("Please enter password");
    }else if(textEditingController[3].text == null || textEditingController[3].text == ""){
      Snack.callError("Please enter password");
    }else if(textEditingController[3].text != textEditingController[2].text){
      Snack.callError("Please password should be match in to password");
    }else{
      MyWidgets.showLoading3();
      Map<String,String> postData = {
        "studentName":textEditingController[0].text,
        "email":textEditingController[1].text,
        "password":textEditingController[2].text
      };
      log(postData.toString());
      Get.find<ConnectorController>().POSTMETHOD(api: ApiFactory.SIGNUP,
          json: postData,
          fun: (Map<String,dynamic> map){
        log(">>>>>"+map.toString());
        if(map['code'] == "sucess"){
          Get.back();
          Get.toNamed(Routes.LOGINSCREEN);
        }else{
          Get.back();
          Snack.callError("Something went wrong");
        }

          });
    }

  }



  void increment() => count.value++;
}
