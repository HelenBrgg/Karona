import 'package:flutter/material.dart';
import './menuButtons.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var options = ['Health', 'Challenges', 'Empty'];
  selectHandler()=>print('');
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      child:
        Container(
          
          child: Row(children: [
            MenuButton(selectHandler, options[0]),
            MenuButton(selectHandler, options[1]),
            MenuButton(selectHandler, options[2]),
          ]),
        )
      
      
      ,
    );
  }
}
