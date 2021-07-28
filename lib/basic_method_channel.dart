import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicChannelPage extends StatefulWidget {
  @override
  _BasicChannelPageState createState() => _BasicChannelPageState();
}

class _BasicChannelPageState extends State<BasicChannelPage> {
  final channel =
      BasicMessageChannel('com.flutter.test.basic_channel', StringCodec());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    channel.setMessageHandler(
      (message) => Future<String>(
        () {
          print(message);
          return message;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MethodChannel"),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  channel.send("from Flutter");
                },
                child: const Text('方法调用'),
              ),
            ],
          ),
        ));
  }
}
