import 'package:flutter/material.dart';
import './menuButtons.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var options = ['Stay healthy', 'Socializing', 'Pseudo'];
  selectHandler()=>print('');
  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.bottomCenter,
      width:double.infinity,
      child:
        Container(
          
          child: Row(children: [
            MenuButton(options[0]),
            MenuButton(options[1]),
            MenuButton(options[2]),
          ]),
        )
      
      
      ,
    );
  }
}
