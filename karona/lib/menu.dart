import 'package:flutter/material.dart';
import './menuButtons.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var options= ['Health', 'Challenges','empty'];

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(children: [
        Text('Menu'),
        Row(children: [
          MenuButton(null,options[0]),
          MenuButton(null,options[1]),
          MenuButton(null,options[2]),
        ]),
      ]),
    );
  }
}
