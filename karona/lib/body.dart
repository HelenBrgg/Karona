import 'package:flutter/material.dart';
import './score.dart';
import './menu.dart';
import './notificationDisplay.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity, margin: EdgeInsets.all(10),
        child: Column(
          children: [Score(),NotificationDisplay(), Menu()]));
  }
}
