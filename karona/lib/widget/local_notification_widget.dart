import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../local_notications_helper.dart';
import '../page/second_page.dart';

class LocalNotificationWidget extends StatefulWidget
{
  @override
  _LocalNotificationWidgetState createState() => _LocalNotificationWidgetState();
}


class _LocalNotificationWidgetState extends State<LocalNotificationWidget>
{
  

  final NotificationManager notManager = NotificationManager();

  @override
  void initState() {
    super.initState();
    notManager.init_notification_functionality();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            title('Immediate'),
            RaisedButton(
              child: Text('Hey (immediate notification)'),
              onPressed: () => notManager.showOngoingNotification(title: 'Hey, you :)', body: 'What\'s going on?'),
            ),
            RaisedButton(
              child: Text('Other notification'),
              onPressed: () => notManager.showOngoingNotification(title: 'OtherTitle', body: 'OtherBody', id: 20),
            ),
            const SizedBox(height: 32),
            title('Scheduled'),
            RaisedButton(
              child: Text('Scheduled notification'),
              onPressed: () => notManager.scheduleNotification(title: 'Scheduled Notification', body: 'You said to call you back in 10 seconds. Here I am :)', id: 30),
            ),
             const SizedBox(height: 32),
            title('Daily'),
            RaisedButton(
              child: Text('Daily notification'),
              onPressed: () => notManager.setupDailyNotification(title: 'Daily Notification', body: 'It\s 21:06 :)', id: 40),
            ),
            const SizedBox(height: 32),
            title('Repeated'),
            RaisedButton(
              child: Text('Repeated notification'),
              onPressed: () => notManager.setupRepeatedNotification(title: 'Repeated Notification', body: 'One minute has passed', id: 50),
            ),
            const SizedBox(height: 32),
            title('Cancel'),
            RaisedButton(
              child: Text('Cancel all notification'),
              onPressed: () =>notManager.cancelAll(),
            ),
          ],
        ),
      );

  Widget title(String text) => Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Text(
          text,
          style: Theme.of(context).textTheme.title,
          textAlign: TextAlign.center,
        ),
      );
}