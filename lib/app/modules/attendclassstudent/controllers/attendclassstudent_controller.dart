import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/ApiFactory.dart';
import '../../../widgets/Snack.dart';
import '../../ConnectorController.dart';
import '../../scheduledclassscreen/ScheduledClassModel.dart';

class AttendclassstudentController extends GetxController {
  //TODO: Implement AttendclassstudentController

  final count = 0.obs;
  @override
  void onInit() {
    getScheduledClassData();
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
  getScheduledClassData(){
    // MyWidgets.showLoading3();
    // log("check>>>"+DateTime.parse('2023-06-02T18:43:37.081+00:00').day .toString());
    String today =DateFormat('yyyy-MM-dd').format(DateTime.now());
    Get.find<ConnectorController>().GETMETHODCALL(
        api: ApiFactory.GETALLSCHEDULEDCLASSES1 + today.toString() ,
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
