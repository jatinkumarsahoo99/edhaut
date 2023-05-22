import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      body: const Center(
        child: Text(
          'Under Development',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
