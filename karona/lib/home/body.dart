import 'package:flutter/material.dart';
import './score.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      child: Column(children: [
      Score(),
      Row(children: [
        Text('Menu'),
        RaisedButton(child: Text('Health'), onPressed:null),
        RaisedButton(child: Text('Mental Health'), onPressed: null),
        RaisedButton(
            child: Text('Socialize'), onPressed: () => print("not available")),
      ])
    ]));
  }
}
