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
            backgroundColor:Colors.green,
            body:ListView(
                children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
            children: <Widget>[
                Container(
                      child: 
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                    )
              ],
            ),
          ),
          Header(),
          SizedBox(height: 40.0),
          Body()
          ])));

            
            
    
  }
}
