import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/app_data.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/CustomTabView.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
   DashboardView({Key? key}) : super(key: key);
   DashboardController controller = Get.find<DashboardController>();
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
                      width: MediaQuery.of(context).size.width * 0.13,
                      height: MediaQuery.of(context).size.height * 0.07,
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
            ),
          ),
          backgroundColor: Color(0xFFFECFAF),
          automaticallyImplyLeading: false,

        ),
        bottomNavigationBar:  Container(
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
                  controller.logout();

                  // Get.toNamed(Routes.PROFILE_SCREEN);
                  // Navigator.pushNamed(context, "/referralProgram");
                  break;
                case 2:
                  print('Navigate to profile');
                  Get.toNamed(Routes.PROFILESCREEN);
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
          // height: MediaQuery.of(context).size.height*0.98,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
                  // #FFDEC2
                color: Color(0xFFFFDEC2),
                child: CarouselSlider(
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height*0.2,
                        autoPlay: true,
                        pageSnapping: true,
                        viewportFraction: 1,
                        scrollDirection: Axis.horizontal,
                        disableCenter: true,
                        autoPlayInterval: Duration(seconds: 5),
                        //autoPlayAnimationDuration: Duration(seconds: 90),
                        pauseAutoPlayInFiniteScroll: true,
                        onPageChanged: (index, reason) {
                          // setState(
                          //       () {
                          //     _currentIndex = index;
                          //   },
                          // );
                        }),
                    items: [
                      InkWell(
                        onTap: () {
                          // int index = imageSliders.indexOf(item);
                          // AppData.launchURL(item.vdoURL);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ) ,
                            child: Container(
                                // margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                // color: Colors.blueAccent,
                                // border: Border.all(width: 1,),
                                image: DecorationImage(
                                  image: AssetImage("assets/joinclass.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              ),
                          ),
                        ),
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.06,
                          child: formFieldemail("Subject, Class, etc", Icons.search)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8,top: 0,bottom: 0),
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.06,
                        // width: MediaQuery.of(context).size.width*0.08,
                        decoration: BoxDecoration(
                          // color: Colors.blueAccent,
                          // border: Border.all(width: 1,),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color:Colors.orange ,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(Icons.filter_list,color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    color: Color(0xFFFFF0D9),
                    child: CustomTabView(itemCount: controller.header.length,
                      initPosition: 0,
                      tabBuilder: (BuildContext context, int index) {
                        return Tab(
                          text: controller.header[index],
                        );
                      },
                      pageBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(13.0),
                          child:Container(
                            height: MediaQuery.of(context).size.height*0.6,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:MediaQuery.of(context).size.width*0.4,
                                        child: Column(
                                          children: [
                                            Container(

                                              decoration: BoxDecoration(
                                                // color: Colors.blueAccent,
                                                // border: Border.all(width: 1,),
                                                image: DecorationImage(
                                                  image: AssetImage("assets/physics.jpg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                color: Colors.red,
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                              ),
                                              // child: Text('jks'),
                                              height: MediaQuery.of(context).size.height*0.16,
                                              width: MediaQuery.of(context).size.width*0.4,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(

                                                  children: [
                                                    Container(
                                                      child: Text("Physics(8th)"),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Icon(Icons.groups_outlined,color: Colors.orange,size: 15),
                                                        ),
                                                        Container(
                                                          child: Text("55+ enrolled",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child:Icon(Icons.bookmark_added_rounded,color: Colors.orange,size: 35),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:MediaQuery.of(context).size.width*0.4,
                                        child: Column(
                                          children: [
                                            Container(

                                              decoration: BoxDecoration(
                                                // color: Colors.blueAccent,
                                                // border: Border.all(width: 1,),
                                                image: DecorationImage(
                                                  image: AssetImage("assets/math.jpg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                color: Colors.red,
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                              ),
                                              // child: Text('jks'),
                                              height: MediaQuery.of(context).size.height*0.16,
                                              width: MediaQuery.of(context).size.width*0.4,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(

                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment. start,
                                                      children: [
                                                        Container(
                                                          child: Text("Math(11th)"),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Icon(Icons.groups_outlined,color: Colors.orange,size: 15),
                                                        ),
                                                        Container(
                                                          child: Text("+50 Members",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child:Icon(Icons.bookmark_added_rounded,color: Colors.orange,size: 35),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:MediaQuery.of(context).size.width*0.4,
                                        child: Column(
                                          children: [
                                            Container(

                                              decoration: BoxDecoration(
                                                // color: Colors.blueAccent,
                                                // border: Border.all(width: 1,),
                                                image: DecorationImage(
                                                  image: AssetImage("assets/biology.jpg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                color: Colors.red,
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                              ),
                                              // child: Text('jks'),
                                              height: MediaQuery.of(context).size.height*0.16,
                                              width: MediaQuery.of(context).size.width*0.4,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(

                                                  children: [
                                                    Container(
                                                      child: Text("Biology(8th)"),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Icon(Icons.groups_outlined,color: Colors.orange,size: 15),
                                                        ),
                                                        Container(
                                                          child: Text("55+ enrolled",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child:Icon(Icons.bookmark_added_rounded,color: Colors.orange,size: 35),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:MediaQuery.of(context).size.width*0.4,
                                        child: Column(
                                          children: [
                                            Container(

                                              decoration: BoxDecoration(
                                                // color: Colors.blueAccent,
                                                // border: Border.all(width: 1,),
                                                image: DecorationImage(
                                                  image: AssetImage("assets/AI.jpg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                color: Colors.red,
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                              ),
                                              // child: Text('jks'),
                                              height: MediaQuery.of(context).size.height*0.16,
                                              width: MediaQuery.of(context).size.width*0.4,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(

                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          child: Text("AI(8th)"),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Icon(Icons.groups_outlined,color: Colors.orange,size: 15),
                                                        ),
                                                        Container(
                                                          child: Text("55+ enrolled",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child:Icon(Icons.bookmark_added_rounded,color: Colors.orange,size: 35),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:MediaQuery.of(context).size.width*0.4,
                                        child: Column(
                                          children: [
                                            Container(

                                              decoration: BoxDecoration(
                                                // color: Colors.blueAccent,
                                                // border: Border.all(width: 1,),
                                                image: DecorationImage(
                                                  image: AssetImage("assets/physics.jpg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                color: Colors.red,
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                              ),
                                              // child: Text('jks'),
                                              height: MediaQuery.of(context).size.height*0.16,
                                              width: MediaQuery.of(context).size.width*0.4,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(

                                                  children: [
                                                    Container(
                                                      child: Text("Physics(8th)"),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Icon(Icons.groups_outlined,color: Colors.orange,size: 15),
                                                        ),
                                                        Container(
                                                          child: Text("55+ enrolled",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child:Icon(Icons.bookmark_added_rounded,color: Colors.orange,size: 35),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:MediaQuery.of(context).size.width*0.4,
                                        child: Column(
                                          children: [
                                            Container(

                                              decoration: BoxDecoration(
                                                // color: Colors.blueAccent,
                                                // border: Border.all(width: 1,),
                                                image: DecorationImage(
                                                  image: AssetImage("assets/physics.jpg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                color: Colors.red,
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                              ),
                                              // child: Text('jks'),
                                              height: MediaQuery.of(context).size.height*0.16,
                                              width: MediaQuery.of(context).size.width*0.4,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(

                                                  children: [
                                                    Container(
                                                      child: Text("Physics(8th)"),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Icon(Icons.groups_outlined,color: Colors.orange,size: 15),
                                                        ),
                                                        Container(
                                                          child: Text("55+ enrolled",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child:Icon(Icons.bookmark_added_rounded,color: Colors.orange,size: 35),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      onPositionChange: (index){

                      }
                      ,
                      onScroll: (position) => print("On Scrolled Called>>>>${position.toString()}"),
                    ),
                  ),
                ),
              ),


            ],
          ),
        ));
  }


  Widget formFieldemail(String hint, IconData icons) {
    return TextFormField(
      style: TextStyle(fontSize: AppData.hinttextSize,color: Colors.white),
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
        fillColor:Colors.deepPurple,
        filled: true,
        // border: InputBorder.none,

        prefixIcon: Icon(icons, color: Colors.orange),
        // border:InputBorder.none ,
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(5.0),
        ),
        border: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0, color: Colors.white), //<-- SEE HERE
          borderRadius: BorderRadius.circular(5.0),
        ) ,

        hintStyle: TextStyle(
          color: Colors.grey, // <-- Change this
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

        contentPadding: EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }

}
