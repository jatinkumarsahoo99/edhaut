import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/studentdashboard_controller.dart';

class StudentdashboardView extends GetView<StudentdashboardController> {
   StudentdashboardView({Key? key}) : super(key: key);
   StudentdashboardController controller = Get.find<StudentdashboardController>() ;
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
                Get.toNamed(Routes.GROUPCHATSCREEN);
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
              icon: Icon(Icons.chat),
              label: 'Chat',
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
      body:  Container(
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
                    title:"Attend Classes",
                    icon: "assets/class.png",
                    fun: () {
                      Get.toNamed(Routes.ATTENDCLASSSTUDENT);

                    },
                    color: Color(0xFFFECFAF),
                    bordercolor:Color(0xFFFECFAF),
                  ),
                  _buildTileblue1(
                    title:"Attend Test",
                    icon: "assets/calendar.png",
                    fun: () {
                      Get.toNamed(Routes.STUDENTATTENDTEST);

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
                    title:"View Result",
                    icon: "assets/testing.png",
                    fun: () {
                      // showPopup();
                    },
                    color: Color(0xFFFECFAF),
                    bordercolor:Color(0xFFFECFAF),
                  ),
                  _buildTileblue1(
                    title:"Ask Question",
                    icon: "assets/why.png",
                    fun: () {
                      Get.toNamed(Routes.GROUPCHATSCREEN);
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
}
