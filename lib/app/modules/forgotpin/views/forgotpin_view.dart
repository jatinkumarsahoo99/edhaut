import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgotpin_controller.dart';

class ForgotpinView extends GetView<ForgotpinController> {
  const ForgotpinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgotpinView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForgotpinView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
