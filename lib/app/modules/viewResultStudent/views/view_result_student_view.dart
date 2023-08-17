import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
              return (controller.allSubmitedTestWithResultModel != null)?
              ListView.builder(
                  itemCount: controller.allSubmitedTestWithResultModel!.body!.length,
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
                                    child: Text(controller.allSubmitedTestWithResultModel!.body![index].testName??""),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text("Class: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    child: Text(controller.allSubmitedTestWithResultModel!.body![index].className??""),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text("Total Mark: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    child: Text(controller.allSubmitedTestWithResultModel!.body![index].tpotalMark??""),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text("Mark Secured: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.15,
                                    decoration:  BoxDecoration(
                                      color: Colors.greenAccent,
                                      border: Border.all(width: 1,color: Colors.greenAccent),
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text("90"),
                                          Divider(height: 2,color: Colors.black,thickness: 2,),
                                          Text("100"),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    new CircularPercentIndicator(
                                      radius: 25.0,
                                      // lineWidth: 4.0,
                                      percent: 0.60,
                                      center: new Text("60%",),
                                      progressColor: Colors.yellow,
                                    ),
                                    Container(
                                      child: Image.asset("assets/passed.png",height: 30,width: 30),
                                    ),
                                    InkWell(
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
                                    )
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
