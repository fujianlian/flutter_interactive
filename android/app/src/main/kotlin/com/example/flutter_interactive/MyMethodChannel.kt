package com.example.flutter_interactive

import android.util.Log
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall


class MyMethodChannel(messenger: BinaryMessenger) : MethodChannel.MethodCallHandler {

    private var myChannel: MethodChannel = MethodChannel(messenger, "com.flutter.test.channel")

    init {
        myChannel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        Log.e("call.method ", call.method)
        if (call.method == "TestData") {
            val name = call.argument("name") as String?
            val age = call.argument("age") as String?
            var map = mapOf("name" to "hello,$name",
                    "age" to "$age"
            )
            result.success(map)
        } else if (call.method == "native") {
            val name = "原生Android " + myChannel.javaClass.name
            myChannel.invokeMethod("fromNative", name)

        }
    }
}
