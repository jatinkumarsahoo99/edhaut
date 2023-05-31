import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StudentsignupscreenController extends GetxController {
  //TODO: Implement StudentsignupscreenController
  List<TextEditingController> textEditingController =
  [new TextEditingController(),new TextEditingController(),new TextEditingController(),
    new TextEditingController(),new TextEditingController(),new TextEditingController(),
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
