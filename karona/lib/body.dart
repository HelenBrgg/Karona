import 'package:flutter/material.dart';

import './menu.dart';
import './notificationDisplay.dart';

import 'package:connectivity/connectivity.dart';
import 'persistency/challenge_classes.dart';

import './globals.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  List <Challenge> active_challenges_for_Helen = [];
  void _newStreamInput(List<Challenge> data)
  {
    setState(() {
      active_challenges_for_Helen = data;
    });
  }


  @override
  Widget build(BuildContext context) {
    chalMan.getStreamActiveChallenges().listen((data){
      _newStreamInput(data);
    });
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(background), fit: BoxFit.cover),
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(75.0)),
        ),
        child: Column(children: [NotificationDisplay(), Menu()])); //fixup
  }
}
