package com.app.salesman


import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.bluetoothprint"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "sendPrintData") {
                    val data: String = call.argument<String>("data") ?: ""
                    sendPrintData(data)
                    result.success(null)
                } else {
                    result.notImplemented()
                }
            }
    }

    private fun sendPrintData(data: String) {
        val sendIntent = Intent().apply {
            action = Intent.ACTION_SEND
            `package` = "mate.bluetoothprint"
            putExtra(Intent.EXTRA_TEXT, data)
            type = "text/plain"
        }
        startActivity(sendIntent)
    }
}
