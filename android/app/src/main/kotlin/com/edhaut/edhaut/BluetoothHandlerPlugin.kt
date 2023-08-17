package com.edhaut.edhaut



import android.Manifest
import android.app.Activity
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.bluetooth.BluetoothSocket
import android.content.Context
import android.content.pm.PackageManager
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.json.JSONArray
import org.json.JSONObject
import java.io.IOException
import java.util.*

class BluetoothHandlerPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private val bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
    private var bluetoothSocket: BluetoothSocket? = null
    private lateinit var context: Context // Declare context variable
    private val MY_PERMISSIONS_REQUEST_BLUETOOTH = 1
    private val MY_PERMISSIONS_REQUEST_BLUETOOTH_SCAN = 2
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext // Initialize the context
        channel = MethodChannel(binding.binaryMessenger, "bluetooth_channel")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        closeBluetoothSocket()
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "startDiscovery" -> startDiscovery(result)
            "connectToNearbyDevice" -> connectToNearbyDevice(result)
            else -> result.notImplemented()
        }
    }
    private fun requestBluetoothPermission() {
        ActivityCompat.requestPermissions(
            context as Activity,
            arrayOf(Manifest.permission.BLUETOOTH),
            MY_PERMISSIONS_REQUEST_BLUETOOTH
        )
    }

    private fun requestBluetoothScanPermission() {
        ActivityCompat.requestPermissions(
            context as Activity,
            arrayOf(Manifest.permission.BLUETOOTH_SCAN),
            MY_PERMISSIONS_REQUEST_BLUETOOTH_SCAN
        )
    }
    private fun startDiscovery(result: MethodChannel.Result) {
        if (!hasBluetoothPermission()) {
            requestBluetoothPermission()
            result.success("[]") // Return indicating the permission is not granted
            return
        }

        if (!hasBluetoothScanPermission()) {
            result.success("[]") // Return indicating the permission to scan is not granted
            return
        }
        val devices = mutableListOf<JSONObject>()
        if (bluetoothAdapter != null) {
            try {
                if (bluetoothAdapter.isDiscovering) {
                    bluetoothAdapter.cancelDiscovery()
                }
                bluetoothAdapter.startDiscovery()
                val pairedDevices: Set<BluetoothDevice>? = bluetoothAdapter?.bondedDevices
                pairedDevices?.forEach { device ->
                    val deviceJson = JSONObject()
                    deviceJson.put("name", device.name)
                    deviceJson.put("address", device.address)
                    devices.add(deviceJson)
                }
                result.success(JSONArray(devices).toString())
//                result.success(true) // Indicate that the discovery process has started
            } catch (e: SecurityException) {
                result.success("[]") // Indicate that the discovery process couldn't start due to a SecurityException
            }
        } else {
            result.success("[]") // Bluetooth adapter is not available
        }
    }

    private fun hasBluetoothPermission(): Boolean {
        return ContextCompat.checkSelfPermission(context, Manifest.permission.BLUETOOTH) == PackageManager.PERMISSION_GRANTED
    }

    private fun hasBluetoothScanPermission(): Boolean {
        return ContextCompat.checkSelfPermission(context, Manifest.permission.BLUETOOTH_SCAN) == PackageManager.PERMISSION_GRANTED
    }

    // bluetoothSocket = device.createRfcommSocketToServiceRecord(UUID.randomUUID())
    private fun connectToNearbyDevice(result: MethodChannel.Result) {
        if (!hasBluetoothPermission()) {
            requestBluetoothPermission()
            result.success(false) // Return indicating the permission is not granted
            return
        }

        val pairedDevices: Set<BluetoothDevice>?
        try {
            pairedDevices = bluetoothAdapter?.bondedDevices
        } catch (se: SecurityException) {
            result.success(false) // Handle SecurityException
            return
        }

        if (pairedDevices != null && pairedDevices.isNotEmpty()) {
            val device: BluetoothDevice = pairedDevices.first() // Connect to the first paired device (you can change this logic)

            try {
                if (bluetoothSocket == null) {
                    val uuid: UUID = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB")
                    bluetoothSocket = device.createRfcommSocketToServiceRecord(uuid)
                }

                if (bluetoothSocket != null) {
                    try {
                        bluetoothSocket?.connect()
                        result.success(true)
                    } catch (e: IOException) {
                        result.success(false)
                    } catch (se: SecurityException) {
                        result.success(false) // Handle SecurityException during connect
                    }
                } else {
                    result.success(false)
                }
            } catch (e: SecurityException) {
                result.success(false)
            }
        } else {
            result.success(false)
        }
    }

    private fun connectToDevice(deviceAddress: String?, result: MethodChannel.Result) {
        if (deviceAddress == null) {
            result.success(false)
            return
        }

        if (!hasBluetoothPermission()) {
            result.success(false)
            return
        }

        val device: BluetoothDevice? = bluetoothAdapter?.getRemoteDevice(deviceAddress)
        if (device == null) {
            result.success(false)
            return
        }

        try {
            val uuid: UUID = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB")
            bluetoothSocket = device.createRfcommSocketToServiceRecord(uuid)

            if (bluetoothSocket != null) {
                try {
                    bluetoothSocket?.connect()
                    result.success(true)
                } catch (e: IOException) {
                    result.success(false)
                }
            } else {
                result.success(false)
            }
        } catch (e: SecurityException) {
            result.success(false)
        }
    }





    private fun closeBluetoothSocket() {
        try {
            bluetoothSocket?.close()
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }
}
