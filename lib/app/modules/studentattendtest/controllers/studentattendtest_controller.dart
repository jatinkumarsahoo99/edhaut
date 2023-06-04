import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/ApiFactory.dart';
import '../../../widgets/Snack.dart';
import '../../ConnectorController.dart';
import '../GetAllTestModel.dart';

class StudentattendtestController extends GetxController {
  //TODO: Implement StudentattendtestController

  final count = 0.obs;
  @override
  void onInit() {
    getAlltest();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
  GetAllTestModel? getAllTestModel;
  getAlltest(){
    // MyWidgets.showLoading3();
    // log("check>>>"+DateTime.parse('2023-06-02T18:43:37.081+00:00').day .toString());
    // String today =DateFormat('yyyy-MM-dd').format(DateTime.now());
    Get.find<ConnectorController>().GETMETHODCALL(
        api: ApiFactory.GETALLTEST ,
        fun: (Map<String,dynamic> map){
          if(map['code'] == "success") {
            // Get.back();
            getAllTestModel = GetAllTestModel.fromJson(map);
            update(['test']);
            log(">>>>>>"+getAllTestModel!.toJson().toString());
          }else{
            // Get.back();
            Snack.callError("Something went wrong");
          }

        });
  }
  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
