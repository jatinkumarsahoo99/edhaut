import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../data/app_data.dart';
import '../controllers/studentsignupscreen_controller.dart';

class StudentsignupscreenView extends GetView<StudentsignupscreenController> {
   StudentsignupscreenView({Key? key}) : super(key: key);
   StudentsignupscreenController controller = Get.find<StudentsignupscreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFECFAF),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset('assets/study.jpg', fit: BoxFit.fill),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFFfff0d9),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0,bottom: 8,right:12,top: 8 ),
                          child: formField1("Username", Icons.account_circle_outlined,0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0,bottom: 8,right:12,top: 8 ),
                          child: formFieldemail("Email", Icons.email_outlined,1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0,bottom: 8,right:12,top: 8 ),
                          child: formFieldPassword("Password", Icons.lock_outlined,2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0,bottom: 8,right:12,top: 8 ),
                          child: formFieldPassword("Confirm Password", Icons.lock_outlined,3),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Checkbox(value: true, onChanged: (value){

                              }),
                              Container(
                                child: Text("Remember Password"),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Get.toNamed(Routes.LOGINSCREEN);
                            // controller.validateField();
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(width: 1, color: Colors.blueAccent),
                              ),
                            ),
                          ),
                          child: Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Center(child: Text('Sign Up',
                                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                              )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget formField1(String hint, IconData icons, int i) {
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
        fillColor:Colors.white,
        filled: true,
        // border: InputBorder.none,

        prefixIcon: Icon(icons, color: Colors.black),
        // border:InputBorder.none ,
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        border: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ) ,

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

        contentPadding: EdgeInsets.only(left: 0, top: 15, right: 4, bottom: 0),
      ),
    );
  }
  Widget formFieldemail(String hint, IconData icons, int i) {
    return TextFormField(
      style: TextStyle(fontSize: AppData.hinttextSize),
      autofocus: false,
      // enabled: enable,
      controller:controller.textEditingController[i],
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.text,
      /*  inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z. ]")),
      ],*/
      decoration: InputDecoration(
        //prefixIcon: Icon(Icons.insert_drive_file_outlined),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        // alignLabelWithHint: true,
        hintText: hint,
        fillColor:Colors.white,
        filled: true,
        // border: InputBorder.none,

        prefixIcon: Icon(icons, color: Colors.black),
        // border:InputBorder.none ,
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        border: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ) ,

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

        contentPadding: EdgeInsets.only(left: 0, top: 15, right: 4, bottom: 0),
      ),
    );
  }

  Widget formFieldPassword(String hint, IconData icons, int i) {
    return TextFormField(
      style: TextStyle(fontSize: AppData.hinttextSize),
      autofocus: false,
      // enabled: enable,
      controller:controller.textEditingController[i],
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.text,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z.0-9 @]")),
      ],
      decoration: InputDecoration(
        //prefixIcon: Icon(Icons.insert_drive_file_outlined),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        // alignLabelWithHint: true,
        hintText: hint,
        fillColor:Colors.white,
        filled: true,
        // border: InputBorder.none,

        prefixIcon: Icon(icons, color: Colors.black),
        // border:InputBorder.none ,
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        border: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ) ,

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

        contentPadding: EdgeInsets.only(left: 0, top: 15, right: 4, bottom: 0),
      ),
    );
  }
}
