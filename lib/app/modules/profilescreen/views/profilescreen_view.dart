import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/profilescreen_controller.dart';

class ProfilescreenView extends GetView<ProfilescreenController> {
  const ProfilescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:   Color(0xFFfff0d9),
      appBar: AppBar(
        title:  Text('Profile',style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black)),
        backgroundColor: Color(0xFFFECFAF),
      ),
      body:Container(
        // height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFfff0d9),
              Color(0xFFFECFAF),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.28,
                height: MediaQuery.of(context).size.height * 0.16,
                decoration: BoxDecoration(
                  // color: Colors.blueAccent,
                  // border: Border.all(width: 1,),
                  image: DecorationImage(
                    image: AssetImage("assets/profile1.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                /*   child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.asset('assets/profil1.jpg', fit: BoxFit.fill)),*/
              ),
            ],
          ),
        ),
            Container(
              child: Text("Name"),
            ),
            Container(
              child: Text("Email Id"),
            ),

            Row(
              children: [
                SizedBox(
                  width: 6,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    child: FloatingActionButton(
                      onPressed: () {
                        // controller.navigateToSignIn();
                        // Get.toNamed(Routes.SIGNINSCREEN);
                      },
                      child:
                      Icon(Icons.edit, color: Colors.white),
                      // foregroundColor: ,
                      // #F5F5F5 #EBEBEB #E1E1E1 #D7D7D7 #CDCDCD #C3C3C3 #B9B9B9 #AFAFAF
                      backgroundColor: Colors.green,
                      elevation:0 ,
                    ),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.63,
                      child: Text("Edit Profile",style: TextStyle(color: Colors.grey,fontSize: 12)),
                    ),
                  ],
                ),
                Container(
                  child: Icon(Icons.arrow_forward_ios,color: Colors.grey),
                )
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    child: Text('General Settings',style: TextStyle(color: Colors.black,fontSize: 25)),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.44,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      key: GlobalKey(),
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            child: FloatingActionButton(
                              onPressed: () {
                                // controller.navigateToSignIn();
                                // Get.toNamed(Routes.SIGNINSCREEN);
                              },
                              child:
                              Icon( FontAwesomeIcons.globe, color: Colors.white),
                              // foregroundColor: ,
                              // #F5F5F5 #EBEBEB #E1E1E1 #D7D7D7 #CDCDCD #C3C3C3 #B9B9B9 #AFAFAF
                              backgroundColor: Colors.amber,
                              elevation:0 ,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.63,
                              child: Text("Language",style: TextStyle(color: Colors.grey,fontSize: 12)),
                            ),
                          ],
                        ),
                        Container(
                          child: Icon(Icons.arrow_forward_ios,color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      key: GlobalKey(),
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            child: FloatingActionButton(
                              onPressed: () {
                                // controller.navigateToSignIn();
                                // Get.toNamed(Routes.SIGNINSCREEN);
                              },
                              child:
                              Icon(Icons.question_mark, color: Colors.deepPurple),
                              // foregroundColor: ,
                              // #F5F5F5 #EBEBEB #E1E1E1 #D7D7D7 #CDCDCD #C3C3C3 #B9B9B9 #AFAFAF
                              backgroundColor: Colors.grey,
                              elevation:0 ,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.63,
                              child: Text("About",style: TextStyle(color: Colors.grey,fontSize: 12)),
                            ),
                          ],
                        ),
                        Container(
                          child: Icon(Icons.arrow_forward_ios,color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      key: GlobalKey(),
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            child: FloatingActionButton(
                              onPressed: () {
                                // controller.navigateToSignIn();
                                // Get.toNamed(Routes.SIGNINSCREEN);
                              },
                              child:
                              Icon(Icons.description, color: Colors.white),
                              // foregroundColor: ,
                              // #F5F5F5 #EBEBEB #E1E1E1 #D7D7D7 #CDCDCD #C3C3C3 #B9B9B9 #AFAFAF
                              backgroundColor: Colors.blueAccent,
                              elevation:0 ,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.63,
                              child: Text("Term & Conditions",style: TextStyle(color: Colors.grey,fontSize: 12)),
                            ),
                          ],
                        ),
                        Container(
                          child: Icon(Icons.arrow_forward_ios,color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      key: GlobalKey(),
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            child: FloatingActionButton(
                              onPressed: () {
                                // controller.navigateToSignIn();
                                // Get.toNamed(Routes.SIGNINSCREEN);
                              },
                              child:
                              Icon(Icons.lock, color: Colors.white),
                              // foregroundColor: ,
                              // #F5F5F5 #EBEBEB #E1E1E1 #D7D7D7 #CDCDCD #C3C3C3 #B9B9B9 #AFAFAF
                              backgroundColor: Colors.deepOrange,
                              elevation:0 ,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.63,
                              child: Text("Privacy Policy",style: TextStyle(color: Colors.grey,fontSize: 12)),
                            ),
                          ],
                        ),
                        Container(
                          child: Icon(Icons.arrow_forward_ios,color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      key: GlobalKey(),
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            child: FloatingActionButton(
                              onPressed: () {
                                // controller.navigateToSignIn();
                                // Get.toNamed(Routes.SIGNINSCREEN);
                              },
                              child:
                              Icon(Icons.star, color: Colors.white),
                              // foregroundColor: ,
                              // #F5F5F5 #EBEBEB #E1E1E1 #D7D7D7 #CDCDCD #C3C3C3 #B9B9B9 #AFAFAF
                              backgroundColor: Colors.deepPurple,
                              elevation:0 ,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.63,
                              child: Text("Rate This App",style: TextStyle(color: Colors.grey,fontSize: 12)),
                            ),
                          ],
                        ),
                        Container(
                          child: Icon(Icons.arrow_forward_ios,color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      key: GlobalKey(),
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            child: FloatingActionButton(
                              onPressed: () {
                                // controller.navigateToSignIn();
                                // Get.toNamed(Routes.SIGNINSCREEN);
                              },
                              child:
                              Icon(Icons.share, color: Colors.white),
                              // foregroundColor: ,
                              // #F5F5F5 #EBEBEB #E1E1E1 #D7D7D7 #CDCDCD #C3C3C3 #B9B9B9 #AFAFAF
                              backgroundColor: Colors.purpleAccent,
                              elevation:0 ,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.63,
                              child: Text("Share This App",style: TextStyle(color: Colors.grey,fontSize: 12)),
                            ),
                          ],
                        ),
                        Container(
                          child: Icon(Icons.arrow_forward_ios,color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
           
          ],
        ),
      )
    );
  }
}
