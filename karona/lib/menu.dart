import 'package:flutter/material.dart';
import './menuButtons.dart';
import 'globals.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}
class _MenuState extends State<Menu> {

  List<Function> buttonCallbacks = [];

  // dummy: no operation function
  void nop()
  {
    return;
  }
  @override
  void initState()
  {
    buttonCallbacks.add(chalMan.activateRandomChallenge);
    buttonCallbacks.add(nop);
    buttonCallbacks.add(chalMan.activateRandomChallenge);
    super.initState();
  }

  var options = [
    ['Stay healthy', Icon(
      Icons.favorite,
      color: Colors.pink, 
      size: 14.0)],
    ['Socializing',Icon(
        Icons.audiotrack,
        color: Colors.blue,
        size: 20.0,)],
    ['Pseudo',Icon(
        Icons.audiotrack,
        color: Colors.brown,
        size: 20.0,),]
  ];



  selectHandler() => print('');
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      child: Container(
        child: Row(children: [
          MenuButton(options[0][0],options[0][1], buttonCallbacks[0]),
          MenuButton(options[1][0],options[1][1], buttonCallbacks[1]),
          MenuButton(options[2][0],options[2][1], buttonCallbacks[2]),
        ]),
      ),
    );
  }
}