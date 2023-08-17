import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/blurtoothscreen_controller.dart';

class BlurtoothscreenView extends GetView<BlurtoothscreenController> {
  BlurtoothscreenView({Key? key}) : super(key: key);
  final BlurtoothscreenController bluetoothController = Get.put(
      BlurtoothscreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Plugin Example'),
      ),
      body: GetBuilder<BlurtoothscreenController>(
          id: "blue",
          builder: (bluetoothController) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: bluetoothController.startDiscovery,
                child: Text('Start Discovery'),
              ),
              ElevatedButton(
                onPressed: bluetoothController.connectToNearbyDevice,
                child: Text('Connect to Nearby Device'),
              ),
              Obx(() {
                return Text(
                  bluetoothController.isConnected.value
                      ? 'Connected'
                      : 'Disconnected',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              }),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: bluetoothController.disconnect,
        child: Icon(Icons.bluetooth_disabled),
      ),
    );
  }
}
