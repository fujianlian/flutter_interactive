import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_interactive/method_channel.dart';

import 'basic_method_channel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _test(1);
              },
              child: const Text('MethodChannel交互'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: ElevatedButton(
                onPressed: () {
                  _test(2);
                },
                child: const Text('BaseChannel交互'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _test(3);
              },
              child: const Text('EventChannel交互'),
            ),
          ],
        ),
      ),
    );
  }

  _test(index) {
    if (index == 1) {
      Navigator.push(
        _context,
        new MaterialPageRoute(builder: (context) => new MethodChannelPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        _context,
        new MaterialPageRoute(builder: (context) => new BasicChannelPage()),
      );
    } else {}
  }
}
