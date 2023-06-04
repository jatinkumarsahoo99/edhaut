import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../../../data/app_data.dart';
import '../../../widgets/DropDown.dart';
import '../../../widgets/KeyvalueModel.dart';
import '../controllers/scheduledclassscreen_controller.dart';

class ScheduledclassscreenView extends GetView<ScheduledclassscreenController> {
   ScheduledclassscreenView({Key? key}) : super(key: key);
   ScheduledclassscreenController controller = Get.find<ScheduledclassscreenController>();
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 4),
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
                        "Scheduled Class",
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
            child: GetBuilder<ScheduledclassscreenController>(
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
   Widget formFieldClassurl(
       int index,
       String hint,
       ) {
     return Padding(
       padding: const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 7.0),
       child: TextFormField(
         /*inputFormatters: [
           FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9  ]")),
         ],*/
         style: TextStyle(fontSize: AppData.hinttextSize),
         autofocus: false,
         controller: controller.textEditingController[index],
         keyboardType: TextInputType.text,
         maxLines: 3,
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

   Widget formFieldStartTime(
       int index,
       String hint,
       ) {
     return GestureDetector(
       onTap: () {
         controller.selectTime1(index);
       },
       child: AbsorbPointer(
         child: TextFormField(
           style: TextStyle(fontSize: AppData.hinttextSize),
           autofocus: false,
           enabled: true,
           controller: controller.textEditingController[index],
           keyboardType: TextInputType.text,
           // inputFormatters: [
           //   FilteringTextInputFormatter.allow(RegExp("[a-zA-Z. ]")),
           // ],
           decoration: InputDecoration(
             //prefixIcon: Icon(Icons.insert_drive_file_outlined),
             floatingLabelBehavior: FloatingLabelBehavior.always,
             alignLabelWithHint: true,
             hintText: hint,
             hintStyle: TextStyle(
               color: AppData.hinttextcolor, // <-- Change this
               fontSize: AppData.hinttextSize,
               fontWeight: FontWeight.w400,
               fontStyle: FontStyle.normal,
             ),
             suffix: Padding(
               padding:
               EdgeInsets.only(right: 05),
               child:Text("("+hint +")",),

             ),

             labelStyle: TextStyle(
               color: AppData.lebletextcolor, // <-- Change this
               fontSize: AppData.lebletextSize,
               fontWeight: FontWeight.w400,
               fontStyle: FontStyle.normal,
             ),
             contentPadding: EdgeInsets.only(left: 0, top: 4, right: 4),
           ),
         ),
       ),
     );
   }
   Widget formFieldDate(
       int index,
       String hint,
       ) {
     return GestureDetector(
       onTap: () {
         controller.selectDate(index);
       },
       child: AbsorbPointer(
         child: TextFormField(
           style: TextStyle(fontSize: AppData.hinttextSize),
           autofocus: false,
           enabled: true,
           controller: controller.textEditingController[index],
           keyboardType: TextInputType.text,
           // inputFormatters: [
           //   FilteringTextInputFormatter.allow(RegExp("[a-zA-Z. ]")),
           // ],
           decoration: InputDecoration(
             //prefixIcon: Icon(Icons.insert_drive_file_outlined),
             floatingLabelBehavior: FloatingLabelBehavior.always,
             alignLabelWithHint: true,
             hintText: hint,
             hintStyle: TextStyle(
               color: AppData.hinttextcolor, // <-- Change this
               fontSize: AppData.hinttextSize,
               fontWeight: FontWeight.w400,
               fontStyle: FontStyle.normal,
             ),
             suffix: Padding(
               padding:
               EdgeInsets.only(right: 05),
               child:Text("("+hint +")",),

             ),

             labelStyle: TextStyle(
               color: AppData.lebletextcolor, // <-- Change this
               fontSize: AppData.lebletextSize,
               fontWeight: FontWeight.w400,
               fontStyle: FontStyle.normal,
             ),
             contentPadding: EdgeInsets.only(left: 0, top: 4, right: 4),
           ),
         ),
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
             Text('Scheduled a Class'),
           ],
         ),
         content: SingleChildScrollView(
           child: Container(
             width: Get.width * 0.93,
             // height: Get.height*0.5,
             child: Column(
               children:[
                 Padding(
                   padding: const EdgeInsets.only(
                       left: 13.0, right: 13.0, bottom: 2.0),
                   child: formField1("ClassName", 0),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(
                       left: 13.0, right: 13.0, bottom: 2.0),
                   child: formField1("Teacher Name", 1),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(
                       left: 13.0, right: 13.0, bottom: 2.0),
                   child: formField1("Topic", 2),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(
                       left: 13.0, right: 13.0, bottom: 2.0),
                   child: DropDown.staticDropdown("Select platform",
                       "choice", controller.correctChoice, (KeyvalueModel? map) {
                         controller.textEditingController[3].text = map!.key;
                       }),
                 ),
                 formFieldClassurl(4,"Enter Class Url"),
                 Padding(
                   padding: const EdgeInsets.only(left: 12.0,bottom: 2,right:12,top: 2 ),
                   child: formFieldDate(5,"Class date"),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 12.0,bottom: 2,right:12,top: 2 ),
                   child: formFieldStartTime(6,"Start Time"),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 12.0,bottom: 2,right:12,top: 2 ),
                   child: formFieldStartTime(7,"End Time"),
                 ),
               ]
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
