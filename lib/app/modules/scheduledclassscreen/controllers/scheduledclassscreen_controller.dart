import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/ApiFactory.dart';
import '../../../widgets/KeyvalueModel.dart';
import '../../../widgets/MyWidget.dart';
import '../../../widgets/Snack.dart';
import '../../ConnectorController.dart';
import '../ScheduledClassModel.dart';

class ScheduledclassscreenController extends GetxController {
  //TODO: Implement ScheduledclassscreenController

  final count = 0.obs;
  List<TextEditingController> textEditingController =
  [new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
  ];
  List<KeyvalueModel> correctChoice = [new KeyvalueModel(name: "Zoom",key: "1"),new KeyvalueModel(name: "Google Meet",key: "2"),
    new KeyvalueModel(name: "Team",key: "3")];





  void selectTime1(int index) async {
    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (picked != null) {
      textEditingController[index].text = picked.format(Get.context!);
    }
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
  }
  validateField() {
    if (textEditingController[0].text == null ||
        textEditingController[0].text == "") {
      Snack.callError("Please enter class name");
    } else if (textEditingController[1].text == null ||
        textEditingController[1].text == "") {
      Snack.callError("Please enter teacher name");
    } else if (textEditingController[2].text == null ||
        textEditingController[2].text == "") {
      Snack.callError("Please enter topic name");
    } else if (textEditingController[3].text == null ||
        textEditingController[3].text == "") {
      Snack.callError("Please select platform");
    } else if (textEditingController[4].text == null ||
        textEditingController[4].text == "") {
      Snack.callError("Please enter join url");
    }  else if (textEditingController[5].text == null ||
        textEditingController[5].text == "") {
      Snack.callError("Please enter class date ");
    }else if (textEditingController[6].text == null ||
        textEditingController[6].text == "") {
      Snack.callError("Please enter start time");
    }else if (textEditingController[7].text == null ||
        textEditingController[7].text == "") {
      Snack.callError("Please enter end time");
    }  else {
      Map<String ,dynamic> postdata ={
        'className':textEditingController[0].text,
        'teacherName':textEditingController[1].text,
        "topic":textEditingController[2].text,
        "classPlatform":textEditingController[3].text,
        "classDate":textEditingController[5].text,
        "classStartTime":textEditingController[6].text,
        "classEndTime":textEditingController[7].text,
        "classUrl":textEditingController[4].text,
      };
      MyWidgets.showLoading3();
      log(">>>post sdata"+( jsonEncode(postdata) ).toString());
      Get.find<ConnectorController>().POSTMETHOD(api: ApiFactory.SCHEDULEDCLASS,
          json: postdata,
          fun: (Map<String,dynamic> map){
            log(">>>>>"+map.toString());
            if(map['code'] == "sucess"){
              Get.back();
              Get.back();
              // Snack.callSuccess("Data Saved Successfully");
              // Get.toNamed(Routes.LOGINSCREEN);
              getScheduledClassData();
            }else{
              Get.back();
              Snack.callError("Something went wrong");
            }

          });

    }
  }
  @override
  void onInit() {
    getScheduledClassData();
    super.onInit();
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
