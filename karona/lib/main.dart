import 'package:flutter/material.dart';
//import './score.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0; //makes our widget stateful

  void chooseFunction() {
    setState(() {//rerenders the widget when the state is changed(runs build() again)
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions =['Whats your favorite color?', 'Whats your favorite animal?'];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Column(children: [
              Text('Karona'),
              Text('How can I assist you today?'),
            ])),
            body: Column(children: [Text('Score'),
            Row(children: [
              Text('Menu'),
              RaisedButton(child: Text('Health'), onPressed: chooseFunction),
              RaisedButton(
                  child: Text('Mental Health'), onPressed: chooseFunction),
              RaisedButton(
                  child: Text('Socialize'),
                  onPressed: () => print("notavailable")),
            ])])));
    //Text('How can I assist you today?')));
  }
}
