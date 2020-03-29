import 'package:flutter/material.dart';

class NotificationDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:410,
      child:Column(children:[
        Text('Notifications', style:TextStyle(fontSize: 30,color: Colors.blue), textAlign: TextAlign.left,)
      ])
      
    );
  }
}