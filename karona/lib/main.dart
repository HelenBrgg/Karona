import 'package:flutter/material.dart';
import './header.dart';
import './body.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.green,
            body: ListView(children: [
              Column(children: [Header(), SizedBox(height: 40.0), Body()])
            ])));
  }
}
