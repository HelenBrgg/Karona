import 'package:flutter/material.dart';

class  Score extends StatefulWidget {
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  var count =0;

  increase({points =1}){
    count =count+points;
  }

  decrease({points =1}){
    count=count+points;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}