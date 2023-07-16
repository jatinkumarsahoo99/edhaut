import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../controllers/view_result_student_controller.dart';

class ViewResultStudentView extends GetView<ViewResultStudentController> {
   ViewResultStudentView({Key? key}) : super(key: key);
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
      body: Container(
        child:GetBuilder<ViewResultStudentController>(
            id: 'test',
            builder: (controller) {
              return (controller.getAllTestModel != null)?
              ListView.builder(
                  itemCount: controller.getAllTestModel!.body!.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:  Color(0xFFFECFAF),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text("Exam name: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    child: Text(controller.getAllTestModel!.body![index].examName??""),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text("Class: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    child: Text(controller.getAllTestModel!.body![index].className??""),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text("Exam Date: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    child: Text(controller.getAllTestModel!.body![index].examDate??""),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text("Exam Duration(Min): ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    child: Text(controller.getAllTestModel!.body![index].examDuration??""),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text("Total Question: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    child: Text(controller.getAllTestModel!.body![index].totalQuestion??""),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text("Total Mark: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    child: Text(controller.getAllTestModel!.body![index].tpotalMark??""),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text("Individual Mark: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    child: Text(controller.getAllTestModel!.body![index].individualMark??""),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    (controller.getAllTestModel!.body![index].appear == true)? InkWell(
                                      onTap: () {

                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.white, width: 1),
                                              color: Colors.green,
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(6))),
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                                          child: Text(
                                            "View Result",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ):InkWell(
                                      onTap: () {
                                        // showPopup();
                                        // AppData.launchURL(controller.scheduledClasses!.body![index].classUrl??"");
                                        // Get.toNamed(Routes.ATTENDTESTBYSTUDENT,arguments:controller.getAllTestModel!.body![index].toJson());
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
                                            "Attend Test",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  }):Container(
                child:const SpinKitFadingCircle(
                  color: Colors.orange,
                  size: 40.0,
                ),
              );
            }
        ) ,
      ),
    );
  }
}
