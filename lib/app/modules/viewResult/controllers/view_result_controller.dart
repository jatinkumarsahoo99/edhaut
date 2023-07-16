import 'dart:io';

import 'package:get/get.dart';

import '../../../data/ApiFactory.dart';
import '../../ConnectorController.dart';
import '../TestDetailsModel.dart';

class ViewResultController extends GetxController {
  //TODO: Implement ViewResultController

  final count = 0.obs;
  File? file;
  Rx<bool> withAnswer = Rx<bool>(false);
  Map<String,dynamic> data = {};
  @override
  void onInit() {
    data = Get.arguments;
    print(">>>>>>>>>"+data.toString());
    fetchTestDetails();
    super.onInit();
  }
  TestDetailsModel? testDetailsModel;
  fetchTestDetails(){
    Get.find<ConnectorController>().GETMETHODCALL(
        api: ApiFactory.GETSUBMITTEST_LIST_FILTERBYID+data['studentId']+"&examId="+data['examId'] ,
        fun: (Map<String,dynamic> map){
          if(map['code'] == "success"){
            testDetailsModel = TestDetailsModel.fromJson(map);
            update(['refresh']);
          }else{
            testDetailsModel = null;
            update(['refresh']);
          }
          print(">>>>>>>>>"+map.toString());
        });
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
