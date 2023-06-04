import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../controllers/attendtestbystudent_controller.dart';

class AttendtestbystudentView extends GetView<AttendtestbystudentController> {
  AttendtestbystudentView({Key? key}) : super(key: key);
  AttendtestbystudentController controller =
      Get.find<AttendtestbystudentController>();
  Widget nextButton() {
    return MaterialButton(
      child: Text(
        "Submit",
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
      color: Colors.deepPurple,
      onPressed: (){
        // controller.submitTest();
      },
      height: 35,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFECFAF),
        appBar: AppBar(
          title: Text("Attend Test", style: TextStyle(color: Colors.black)),
          backgroundColor: Color(0xFFFECFAF),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: GetBuilder<AttendtestbystudentController>(
          id: "testdata",
          builder: (controller) {
            return (controller.testData != null)?
            Column(
              children: [
                Expanded(
                  child: Container(
                    child:  Container(
                      // height: Get.height*0.7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 2),
                        child: ListView.builder(
                          itemCount: controller.testData!.questions!.length,
                            itemBuilder: (context,index){
                          return Column(
                            children: [
                              Container(
                                child: Text((controller.testData!.questions![index].serialNo ??"" ) +". "+
                                    (controller.testData!.questions![index].questionName ?? "")+"?.",style: TextStyle(fontSize: 20,
                                    fontWeight: FontWeight.bold, color: Colors.black)),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.testData!.questions![index].choices![0].isSelected,
                                      onChanged: (value){
                                    if(value == true){
                                      controller.testData!.questions![index].choices![0].isSelected = true;
                                      controller.testData!.questions![index].choices![1].isSelected = false;
                                      controller.testData!.questions![index].choices![2].isSelected = false;
                                      controller.testData!.questions![index].choices![3].isSelected = false;
                                    }else{
                                      controller.testData!.questions![index].choices![0].isSelected = false;
                                    }
                                    controller.refreshUi();

                                  }),
                                  Container(
                                    child: Text((controller.testData!.questions![index].choices![0].slNo  ??"" ) +". "+
                                        ( controller.testData!.questions![index].choices![0].choiceName?? "")),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.testData!.questions![index].choices![1].isSelected,
                                      onChanged: (value){
                                        if(value == true){
                                          controller.testData!.questions![index].choices![1].isSelected = true;
                                          controller.testData!.questions![index].choices![0].isSelected = false;
                                          controller.testData!.questions![index].choices![2].isSelected = false;
                                          controller.testData!.questions![index].choices![3].isSelected = false;
                                        }else{
                                          controller.testData!.questions![index].choices![1].isSelected = false;
                                        }
                                        controller.refreshUi();

                                      }),
                                  Container(
                                    child: Text((controller.testData!.questions![index].choices![1].slNo  ??"" ) +". "+
                                        ( controller.testData!.questions![index].choices![1].choiceName?? "")),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.testData!.questions![index].choices![2].isSelected,
                                      onChanged: (value){
                                        if(value == true){
                                          controller.testData!.questions![index].choices![2].isSelected = true;
                                          controller.testData!.questions![index].choices![1].isSelected = false;
                                          controller.testData!.questions![index].choices![0].isSelected = false;
                                          controller.testData!.questions![index].choices![3].isSelected = false;
                                        }else{
                                          controller.testData!.questions![index].choices![2].isSelected = false;
                                        }
                                        controller.refreshUi();

                                      }),
                                  Container(
                                    child: Text((controller.testData!.questions![index].choices![2].slNo  ??"" ) +". "+
                                        ( controller.testData!.questions![index].choices![2].choiceName?? "")),
                                  )
                                ],
                              )
                              ,
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.testData!.questions![index].choices![3].isSelected,
                                      onChanged: (value){
                                        if(value == true){
                                          controller.testData!.questions![index].choices![3].isSelected = true;
                                          controller.testData!.questions![index].choices![1].isSelected = false;
                                          controller.testData!.questions![index].choices![2].isSelected = false;
                                          controller.testData!.questions![index].choices![0].isSelected = false;
                                        }else{
                                          controller.testData!.questions![index].choices![3].isSelected = false;
                                        }
                                        controller.refreshUi();

                                      }),
                                  Container(
                                    child: Text((controller.testData!.questions![index].choices![3].slNo  ??"" ) +". "+
                                        ( controller.testData!.questions![index].choices![3].choiceName?? "")),
                                  )
                                ],
                              ),
                            ],
                          );
                        }),
                      ),
                    )
                  ),
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
            ):Container(
              child:SpinKitFadingCircle(
                color: Colors.orange,
                size: 40.0,
              ),
            );
          }
        ));
  }
}
