//
//  MyBasicChannel.swift
//  Runner
//
//  Created by 福建连 on 7/28/21.
//

import Foundation
import UIKit

public class MyBasicChannel {
    
    var channel:FlutterBasicMessageChannel
    
    init(messenger: FlutterBinaryMessenger) {
        channel = FlutterBasicMessageChannel(name: "com.flutter.test.basic_channel", binaryMessenger: messenger, codec: FlutterStringCodec.sharedInstance())
        
        // Receive messages from Dart and send replies.
        channel.setMessageHandler {
          (message: Any?, reply: FlutterReply) -> Void in
            self.channel.sendMessage("from ios")
            print(message as! String)
        }

    }
}
