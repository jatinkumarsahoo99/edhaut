import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/Const.dart';
import '../../../data/SharedPref.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/KeyvalueModel.dart';
import '../../../widgets/MyWidget.dart';
import '../../../widgets/Snack.dart';
import '../../loginscreen/NewLoginResponseModel.dart';
import '../PostTestModel.dart';

class TeacherDashboardController extends GetxController {
  //TODO: Implement TeacherDashboardController
  NewLoginResponseModel? loginResponseModel;
  Rx<String> studentName = Rx<String>("");
  SharedPref sharedPref = SharedPref();
  List<TextEditingController> textEditingController =
  [new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
  ];
  static KeyvalueModel? className;

  var login;
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
  Future<void> selectDate(int index) async {
    final DateTime? picked = await Get.dialog<DateTime>(
      DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 360)),
      ),
    );

    if (picked != null) {
      textEditingController[index].text =
          DateFormat("yyyy-MM-dd").format(picked);
    }

    update(['testName']);
  }
  @override
  void onClose() {
    super.onClose();
  }
  bool isProcessing = true;
  void fetchLocalData() async {
    isProcessing = true;
    login = await sharedPref.getKey(Const.IS_LOGIN);
    // loginResponseModel = await sharedPref.getKey(Const.LOGIN_DATA);
    if (login != null && login.replaceAll("\"", "") == "true") {
      loginResponseModel = NewLoginResponseModel.fromJson(
          jsonDecode(await sharedPref.getKey(Const.LOGIN_DATA)));
      isProcessing = false;
      studentName.value = loginResponseModel!.body![0].name??"";
      studentName.refresh();
      log(">>>>>>>>"+loginResponseModel!.toJson().toString());
      // update(["teacherDash"]);
    }
  }
  logout(){
    MyWidgets.showLoading3();
    sharedPref.remove(Const.IS_LOGIN);
    sharedPref.remove(Const.LOGIN_DATA);
    Get.offAllNamed(Routes.LOGINSCREEN);
    Get.back();
  }
  validateField() {
    if (textEditingController[0].text == null ||
        textEditingController[0].text == "") {
      Snack.callError("Please enter Test Name");
    } else if (className == null) {
      Snack.callError("Please select class");
    } else if (textEditingController[1].text == null ||
        textEditingController[1].text == "") {
      Snack.callError("Please enter test date");
    } else if (textEditingController[2].text == null ||
        textEditingController[2].text == "") {
      Snack.callError("Please enter test topic");
    } else if (textEditingController[3].text == null ||
        textEditingController[3].text == "") {
      Snack.callError("Please enter exam duration in minutes");
    } else if (textEditingController[4].text == null ||
        textEditingController[4].text == "") {
      Snack.callError("Please enter Total mark");
    } else if (textEditingController[5].text == null ||
        textEditingController[5].text == "") {
      Snack.callError("Please enter Individual mark");
    }else if (textEditingController[6].text == null ||
        textEditingController[6].text == "") {
      Snack.callError("Please enter total no. Qus");
    } else if((double.parse(textEditingController[4].text) / double.parse( textEditingController[5].text ))  !=
        double.parse(textEditingController[6].text) ){
      Snack.callError("Please give correct no of question's and total mark");
    } else {
      PostTestModel postTestModel = new PostTestModel();
      postTestModel.testName = textEditingController[0].text ;
      postTestModel.className = className!.name;
      postTestModel.classId = className!.key;
      postTestModel.examDate = textEditingController[1].text ;
      postTestModel.topic = textEditingController[2].text ;
      postTestModel.examDuration = textEditingController[3].text ;
      postTestModel.tpotalMark = textEditingController[4].text ;
      postTestModel.individualMark = textEditingController[5].text ;
      postTestModel.individualMark = textEditingController[5].text ;
      postTestModel.totalQuestion = textEditingController[6].text ;
      postTestModel.createdDate =DateTime.now().toString();
      postTestModel.questions=[];
      Get.back();
      Get.toNamed(Routes.ADD_TESTSCREEN,arguments: postTestModel.toJson());
    }
  }

  void increment() => count.value++;
}
