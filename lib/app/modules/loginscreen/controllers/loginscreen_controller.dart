import 'package:edhaut/app/data/ApiFactory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/Const.dart';
import '../../../data/SharedPref.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/MyWidget.dart';
import '../../../widgets/Snack.dart';
import '../../ConnectorController.dart';
import '../LoginResponseModel.dart';
import '../NewLoginResponseModel.dart';

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
              NewLoginResponseModel loginResponseModel = NewLoginResponseModel.fromJson(map);

              sharedPref.save(Const.LOGIN_DATA, loginResponseModel);
              sharedPref.save(Const.IS_LOGIN, "true");
              Get.back();
              if(loginResponseModel!.body![0].role == "rol001"){
                Get.offAllNamed(Routes.DASHBOARD);
              }else if(loginResponseModel!.body![0].role == "rol002"){
                Get.offAllNamed(Routes.TEACHER_DASHBOARD);
              }else if(loginResponseModel!.body![0].role == "rol003"){
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

  void showPopup() {
    Get.dialog(
      AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select One'),
          ],
        ),
        content: Container(
          width: Get.width*0.7,
          height: Get.height*0.1,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: (){
                    Get.toNamed(Routes.STUDENTSIGNUPSCREEN);
                  },
                  child: Container(
                    child: Text("Student Registration",style: TextStyle(color: Colors.deepPurple,fontSize: 15)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: (){
                    Get.toNamed(Routes.SIGNUPSCREEN);
                  },
                  child: Container(
                    child: Text("Teacher Registration",style: TextStyle(color: Colors.deepPurple,fontSize: 15)),
                  ),
                ),
              )
            ],
          ),
        ),
        contentPadding: EdgeInsets.only(left: 5, right: 5, top: 2),
        insetPadding: EdgeInsets.only(left: 5, right: 5, top: 3),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Get.back(); // Close the popup
                },
                child: Text('Close'),
              ),
            ],
          ),
        ],
      ),
    );
}

  void increment() => count.value++;
}
