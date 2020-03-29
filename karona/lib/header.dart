import 'package:flutter/material.dart';

class Header extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(right: 100.0),
            width: double.infinity,
            child: Column(children: [
        Text('Karona',
            style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),textAlign: TextAlign.left,),
        Text('How can I assist you today?',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 15.0))
      ]),
    );
  }
}
