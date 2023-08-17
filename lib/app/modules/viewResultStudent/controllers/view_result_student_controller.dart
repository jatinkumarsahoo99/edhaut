import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/ApiFactory.dart';
import '../../../data/Const.dart';
import '../../../data/SharedPref.dart';
import '../../../widgets/Snack.dart';
import '../../ConnectorController.dart';
import '../../loginscreen/NewLoginResponseModel.dart';
import '../../studentattendtest/GetAllTestModel.dart';
import '../AllSubmitedTestWithResultModel.dart';

class ViewResultStudentController extends GetxController {
  //TODO: Implement ViewResultStudentController
  GetAllTestModel? getAllTestModel;
  AllSubmitedTestWithResultModel? allSubmitedTestWithResultModel;
  final count = 0.obs;
  NewLoginResponseModel? loginResponseModel;
  SharedPref sharedPref = SharedPref();
  var login;
  getAlltest(){
    // MyWidgets.showLoading3();
    // log("check>>>"+DateTime.parse('2023-06-02T18:43:37.081+00:00').day .toString());
    // String today =DateFormat('yyyy-MM-dd').format(DateTime.now());
    Get.find<ConnectorController>().GETMETHODCALL(
        api: ApiFactory.GET_ALL_SUBMITED_TEST+(loginResponseModel?.body?[0].userId??""),
        fun: (Map<String,dynamic> map){
          if(map['code'] == "success") {
            // Get.back();
            allSubmitedTestWithResultModel = AllSubmitedTestWithResultModel.fromJson(map);
            log(">>>>>>>>>>>>map"+jsonEncode(map).toString());

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
      getAlltest();

    }
  }
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

  void increment() => count.value++;
}
