package com.example.flutter_interactive

import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec
import io.flutter.plugin.common.BinaryMessenger

class MyBasicChannel(messenger: BinaryMessenger) : BasicMessageChannel.MessageHandler<String> {

    private var myChannel: BasicMessageChannel<String> =
            BasicMessageChannel(messenger, "com.flutter.test.basic_channel", StringCodec.INSTANCE)

    init {
        myChannel.setMessageHandler(this)
    }


    override fun onMessage(message: String?, reply: BasicMessageChannel.Reply<String>) {
        Log.e("android", message!!)

        myChannel.send("from android Message", reply)
    }
}

