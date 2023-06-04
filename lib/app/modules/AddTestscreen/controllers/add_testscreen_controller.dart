import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/ApiFactory.dart';
import '../../../widgets/KeyvalueModel.dart';
import '../../../widgets/MyWidget.dart';
import '../../../widgets/Snack.dart';
import '../../ConnectorController.dart';
import '../../teacherDashboard/PostTestModel.dart';

class AddTestscreenController extends GetxController {
  //TODO: Implement AddTestscreenController

  final count = 0.obs;
  PostTestModel? postDat =  null;
  List<TextEditingController> textEditingController =
  [new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
  ];
  List<KeyvalueModel> correctChoice = [new KeyvalueModel(name: "1",key: "1"),new KeyvalueModel(name: "2",key: "2"),
    new KeyvalueModel(name: "3",key: "3"),new KeyvalueModel(name: "4",key: "4")];

  fetchArguments(){
    postDat = PostTestModel.fromJson(Get.arguments);
    log(">>>"+Get.arguments.toString());
    log(">>>"+postDat!.toJson() .toString());
    update(['test',"testTotal"]);
  }

  @override
  void onInit() {
    fetchArguments();
    // log("pass data"+postDat!.toJson().toString());
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
  validateField() {
    if (textEditingController[0].text == null ||
        textEditingController[0].text == "") {
      Snack.callError("Please enter Question");
    } else if (textEditingController[1].text == null ||
        textEditingController[1].text == "") {
      Snack.callError("Please enter choice 1");
    } else if (textEditingController[2].text == null ||
        textEditingController[2].text == "") {
      Snack.callError("Please enter choice 2");
    } else if (textEditingController[3].text == null ||
        textEditingController[3].text == "") {
      Snack.callError("Please enter choice 3");
    } else if (textEditingController[4].text == null ||
        textEditingController[4].text == "") {
      Snack.callError("Please enter choice 4");
    }  else if (textEditingController[5].text == null ||
        textEditingController[5].text == "") {
      Snack.callError("Please enter correct choice");
    }  else {
      Questions questions = new Questions();
      questions.questionText = textEditingController[0].text;
      questions.slNo = (postDat!.questions!.length + 1).toString();
      questions.correctChoiceNo = textEditingController[5].text;
      questions.choices = [
        new Choices(choiceText: textEditingController[1].text,slNo: "1"),
        new Choices(choiceText: textEditingController[2].text,slNo: "2"),
        new Choices(choiceText: textEditingController[3].text,slNo: "3"),
        new Choices(choiceText: textEditingController[4].text,slNo: "4")
      ];
      postDat!.questions!.add(questions);
      update(['questions']);
      Get.back();
    }
  }

  submitTest(){
    if(postDat!.testName == null){
      Snack.callError("Something went wrong");
    }else if(postDat!.questions!.length == 0){

        Snack.callError("Please add some question");
    }
    else{
      MyWidgets.showLoading3();
      log(">>>post sdata"+( jsonEncode(postDat!.toJson()) ).toString());
      Get.find<ConnectorController>().POSTMETHOD(api: ApiFactory.QUESTION_CREATED,
          json: postDat!.toJson(),
          fun: (Map<String,dynamic> map){
            log(">>>>>"+map.toString());
            if(map['code'] == "sucess"){
              Get.back();
              Get.back();
              Snack.callSuccess("Data Saved Successfully");
              // Get.toNamed(Routes.LOGINSCREEN);
            }else{
              Get.back();
              Snack.callError("Something went wrong");
            }

          });

    }
  }

  getCorrectChoice(String ChoiceNo, List<Choices>? choices){
    switch(ChoiceNo){
      case "1":
        return choices![0].choiceText??"";
        break;
      case "2":
        return choices![1].choiceText??"";
        break;
      case "3":
        return choices![2].choiceText??"";
        break;
      case "4":
        return choices![3].choiceText??"";
        break;
    }
  }

  void increment() => count.value++;
}
