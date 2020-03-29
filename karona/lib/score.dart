import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  var count = 0;

  void increase({points = 1}) {
    setState(() {
      //rerenders the widget when the state is changed(runs build() again)
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
      alignment: Alignment.topRight,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Text('Your Score: ',
              style: TextStyle(fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),textAlign: TextAlign.right,),
          Text(count.toString(),
              style:TextStyle(fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),textAlign: TextAlign.right,)
        ]));
  }
}
