import 'package:flutter/material.dart';

class Header extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(children: [
        Text('Karona',
            style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
        Text('How can I assist you today?', style: TextStyle(fontSize: 12)),
      ]),
    );
  }
}
