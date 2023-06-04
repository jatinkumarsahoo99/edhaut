import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../../../data/app_data.dart';
import '../../../widgets/DropDown.dart';
import '../../../widgets/KeyvalueModel.dart';
import '../controllers/add_testscreen_controller.dart';

class AddTestscreenView extends GetView<AddTestscreenController> {
  AddTestscreenView({Key? key}) : super(key: key);
  AddTestscreenController controller = Get.find<AddTestscreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfff0d9),
      appBar: AppBar(
        title: Text("Add Question", style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFFfff0d9),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body:  GetBuilder<AddTestscreenController>(
          id: "testTotal",
        builder: (controller) {
          return ( controller.postDat != null)? Container(
            // width: Get.width,
            height: double.maxFinite,
            child: Column(
              children: [
                GetBuilder<AddTestscreenController>(
                  id: "test",
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Color(0xFFfff0d9),
                        elevation: 5,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text("Test Name: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                  ),
                                  Container(
                                    child: Text(controller.postDat!.testName ?? ""),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text("Test Date: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                  ),
                                  Container(
                                    child: Text(controller.postDat!.examDate ?? ""),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text("Topic: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                  ),
                                  Container(
                                    child: Text(controller.postDat!.topic ?? ""),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text("ExamDuration: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                  ),
                                  Container(
                                    child:
                                        Text(controller.postDat!.examDuration ?? ""),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text("Total Mark: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                  ),
                                  Container(
                                    child: Text(controller.postDat!.tpotalMark ?? ""),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text("Class: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                  ),
                                  Container(
                                    child: Text(controller.postDat!.className ?? ""),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text("Total Question: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                  ),
                                  Container(
                                    child:
                                        Text(controller.postDat!.totalQuestion ?? ""),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          showPopup();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 1),
                                color: Colors.deepPurple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            padding:
                                EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                            child: Text(
                              "Add",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GetBuilder<AddTestscreenController>(
                      id: "questions",
                      builder: (controller) {
                        return ListView.builder(
                          itemCount:(controller.postDat != null)? (controller.postDat!.questions!.length):0,
                          // physics: NeverScrollableScrollPhysics(),
                          // itemCount:3,
                          itemBuilder: (context, index) {
                            return Container(
                              // height: Get.height*0.7,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 2),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text((controller.postDat!.questions![index].slNo??"" ) +". "+
                                          (controller.postDat!.questions![index].questionText ?? "")+"?.",style: TextStyle(fontSize: 20,
                                          fontWeight: FontWeight.bold, color: Colors.black)),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text((controller.postDat!.questions![index].choices![0].slNo  ??"" ) +". "+
                                              ( controller.postDat!.questions![index].choices![0].choiceText?? "")),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text((controller.postDat!.questions![index].choices![1].slNo  ??"" ) +". "+
                                              ( controller.postDat!.questions![index].choices![1].choiceText?? "")),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text((controller.postDat!.questions![index].choices![2].slNo  ??"" ) +". "+
                                              ( controller.postDat!.questions![index].choices![2].choiceText?? "")),
                                        )
                                      ],
                                    )
                                    ,
                                    Row(
                                      children: [
                                        Container(
                                          child: Text((controller.postDat!.questions![index].choices![3].slNo  ??"" ) +". "+
                                              ( controller.postDat!.questions![index].choices![3].choiceText?? "")),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(

                                        children: [
                                          Container(
                                            child: Text("Answer: ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                          ),
                                          Container(
                                            width:Get.width*0.6,
                                            child: Text(controller.
                                            getCorrectChoice(controller.postDat!.questions![index].correctChoiceNo ??"" ,
                                                controller.postDat!.questions![index].choices),
                                              style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20),
                                            overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: nextButton()),
                    ],
                  ),
                ),

              ],
            ),
          ):
          Container(
            child: const SpinKitFadingCircle(
              color: Colors.orange,
              size: 40.0,
            ),
          );
        }
      )
    );
  }
  Widget nextButton() {
    return MaterialButton(
      child: Text(
        "Submit",
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
      color: Colors.deepPurple,
      onPressed: (){
controller.submitTest();
      },
      height: 35,
    );
  }

  Widget formFieldQuestion(
    int index,
    String hint,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 7.0),
      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9  ]")),
        ],
        style: TextStyle(fontSize: AppData.hinttextSize),
        autofocus: false,
        controller: controller.textEditingController[index],
        keyboardType: TextInputType.text,
        maxLines: 6,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.8),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.5),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          alignLabelWithHint: true,
          hintText: hint,
          hintStyle: TextStyle(
            color: AppData.hinttextcolor, // <-- Change this
            fontSize: AppData.hinttextSize,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          // labelText: hint,
          labelStyle: TextStyle(
            color: AppData.lebletextcolor, // <-- Change this
            fontSize: AppData.lebletextSize,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),

          contentPadding: EdgeInsets.only(left: 10, top: 4, right: 4),
        ),
      ),
    );
  }

  Widget formField1(String hint, int i) {
    return TextFormField(
      style: TextStyle(fontSize: AppData.hinttextSize),
      autofocus: false,
      // enabled: enable,
      controller: controller.textEditingController[i],
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.text,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z. 0-9 ]")),
      ],
      decoration: InputDecoration(
        //prefixIcon: Icon(Icons.insert_drive_file_outlined),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        // alignLabelWithHint: true,
        hintText: hint,
        // fillColor:Colors.white,
        // filled: true,
        // border: InputBorder.none,

        // prefixIcon: Icon(icons, color: Colors.black),
        // border:InputBorder.none ,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 0, color: Colors.black), //<-- SEE HERE
          borderRadius: BorderRadius.circular(1.0),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(width: 0, color: Colors.black), //<-- SEE HERE
          borderRadius: BorderRadius.circular(1.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 0, color: Colors.black), //<-- SEE HERE
          borderRadius: BorderRadius.circular(1.0),
        ),
        suffix: Padding(
          padding: EdgeInsets.only(right: 05),
          child: Text(
            "(" + hint + ")",
          ),
        ),

        hintStyle: TextStyle(
          color: AppData.hinttextcolor, // <-- Change this
          fontSize: AppData.hinttextSize,
          // fontWeight: FontWeight.w400,
          // fontStyle: FontStyle.normal,
        ),
        // labelText: hint,
        labelStyle: TextStyle(
          color: AppData.lebletextcolor, // <-- Change this
          fontSize: AppData.lebletextSize,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),

        contentPadding: EdgeInsets.only(left: 0, top: 10, right: 4, bottom: 0),
      ),
    );
  }

  void showPopup() {
    controller.textEditingController[0].text = "";
    controller.textEditingController[1].text = "";
    controller.textEditingController[2].text = "";
    controller.textEditingController[3].text = "";
    controller.textEditingController[4].text = "";
    controller.textEditingController[5].text = "";
    Get.dialog(
      AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add Test Details'),
          ],
        ),
        content: SingleChildScrollView(
          child: Container(
            width: Get.width * 0.93,
            // height: Get.height*0.5,
            child: Column(
              children: [
                formFieldQuestion(0, "Enter Question"),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 13.0, right: 13.0, bottom: 2.0),
                  child: formField1("Choice 1", 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 13.0, right: 13.0, bottom: 2.0),
                  child: formField1("Choice 2", 2),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 13.0, right: 13.0, bottom: 2.0),
                  child: formField1("Choice 3", 3),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 13.0, right: 13.0, bottom: 2.0),
                  child: formField1("Choice 4", 4),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 13.0, right: 13.0, bottom: 2.0),
                  child: DropDown.staticDropdown("Select Correct Choice",
                      "choice", controller.correctChoice, (KeyvalueModel? map) {
                    controller.textEditingController[5].text = map!.key;
                  }),
                )
              ],
            ),
          ),
        ),
        contentPadding: EdgeInsets.only(left: 5, right: 5, top: 2),
        insetPadding: EdgeInsets.only(left: 5, right: 5, top: 3),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 1),
                child: TextButton(
                  onPressed: () {
                    Get.back(); // Close the popup
                  },
                  style: TextButton.styleFrom(
                    primary: Color(0xFFFECFAF),
                    backgroundColor: Color(0xFFFECFAF),
                    onSurface: Color(0xFFFECFAF),
                  ),
                  child: Text('cancel', style: TextStyle(color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 0),
                child: TextButton(
                  onPressed: () {
                    controller.validateField();
                  },
                  style: TextButton.styleFrom(
                    primary: Color(0xFFFECFAF),
                    backgroundColor: Color(0xFFFECFAF),
                    onSurface: Color(0xFFFECFAF),
                  ),
                  child: Text('Submit', style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
