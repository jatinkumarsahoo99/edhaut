import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../../../data/app_data.dart';
import '../controllers/attendclassstudent_controller.dart';

class AttendclassstudentView extends GetView<AttendclassstudentController> {
   AttendclassstudentView({Key? key}) : super(key: key);
   AttendclassstudentController controller = Get.find<AttendclassstudentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFECFAF),
      appBar: AppBar(
        title: Text("Scheduled Classes", style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFFFECFAF),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<AttendclassstudentController>(
                  id: "class",
                  builder: (controller) {
                    return (controller.scheduledClasses != null)? ListView.builder(
                        itemCount:controller.scheduledClasses!.body!.length,
                        itemBuilder: ( context,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color:Color(0xFFFECFAF),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Text("Class Name: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
                                        ),
                                        Container(
                                          child: Text(controller.scheduledClasses!.body![index].className??""),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text("Class Date: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
                                        ),
                                        Container(
                                          child: Text(controller.scheduledClasses!.body![index].classDate??""),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text("Class Start time: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
                                        ),
                                        Container(
                                          child: Text(controller.scheduledClasses!.body![index].classStartTime??""),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Text("Class End time: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
                                        ),
                                        Container(
                                          child: Text(controller.scheduledClasses!.body![index].classEndTime??""),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              // showPopup();
                                              AppData.launchURL(controller.scheduledClasses!.body![index].classUrl??"");
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
                                                  "Join",
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
                      child: const SpinKitFadingCircle(
                        color: Colors.orange,
                        size: 40.0,
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
