package com.edhaut.edhaut

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.FlutterPlugin
import com.edhaut.edhaut.BluetoothHandlerPlugin
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
   /* override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        flutterEngine.plugins.add(BluetoothHandlerPlugin()) // Add your plugin here
    }*/

 /*   override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Set up your FlutterEngine
        val flutterEngine = FlutterEngine(this)
        flutterEngine.plugins.add(BluetoothHandlerPlugin()) // Add your plugin here
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        // MethodChannel setup (if needed)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "bluetooth_channel").setMethodCallHandler { call, result ->
            // Handle method calls here
        }
    }*/
}
