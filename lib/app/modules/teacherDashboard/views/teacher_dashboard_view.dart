import 'package:edhaut/app/data/ApiFactory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/app_data.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/DropDown.dart';
import '../../../widgets/KeyvalueModel.dart';
import '../controllers/teacher_dashboard_controller.dart';

class TeacherDashboardView extends GetView<TeacherDashboardController> {
   TeacherDashboardView({Key? key}) : super(key: key);
   TeacherDashboardController controller = Get.find<TeacherDashboardController>() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfff0d9),
      appBar: AppBar(
        title: Container(
          color:Color(0xFFFECFAF),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: Image.asset('assets/logo1.jpg', fit: BoxFit.fill),
                  ),
                  Container(
                 /*   width: MediaQuery.of(context).size.width * 0.13,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      // color: Colors.blueAccent,
                      // border: Border.all(width: 1,),
                      image: DecorationImage(
                        image: AssetImage("assets/profile1.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),*/
                    width: MediaQuery.of(context).size.width * 0.43,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child:Obx(()=>Text("Hi "+(controller.studentName.value??""),
                                style: TextStyle(color: Colors.black))) ,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xFFFECFAF),
        automaticallyImplyLeading: false,

      ),
      bottomNavigationBar: Container(
        // height: 50,
        child: BottomNavigationBar(
          currentIndex: 0,
          elevation:9,
          // selectedItemColor:Colors.yellow  ,
          showUnselectedLabels: true,

          // fixedColor: Colors.deepPurple,
          // selectedItemColor: Colors.deepPurple,
          // unselectedItemColor: Colors.black,
          backgroundColor: Color(0xFFFECFAF),
          iconSize: 30,
          onTap: (index) {
            switch (index) {
              case 0:
                print('Navigate to profile');
                // Navigator.pushNamed(context, "/profileMepage");
                break;
              case 1:
                print('Navigate to sync');
                // Get.toNamed(Routes.MYCART);

                // ServerCommunicate.updateFromServer(false, widget.model);

                // Navigator.pushNamed(context, "/profileMepage");
                break;
              case 3:
                print('Navigate to profile');
                // controller.logout();
                logoutPop(Get.context!);
                // Get.toNamed(Routes.PROFILE_SCREEN);
                // Navigator.pushNamed(context, "/referralProgram");
                break;
              case 2:
                print('Navigate to profile');
                // Get.toNamed(Routes.PROFILESCREEN);
                // Navigator.pushNamed(context, "/referralProgram");
                break;
            }
          },
          selectedFontSize: 9,
          unselectedFontSize: 9,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.deepOrangeAccent,
                ),
                label: "Home"
              // backgroundColor: AppData.orangeColor
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_on),
              label: 'Test',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Log out',
            ),
          ],
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height-Get.bottomBarHeight-Get.statusBarHeight,
        child: Column(
          children: [
           Padding(
             padding: const EdgeInsets.all(13.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 _buildTileblue1(
                   title:"Add Class",
                   icon: "assets/class.png",
                   fun: () {

                   },
                   color: Color(0xFFFECFAF),
                   bordercolor:Color(0xFFFECFAF),
                 ),
                 _buildTileblue1(
                   title:"Scheduled Class",
                   icon: "assets/calendar.png",
                   fun: () {
                     Get.toNamed(Routes.SCHEDULEDCLASSSCREEN);

                   },
                   color: Color(0xFFFECFAF),
                   bordercolor:Color(0xFFFECFAF),
                 ),
               ],
             ),
           ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTileblue1(
                    title:"Add Test",
                    icon: "assets/testing.png",
                    fun: () {
                      showPopup();
                    },
                    color: Color(0xFFFECFAF),
                    bordercolor:Color(0xFFFECFAF),
                  ),
                  _buildTileblue1(
                    title:"View Test",
                    icon: "assets/testing.png",
                    fun: () {
                      // showPopup();
                    },
                    color: Color(0xFFFECFAF),
                    bordercolor:Color(0xFFFECFAF),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTileblue1(
                    title:"Ask Question",
                    icon: "assets/why.png",
                    fun: () {
                      Get.toNamed(Routes.GROUPCHATSCREEN);
                    },
                    color: Color(0xFFFECFAF),
                    bordercolor:Color(0xFFFECFAF),
                  ),
                  _buildTileblue1(
                    title:"Attendance",
                    icon: "assets/immigration.png",
                    fun: () {
                      // Get.toNamed(Routes.GROUPCHATSCREEN);
                    },
                    color: Color(0xFFFECFAF),
                    bordercolor:Color(0xFFFECFAF),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

   Widget _buildTileblue1(
       {String? icon,
         String? title,
         double? size,
         Color? bordercolor,
         Color? color,
         void Function()? fun}) {
     return InkWell(
       onTap: fun,
       child: Container(
         /* height: MediaQuery.of(context).size.height * 0.23,*/
         width: Get.width * 0.44,
         height: Get.height * 0.17,
         decoration: BoxDecoration(
           /// borderRadius: BorderRadius.circular(7.0),
           borderRadius: BorderRadius.all(
             Radius.circular(10),
           ),
           boxShadow: [
             BoxShadow(
               blurRadius: 5,
               offset: Offset.zero,
               color: Colors.grey,
             )
           ],
           // gradient: LinearGradient(
           //   begin: Alignment.topRight,
           //   end: Alignment.bottomLeft,
           //   // stops: [
           //   //   0.1,
           //   //   0.2,
           //   // ],
           //   colors: [
           //     // Color(0xFFFF7F7F7),
           //     // Color(0xFFf7eae9),
           //   ],
           // ),
           color: color,
           /*border: Border.all(
              color: bordercolor,
              width: 1.2,
            ),*/
         ),
         child: Stack(
           children: [
             Align(
               alignment: Alignment.center,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   if (icon != null)
                     Image.asset(
                       // "assets/logo1.png"
                       icon,
                       // color: Colors.black,
                       fit: BoxFit.fitWidth,
                       width: 35,
                       height: 35,
                     ),
                   SizedBox(
                     height: 5,
                   ),
                   Text(
                     /*"assets/logo1.png"*/
                       title!,
                       textAlign: TextAlign.center,
                       style: TextStyle(
                           fontSize: 12,
                           color: Colors.deepPurple,
                           fontWeight: FontWeight.bold)),
                 ],
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
       controller:controller.textEditingController[i],
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
           borderSide:
           BorderSide(width: 0, color: Colors.black), //<-- SEE HERE
           borderRadius: BorderRadius.circular(1.0),
         ),
         border: UnderlineInputBorder(
           borderSide:
           BorderSide(width: 0, color: Colors.black), //<-- SEE HERE
           borderRadius: BorderRadius.circular(1.0),
         ),
         focusedBorder: UnderlineInputBorder(
           borderSide:
           BorderSide(width: 0, color: Colors.black), //<-- SEE HERE
           borderRadius: BorderRadius.circular(1.0),
         ) ,
         suffix: Padding(
           padding:
           EdgeInsets.only(right: 05),
           child:Text("("+hint +")",),

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

   Widget formField1ExamDur(String hint, int i) {
     return TextFormField(
       style: TextStyle(fontSize: AppData.hinttextSize),
       autofocus: false,
       // enabled: enable,
       controller:controller.textEditingController[i],
       textCapitalization: TextCapitalization.sentences,
       keyboardType: TextInputType.number,
       inputFormatters: [
         FilteringTextInputFormatter.allow(RegExp("[0-9]")),
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
           borderSide:
           BorderSide(width: 0, color: Colors.black), //<-- SEE HERE
           borderRadius: BorderRadius.circular(1.0),
         ),
         border: UnderlineInputBorder(
           borderSide:
           BorderSide(width: 0, color: Colors.black), //<-- SEE HERE
           borderRadius: BorderRadius.circular(1.0),
         ),
         focusedBorder: UnderlineInputBorder(
           borderSide:
           BorderSide(width: 0, color: Colors.black), //<-- SEE HERE
           borderRadius: BorderRadius.circular(1.0),
         ) ,
         suffix: Padding(
           padding:
           EdgeInsets.only(right: 01),
           child:Text("("+hint +")",),

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

   void logoutPop(
       BuildContext context,
       ) {
     showDialog(
         builder: (context) {
           return AlertDialog(
             contentPadding: EdgeInsets.only(left: 5, right: 5, top: 20),
             insetPadding: EdgeInsets.only(left: 5, right: 5, top: 30),
             content: StatefulBuilder(
               builder: (BuildContext context, StateSetter setState1) {
                 return Container(
                   width: MediaQuery.of(context).size.width * 0.86,
                   child: SingleChildScrollView(
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         // SizedBox(height: 7),
                         Padding(
                           padding: const EdgeInsets.only(left: 0, right: 0),
                           child: Column(
                             children: [
                               // SizedBox(height: 7),
                               Text(
                                 "Logout",
                                 style: TextStyle(
                                     fontSize: 14,
                                     color: Colors.deepPurple,
                                     fontWeight: FontWeight.bold),
                               ),
                               SizedBox(height: 12),
                               Text(
                                 "ARE YOU SURE WANT TO LOGOUT?",
                                 style: TextStyle(
                                   fontSize: 14,
                                 ),
                               ),
                               SizedBox(height: 40),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                 );
               },
             ),
             actions: <Widget>[
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Center(
                     child: TextButton(
                       // color: Colors.deepPurple,
                       //textColor: Colors.grey,
                       style: TextButton.styleFrom(
                         primary: Colors.deepPurple,
                         backgroundColor: Colors.deepPurple,
                         onSurface: Colors.deepPurple,
                       ),
                       child: Text("No",
                           style: TextStyle(color: Colors.white)),
                       onPressed: () {
                         Navigator.pop(context);
                       },
                     ),
                   ),
                   SizedBox(
                     width: 10,
                   ),
                   Center(
                     child: TextButton(
                       // color: Colors.deepPurple,
                       //textColor: Colors.grey,
                       style: TextButton.styleFrom(
                         primary: Colors.deepPurple,
                         backgroundColor: Colors.deepPurple,
                         onSurface: Colors.deepPurple,
                       ),
                       child: Text(
                         "Yes",
                         //style: TextStyle(color: Colors.grey),
                         style: TextStyle(color: Colors.white),
                       ),
                       onPressed: () {
                         controller.logout();
                         // logout(context);
                         // Navigator.pop(context);
                       },
                     ),
                   ),
                 ],
               ),
             ],
           );
         },
         context: context);
   }

   void showPopup() {
    controller.textEditingController[0].text="";
    controller.textEditingController[1].text="";
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
             width: Get.width*0.93,
             // height: Get.height*0.5,
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 12.0,bottom: 2,right:12,top: 2 ),
                   child: formField1("Test Name",0),
                 ),
                 Padding(  padding: const EdgeInsets.only(left: 12.0,bottom: 2,right:12,top: 2 ),
                   child: DropDown.networkDropdownGetpartStu("Select Your Class",
                      ApiFactory.GETALLCLASSESDROP,'classStu',
                           (KeyvalueModel map){
                         // StudentsignupscreenController.className = map;
                             TeacherDashboardController.className = map;

                       },Icons.class_sharp),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 12.0,bottom: 2,right:12,top: 2 ),
                   child: formFieldDate(1,"Test Date"),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 12.0,bottom: 2,right:12,top: 2 ),
                   child: formField1("Test Topic",2),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 12.0,bottom: 2,right:12,top: 2 ),
                   child: formField1ExamDur("Dur in Min",3),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 12.0,bottom: 2,right:12,top: 2 ),
                   child: formField1ExamDur("Total Mark",4),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 12.0,bottom: 2,right:12,top: 2 ),
                   child: formField1ExamDur("Individual Mark",5),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 12.0,bottom: 2,right:12,top: 2 ),
                   child: formField1ExamDur("Total No. Qus.",6),
                 ),

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
                 padding: const EdgeInsets.only(left: 8.0,right: 1),
                 child: TextButton(
                   onPressed: () {
                     Get.back(); // Close the popup
                   },
                   style: TextButton.styleFrom(
                     primary:Color(0xFFFECFAF),
                     backgroundColor:Color(0xFFFECFAF),
                     onSurface: Color(0xFFFECFAF),
                   ),
                   child: Text('cancel',style: TextStyle(color: Colors.black)),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 8.0,right: 0),
                 child: TextButton(
                   onPressed: () {
                     controller.validateField();
                   },
                   style: TextButton.styleFrom(
                     primary:Color(0xFFFECFAF),
                     backgroundColor:Color(0xFFFECFAF),
                     onSurface: Color(0xFFFECFAF),
                   ),
                   child: Text('Submit',style: TextStyle(color: Colors.black)),
                 ),
               ),
             ],
           ),
         ],
       ),
     );
   }


}
