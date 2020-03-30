import 'package:flutter/material.dart';
import './header.dart';
import './body.dart';
import 'wifi/wifiObserver.dart';
import 'globals.dart';

import './challenge_manager.dart';
import './persistency/challenge_classes.dart';
import './notifications/local_notications_interface.dart';
import 'dart:async';
import './notifications/local_notications_interface.dart';

import './globals.dart';


void main()
async
{
  WidgetsFlutterBinding.ensureInitialized();

  chalMan = new ChallengeManager();
  await chalMan.initChallengeManager();

  //Notifications managers
  NotificationManagerInterface notificationManagerInterface = new NotificationManagerInterface();
  await notificationManagerInterface.init_notification_functionality();

  //wifi observer and stream listener
  wifiObserver = WifiObserver();
  wifiObserver.init();
  wifiObserver.getStreamGotHome().listen((data){notificationManagerInterface.showTransientNotification(title: 'Hey, you :)', body: 'You should wash your hands', id: -1);});

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
  Widget build(BuildContext context)
  {

    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.green,
            body: ListView(children: [
              Header(), SizedBox(height: 20.0), Body()]
            )
        ));
  }
}