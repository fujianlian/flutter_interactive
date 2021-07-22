import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelPage extends StatefulWidget {
  @override
  _MethodChannelPageState createState() => _MethodChannelPageState();
}

class _MethodChannelPageState extends State<MethodChannelPage> {
  final channel = MethodChannel('com.flutter.test.channel');

  var t1 = "";
  var t2 = "";
  var result = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    channel.setMethodCallHandler((call) async {
      if (call.method == "fromNative") {
        setState(() {
          result = call.arguments;
        });
      }
    });
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
              TextField(
                decoration: new InputDecoration(
                  hintText: '请输入name',
                ),
                onChanged: (v) {
                  t1 = v;
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: '请输入age',
                  ),
                  onChanged: (v) {
                    t2 = v;
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                onPressed: _test,
                child: const Text('Flutter调用原生'),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              ElevatedButton(
                onPressed: () {
                  channel.invokeMethod('native');
                },
                child: const Text('原生调用Flutter'),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              Text(result),
            ],
          ),
        ));
  }

  _test() async {
    var map = await channel.invokeMethod(
      'TestData',
      {'name': t1, 'age':t2},
    );
    result = map["name"] + ' == ' + map['age'];
    debugPrint(result);
    this.setState(() {});
  }

}
