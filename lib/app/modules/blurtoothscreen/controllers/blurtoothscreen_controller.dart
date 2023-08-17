import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BlurtoothscreenController extends GetxController {
  //TODO: Implement BlurtoothscreenController

  static const platform = MethodChannel('bluetooth_channel');
  final MethodChannel _methodChannel = MethodChannel('bluetooth_channel');
// Inside _MyAppState class
  Future<void> startDiscovery() async {
    try {
      final String devicesJson = await _methodChannel.invokeMethod('startDiscovery');
      final List<dynamic> devices = jsonDecode(devicesJson);

      // Process the list of devices and update the UI or store the data as needed

      print('Discovery started successfully'+devices.toString());
    } on PlatformException catch (e) {
      print('Error: ${e.message}');
    }
  }


  final isConnected = false.obs;



  Future<void> connectToNearbyDevice() async {
    try {
      final bool success = await platform.invokeMethod('connectToNearbyDevice');
      if (success) {
        isConnected.value = true;
        print('Connected to nearby device');
      } else {
        isConnected.value = false;
        print('Connection failed');
      }
    } on PlatformException catch (e) {
      print('Error: ${e.message}');
    }
  }

  void disconnect() {
    isConnected.value = false;
    // Implement your disconnect logic here
  }

@override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady() {
    startDiscovery();
    super.onReady();
  }


}
