import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventChannelPage extends StatefulWidget {
  @override
  _EventChannelPageState createState() => _EventChannelPageState();
}

class _EventChannelPageState extends State<EventChannelPage> {
  final channel = EventChannel('com.flutter.test.event_channel');

  StreamSubscription _streamSubscription;

  var t1 = "";
  var t2 = "";
  var t3 = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamSubscription = channel
        .receiveBroadcastStream()
        .listen(_onEventSuccess, onError: _onEventError);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("EventChannel"),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("重力传感器数值"),
              Padding(padding: EdgeInsets.only(top: 15)),
              Text(t1),
              Text(t2),
              Text(t3),
            ],
          ),
        ));
  }

  //3.成功和错误回调
  void _onEventSuccess(message) {
    this.setState(() {
      t1 = "x：" + message[0];
      t2 = "y：" + message[1];
      t3 = "z：" + message[2];
    });
  }

  void _onEventError(error) {
    print(error);
  }

  //4.注意：页面销毁时需要取消监听，防止内存泄漏
  @override
  void dispose() {
    if (_streamSubscription != null) {
      _streamSubscription.cancel();
      _streamSubscription = null;
    }
    super.dispose();
  }
}
