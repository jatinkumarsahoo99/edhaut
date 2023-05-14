import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../data/app_data.dart';
import '../../../routes/app_pages.dart';
import '../controllers/resetpassword_controller.dart';

class ResetpasswordView extends GetView<ResetpasswordController> {
  const ResetpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFECFAF),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.65,
              child: Image.asset('assets/resetpassword.jpg', fit: BoxFit.fill),
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
                      child: formFieldPassword("New Password", Icons.lock_outlined),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0,bottom: 8,right:12,top: 8 ),
                      child: formFieldPassword("Confirm New Password", Icons.lock_outlined),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.LOGINSCREEN);
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
                            child: Center(child: Text('Submit',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget formFieldPassword(String hint, IconData icons) {
    return TextFormField(
      style: TextStyle(fontSize: AppData.hinttextSize),
      autofocus: false,
      // enabled: enable,
      // controller:controller.userNameController,
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
