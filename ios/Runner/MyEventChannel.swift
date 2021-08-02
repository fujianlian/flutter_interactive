//
//  MyEventChannel.swift
//  Runner
//
//  Created by 福建连 on 7/30/21.
//

import UIKit

public class MyEventChannel: NSObject, FlutterStreamHandler {

    var channel:FlutterEventChannel?
    var eventSink:FlutterEventSink?
    var count =  0
    var timer:Timer?

    public override init() {
        super.init();
    }
    
    convenience init(messenger: FlutterBinaryMessenger) {
        self.init()
        channel = FlutterEventChannel(name: "com.flutter.test.event_channel", binaryMessenger: messenger)
        channel?.setStreamHandler(self)
    }
 
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        startTimer()
        return nil
    }
    
    func startTimer() {
         timer = Timer.scheduledTimer(timeInterval:1, target: self, selector:#selector(self.tickDown),userInfo:nil, repeats: true)
    }
    
    @objc func tickDown(){
        count += 1
        let args:[String] = [String(count), String(count+1), String(count+2)]
        print(String(count))
        eventSink?(args)
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        timer?.invalidate()
        timer = nil
        count = 0
        eventSink = nil
        return nil
    }
}
