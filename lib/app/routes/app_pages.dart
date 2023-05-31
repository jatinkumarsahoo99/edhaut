import 'package:get/get.dart';

import '../modules/admindashboard/bindings/admindashboard_binding.dart';
import '../modules/admindashboard/views/admindashboard_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/forgotscreen/bindings/forgotscreen_binding.dart';
import '../modules/forgotscreen/views/forgotscreen_view.dart';
import '../modules/groupchatscreen/bindings/groupchatscreen_binding.dart';
import '../modules/groupchatscreen/views/groupchatscreen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loginscreen/bindings/loginscreen_binding.dart';
import '../modules/loginscreen/views/loginscreen_view.dart';
import '../modules/profilescreen/bindings/profilescreen_binding.dart';
import '../modules/profilescreen/views/profilescreen_view.dart';
import '../modules/resetpassword/bindings/resetpassword_binding.dart';
import '../modules/resetpassword/views/resetpassword_view.dart';
import '../modules/signupscreen/bindings/signupscreen_binding.dart';
import '../modules/signupscreen/views/signupscreen_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/studentsignupscreen/bindings/studentsignupscreen_binding.dart';
import '../modules/studentsignupscreen/views/studentsignupscreen_view.dart';
import '../modules/teacherDashboard/bindings/teacher_dashboard_binding.dart';
import '../modules/teacherDashboard/views/teacher_dashboard_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUPSCREEN,
      page: () => SignupscreenView(),
      binding: SignupscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGINSCREEN,
      page: () => LoginscreenView(),
      binding: LoginscreenBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTSCREEN,
      page: () => ForgotscreenView(),
      binding: ForgotscreenBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => ResetpasswordView(),
      binding: ResetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.PROFILESCREEN,
      page: () => ProfilescreenView(),
      binding: ProfilescreenBinding(),
    ),
    GetPage(
      name: _Paths.ADMINDASHBOARD,
      page: () => AdmindashboardView(),
      binding: AdmindashboardBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_DASHBOARD,
      page: () => TeacherDashboardView(),
      binding: TeacherDashboardBinding(),
    ),
    GetPage(
      name: _Paths.STUDENTSIGNUPSCREEN,
      page: () => StudentsignupscreenView(),
      binding: StudentsignupscreenBinding(),
    ),
    GetPage(
      name: _Paths.GROUPCHATSCREEN,
      page: () =>  GroupchatscreenView(),
      binding: GroupchatscreenBinding(),
    ),
  ];
}
