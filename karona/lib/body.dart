import 'package:flutter/material.dart';
import './score.dart';
import './menu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity, 
        child: Column(
          children: [Score(), Menu()]));
  }
}
