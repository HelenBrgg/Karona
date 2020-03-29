import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  var count = 0;

  void increase({points = 1}) {
    setState(() {//rerenders the widget when the state is changed(runs build() again)
      count = count + points;
    });
  }

  decrease({points = 1}) {
    setState(() {
      count = count - points;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(10),
      child: Column(
      children: [
        Text('YourScore:',style: TextStyle(fontSize: 30)),
        Text(count.toString(),style: TextStyle(fontSize: 40)),]));
  }
}
