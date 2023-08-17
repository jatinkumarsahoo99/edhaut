import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app/data/BinderData.dart';
import 'app/data/CustomTheme.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Sizer(
      builder: (context,orientation, device) {
        _setStatusBarNavigationBarTheme(CustomTheme().baseTheme);
        return GetMaterialApp(
          title: "Application",
            theme: CustomTheme().baseTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
            initialBinding: BinderData()
        );
      }
    ),
  );
}
void _setStatusBarNavigationBarTheme(ThemeData themeData) {
  final brightness = !kIsWeb && Platform.isAndroid
      ? themeData.brightness == Brightness.light
      ? Brightness.dark
      : Brightness.light
      : themeData.brightness;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: brightness,
    statusBarBrightness: brightness,
    // systemNavigationBarColor: themeData.backgroundColor,
    // systemNavigationBarDividerColor: Colors.transparent,
    // systemNavigationBarIconBrightness: brightness,
  ));
}