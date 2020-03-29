import 'package:flutter/material.dart';
import './header.dart';
import './body.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0; //makes our widget stateful

  void chooseFunction() {
    setState(() {
      //rerenders the widget when the state is changed(runs build() again)
      questionIndex = questionIndex + 1;
    });
    print('Answer Chosen');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
        home: Scaffold(
            appBar: AppBar(
              title: Header(),
            ),
            body: Body()));
    //Text('How can I assist you today?')));
  }
}
