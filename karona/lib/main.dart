import 'package:flutter/material.dart';
import './header.dart';
import './body.dart';

import './challenge_manager.dart';
import './persistency/challenge_classes.dart';
import 'dart:async';
import './notifications/local_notications_interface.dart';
List <Challenge> active_challenges_for_Helen;

void main()
async
{
  WidgetsFlutterBinding.ensureInitialized();

  NotificationManagerInterface notificationManagerInterface = new NotificationManagerInterface();
  await notificationManagerInterface.init_notification_functionality();

  notificationManagerInterface.showOngoingNotification(title: 'trans', body: 'trans body', id: 5);

  ChallengeManager chalMan = new ChallengeManager();
  await chalMan.initChallengeManager();
  await chalMan.generatePseudoChallenges();
  await chalMan.activateRandomChallenge();
  await chalMan.activateRandomChallenge();
  await chalMan.activateRandomChallenge();
  active_challenges_for_Helen = chalMan.activeChallenges;

  print("\nAll active challenges for Helen = ");
  for(var i=0;i<active_challenges_for_Helen.length;i++){
      print(active_challenges_for_Helen[i]); 
  }

  // get 2nd challenge
  Challenge challengeToRemove = active_challenges_for_Helen[1];
  print("\nRemoving Challenge " + challengeToRemove.toString());
  chalMan.deactivateChallenge(challengeToRemove);
  
  print("\nAll active challenges for Helen (post removal) = ");
  for(var i=0;i<active_challenges_for_Helen.length;i++){
      print(active_challenges_for_Helen[i]); 
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0; //makes our widget stateful

  void chooseFunction() {
    setState(() {
      //rerenders the widget when the state is changed(runs build() again)
      questionIndex = questionIndex + 1;
    });
    print('Answer Chosen');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.green,
            body: ListView(children: [
              Column(children:
                active_challenges_for_Helen.map((element) => Card(
                child: Column(children: <Widget>[
              Image.asset('assets/food.jpg'),
              Text(element.toString())
            ],
            ),
            )).toList()
    )  
            ])));
  }
}
