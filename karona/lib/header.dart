import 'package:flutter/material.dart';
import './score.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 7),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(right: 10.0),
        width: double.infinity,
        child: Row(
          children: [
            Column(children: [
              Text(
                'Karona',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0),
                textAlign: TextAlign.left,
              ),
              Text('How can I assist you today?',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 15.0)),
            ]),
            Score()
          ],
        ));
  }
}
