import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/app_data.dart';
import '../../../routes/app_pages.dart';
import '../controllers/forgotscreen_controller.dart';

class ForgotscreenView extends GetView<ForgotscreenController> {
  ForgotscreenView({Key? key}) : super(key: key);
  ForgotscreenController controller = Get.find<ForgotscreenController>();
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
              height: MediaQuery.of(context).size.height * 0.7,
              child: Image.asset('assets/forgotpassword.jpg', fit: BoxFit.fill),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFfff0d9),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, bottom: 0, right: 12, top: 0),
                child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("Student: "),
                        ),
                        Radio(
                            value: userType.Student,
                            groupValue: controller.user.value,
                            onChanged: (value) {
                              controller.user.value = value!;
                            }),
                        Container(
                          child: Text("Teacher: "),
                        ),
                        Radio(
                            value: userType.Teacher,
                            groupValue: controller.user.value,
                            onChanged: (value) {
                              controller.user.value = value!;
                            }),
                      ],
                    )),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFfff0d9),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, bottom: 5, right: 12, top: 5),
                      child: formFieldemail("Email", Icons.email_outlined),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.RESETPASSWORD);
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side:
                                BorderSide(width: 1, color: Colors.blueAccent),
                          ),
                        ),
                      ),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                                child: Text(
                              'Submit',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )),
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

  Widget formFieldemail(String hint, IconData icons) {
    return TextFormField(
      style: TextStyle(fontSize: AppData.hinttextSize),
      autofocus: false,
      // enabled: enable,
      // controller:controller.userNameController,
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
        fillColor: Colors.white,
        filled: true,
        // border: InputBorder.none,

        prefixIcon: Icon(icons, color: Colors.black),
        // border:InputBorder.none ,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
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

        contentPadding: EdgeInsets.only(left: 0, top: 15, right: 4, bottom: 0),
      ),
    );
  }
}
