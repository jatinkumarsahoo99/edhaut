import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/ApiFactory.dart';
import '../../../data/Const.dart';
import '../../../data/SharedPref.dart';
import '../../../widgets/Snack.dart';
import '../../ConnectorController.dart';
import '../../loginscreen/NewLoginResponseModel.dart';
import '../../scheduledclassscreen/ScheduledClassModel.dart';

class AttendclassstudentController extends GetxController {
  //TODO: Implement AttendclassstudentController

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
  ScheduledClassModel? scheduledClasses;
  NewLoginResponseModel? loginResponseModel;
  SharedPref sharedPref = SharedPref();
  var login;
  void fetchLocalData() async {
    login = await sharedPref.getKey(Const.IS_LOGIN);
    // loginResponseModel = await sharedPref.getKey(Const.LOGIN_DATA);
    if (login != null && login.replaceAll("\"", "") == "true") {
      loginResponseModel = NewLoginResponseModel.fromJson(
          jsonDecode(await sharedPref.getKey(Const.LOGIN_DATA)));
      getScheduledClassData(loginResponseModel?.body?[0].classId??"");
    }
  }
  getScheduledClassData(String classId){
    // MyWidgets.showLoading3();
    // log("check>>>"+DateTime.parse('2023-06-02T18:43:37.081+00:00').day .toString());
    String today =DateFormat('yyyy-MM-dd').format(DateTime.now());
    Get.find<ConnectorController>().GETMETHODCALL(
        api: ApiFactory.GETALLSCHEDULEDCLASSES1 + classId.toString() ,
        fun: (Map<String,dynamic> map){
          if(map['code'] == "success") {
            // Get.back();
            scheduledClasses = ScheduledClassModel.fromJson(map);
            update(['class']);
            log(">>>>>>"+scheduledClasses!.toJson().toString());
          }else{
            // Get.back();
            Snack.callError("Something went wrong");
          }

        });
  }


  void increment() => count.value++;
}
