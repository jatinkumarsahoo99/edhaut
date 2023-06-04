import 'dart:developer';

import 'package:edhaut/app/modules/studentattendtest/GetAllTestModel.dart' ;
import 'package:get/get.dart';

import '../../../widgets/MyWidget.dart';


class AttendtestbystudentController extends GetxController {
  //TODO: Implement AttendtestbystudentController

  final count = 0.obs;
  @override
  void onInit() {
    fetchArguments();
    super.onInit();
  }
  refreshUi(){
    update(["testdata"]);
  }

  @override
  void onReady() {
    super.onReady();
  }
  Body? testData  ;
  fetchArguments(){
    testData = Body.fromJson(Get.arguments);
    log(">>>"+Get.arguments.toString());
    log(">>>"+testData!.toJson() .toString());
    update(["testdata"]);
  }
  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
