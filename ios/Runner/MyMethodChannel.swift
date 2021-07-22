//
//  MyMethodChannel.swift
//  Runner
//
//  Created by 福建连 on 7/22/21.
//

import Flutter
import UIKit

public class MyMethodChannel {
    
    var channel:FlutterMethodChannel
    
    init(messenger: FlutterBinaryMessenger) {
        channel = FlutterMethodChannel(name: "com.flutter.test.channel", binaryMessenger: messenger)
        channel.setMethodCallHandler { (call:FlutterMethodCall, result:@escaping FlutterResult) in
            if (call.method == "TestData") {
                if let dict = call.arguments as? Dictionary<String, Any> {
                    let name:String = dict["name"] as? String ?? ""
                    let age:String = dict["age"] as? String ?? ""
                    result(["name":"hello,\(name)","age":age])
                }
            }else if (call.method == "native") {
                let data = "原生ios " + String(cString:object_getClassName(self.channel))
                self.channel.invokeMethod("fromNative", arguments:data)
            }
        }
    }
}
