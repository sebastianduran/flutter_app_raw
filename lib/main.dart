import 'package:flutter/material.dart';
import 'package:flutter_app_raw/draw.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _buttonpressed = true;

  void _handlerBottom() {
    setState(() {
      _buttonpressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _buttonpressed
            ? Center(
                child: RaisedButton(
                    onPressed: () {
                      _handlerBottom();
                    },
                    child: Text('Press to next screen')),
              )
            : DrawScreen(),
      ),
    );
  }
}
