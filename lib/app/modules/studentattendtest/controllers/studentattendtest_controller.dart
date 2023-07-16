import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/ApiFactory.dart';
import '../../../data/Const.dart';
import '../../../data/SharedPref.dart';
import '../../../widgets/Snack.dart';
import '../../ConnectorController.dart';
import '../../loginscreen/NewLoginResponseModel.dart';
import '../GetAllTestModel.dart';

class StudentattendtestController extends GetxController {
  //TODO: Implement StudentattendtestController

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
  NewLoginResponseModel? loginResponseModel;
  SharedPref sharedPref = SharedPref();
  var login;
  GetAllTestModel? getAllTestModel;
  getAlltest(){
    // MyWidgets.showLoading3();
    // log("check>>>"+DateTime.parse('2023-06-02T18:43:37.081+00:00').day .toString());
    // String today =DateFormat('yyyy-MM-dd').format(DateTime.now());
    Get.find<ConnectorController>().GETMETHODCALL(
        api: ApiFactory.GETALLTEST+"?classId="+(loginResponseModel?.body?[0].classId??"") ,
        fun: (Map<String,dynamic> map){
          if(map['code'] == "success") {
            // Get.back();
            getAllTestModel = GetAllTestModel.fromJson(map);
            log(">>>>>>>>>>>>map"+jsonEncode(map).toString());
            if(submitedList.isNotEmpty){
              for(int i=0;i<submitedList.length;i++){
                for(int j=0;j<getAllTestModel!.body!.length;j++){
                  if(submitedList[i].toString().trim()  == getAllTestModel!.body![j].examId.toString().trim()){
                    getAllTestModel!.body![j].appear = true;
                    break;
                  }
                }
              }
            }
            update(['test']);
            // log(">>>>>>"+getAllTestModel!.toJson().toString());
          }else{
            // Get.back();
            Snack.callError("Something went wrong");
          }

        });
  }
  void fetchLocalData() async {
    login = await sharedPref.getKey(Const.IS_LOGIN);
    // loginResponseModel = await sharedPref.getKey(Const.LOGIN_DATA);
    if (login != null && login.replaceAll("\"", "") == "true") {
      loginResponseModel = NewLoginResponseModel.fromJson(
          jsonDecode(await sharedPref.getKey(Const.LOGIN_DATA)));
      // getAlltest();
      getAllSubmitedTest();
    }
  }
List<dynamic> submitedList =[];
  getAllSubmitedTest(){
    // MyWidgets.showLoading3();
    // log("check>>>"+DateTime.parse('2023-06-02T18:43:37.081+00:00').day .toString());
    // String today =DateFormat('yyyy-MM-dd').format(DateTime.now());
    Get.find<ConnectorController>().GETMETHODCALL(
        api: ApiFactory.GETSUBMITTEST_LIST+loginResponseModel!.body![0].userId.toString(),
        fun: (Map<String,dynamic> map){
          if(map['code'] == "success") {
            // Get.back();
            // getAllTestModel = GetAllTestModel.fromJson(map);
            submitedList = map['body'];
            getAlltest();
            // update(['test']);
            // log(">>>>>>"+getAllTestModel!.toJson().toString());
          }else{
            // Get.back();
            // Snack.callError("Something went wrong");
          }

        });
  }
  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
