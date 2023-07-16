import 'dart:convert';
import 'dart:developer';

import 'package:edhaut/app/modules/studentattendtest/GetAllTestModel.dart' as test ;
import 'package:get/get.dart';

import '../../../data/ApiFactory.dart';
import '../../../data/Const.dart';
import '../../../data/SharedPref.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/MyWidget.dart';
import '../../../widgets/Snack.dart';
import '../../ConnectorController.dart';
import '../../loginscreen/NewLoginResponseModel.dart';
import '../PostAnswerMoidel.dart';


class AttendtestbystudentController extends GetxController {
  //TODO: Implement AttendtestbystudentController
  NewLoginResponseModel? loginResponseModel;
  SharedPref sharedPref = SharedPref();
  var login;
  final count = 0.obs;
  PostAnswerMoidel? postAnswerMoidel;
  @override
  void onInit() {
    fetchArguments();
    fetchLocalData();
    super.onInit();
  }
  refreshUi(){
    update(["testdata"]);
  }
  void fetchLocalData() async {
    login = await sharedPref.getKey(Const.IS_LOGIN);
    // loginResponseModel = await sharedPref.getKey(Const.LOGIN_DATA);
    if (login != null && login.replaceAll("\"", "") == "true") {
      loginResponseModel = NewLoginResponseModel.fromJson(
          jsonDecode(await sharedPref.getKey(Const.LOGIN_DATA)));
    }
  }

  saveTest(){
    bool con = false;
    for(int i=0;i<testData!.questions!.length;i++){
      if(con){
        break;
      }
      for(int j=0;j<testData!.questions![i].choices!.length;j++){
        if(testData!.questions![i].choices![j].isSelected == true){
          break;
        }else if((j == testData!.questions![i].choices!.length -1) && (testData!.questions![i].choices![j].isSelected != true)){
          con = true;
          Snack.callError("Please select your choice of question ${i+1}");

          break;
        }else{
          continue;
        }
      }
    }
    if(!con && loginResponseModel != null){
      postAnswerMoidel = new PostAnswerMoidel();
      postAnswerMoidel?.individualMark = testData?.individualMark??"";
      postAnswerMoidel?.tpotalMark = testData?.tpotalMark??"";
      postAnswerMoidel?.examDuration = testData?.examDuration??"";
      postAnswerMoidel?.examDate = testData?.examDate??"";
      postAnswerMoidel?.className = testData?.className??"";
      postAnswerMoidel?.classId = testData?.classId??"";
      postAnswerMoidel?.testName = testData?.examName??"";
      postAnswerMoidel?.topic = testData?.topic??"";
      postAnswerMoidel?.createdDate = testData?.createdDate??"";
      postAnswerMoidel?.testId = testData?.examId??"";
      postAnswerMoidel?.questions = [];
      postAnswerMoidel?.studentId = loginResponseModel!.body![0].userId;
      // Questions
      for(int i=0;i<testData!.questions!.length;i++) {
        postAnswerMoidel?.questions!.add(Questions(choices: [],
            correctChoiceNo:testData!.questions![i].correctChoiceNo,
        questionText: testData!.questions![i].questionName,
          slNo: testData!.questions![i].serialNo,
        ));
        for (int j = 0; j < testData!.questions![i].choices!.length; j++) {
          postAnswerMoidel?.questions![i].choices!.add(
              new Choices(
            slNo: testData!.questions![i].choices![j].slNo,
            choiceText: testData!.questions![i].choices![j].choiceName,
            selectedChoice: testData!.questions![i].choices![j].isSelected,
          ));

        }
      }

      MyWidgets.showLoading3();
      Get.find<ConnectorController>().POSTMETHOD(
          api: ApiFactory.SUBMITTEST,
          json: postAnswerMoidel!.toJson(),
          fun: (Map<String,dynamic> map){
            log(">>>>>"+map.toString());
            if(map['code'] == "sucess"){
              Get.back();
              Get.back();
              Get.back();
              // Get.toNamed(Routes.STUDENTDASHBOARD);
              Snack.callSuccess("Test Saved Successfully");
              // Get.toNamed(Routes.LOGINSCREEN);
            }else{
              Get.back();
              Snack.callError("Something went wrong");
            }

          });

    }else{
      Snack.callError("Something wet wrong");
    }

  }

  @override
  void onReady() {
    super.onReady();
  }
  test.Body? testData  ;
  fetchArguments(){
    testData = test.Body.fromJson(Get.arguments);
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
