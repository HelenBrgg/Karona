import 'package:flutter/material.dart';

import './menu.dart';
import './notificationDisplay.dart';

import 'package:connectivity/connectivity.dart';
import 'persistency/challenge_classes.dart';

class Body extends StatefulWidget
{
  final Stream<List <Challenge>> streamActiveChallenges;

  Body({Key key, this.streamActiveChallenges}) : super(key:key);

  @override
  _BodyState createState() => _BodyState();
}


class _BodyState extends State<Body>
{
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(75.0)),
        ), 
        child:Column(children:[NotificationDisplay(streamActiveChallenges:widget.streamActiveChallenges),Menu()]));//fixup
  }
}
