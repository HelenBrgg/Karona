import 'package:flutter/material.dart';
//import './score.dart';
import './menu.dart';
import './notificationDisplay.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 185.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(75.0)),
        ),
        child: Column(children:[NotificationDisplay(),Menu()]));
  }
}
