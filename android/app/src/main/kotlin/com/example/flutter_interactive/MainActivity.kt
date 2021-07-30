package com.example.flutter_interactive

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MyMethodChannel(flutterEngine.dartExecutor.binaryMessenger)
        MyBasicChannel(flutterEngine.dartExecutor.binaryMessenger)
        MyEventChannel(flutterEngine.dartExecutor.binaryMessenger, this)
    }
}
