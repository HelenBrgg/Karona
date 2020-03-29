import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';

NotificationDetails get _ongoing_notdetails{
  final androidChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.Max,
    priority: Priority.High,
    ongoing: true,
    autoCancel: false,
  );
  final iOSChannelSpecifics = IOSNotificationDetails();
  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

NotificationDetails get _repeated_notdetails {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.Max,
    priority: Priority.High,
    ongoing: true,
    autoCancel: false,
  );
  final iOSChannelSpecifics = IOSNotificationDetails();
  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

NotificationDetails get _noSound_notdetails {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'silent channel id',
    'silent channel name',
    'silent channel description',
    playSound: false,
  );
  final iOSChannelSpecifics = IOSNotificationDetails(presentSound: false);

  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

NotificationDetails get _scheduled_notdetails {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'your scheduled channel id',
    'your scheduled channel name',
    'your scheduled channel description',
    importance: Importance.Max,
    priority: Priority.High,
    ongoing: true,
    autoCancel: false,
  );

  final iOSChannelSpecifics = IOSNotificationDetails();
  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}


NotificationDetails get _daily_notdetails {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'your daily channel id',
    'your daily channel name',
    'your daily channel description',
    importance: Importance.Max,
    priority: Priority.High,
    ongoing: true,
    autoCancel: false,
  );

  final iOSChannelSpecifics = IOSNotificationDetails();
  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

class NotificationManager
{

    String _toTwoDigitString(int value) {
    return value.toString().padLeft(2, '0');}
  
  // show a silent notification, immediately
Future showSilentNotification(
    FlutterLocalNotificationsPlugin notifications, {
      @required String title,
      @required String body,
      int id = 0,
    }) =>
    _showNotification(notifications,
        title: title, body: body, id: id, type: _noSound_notdetails);

  // show an ongoing notification, immediately
  Future showOngoingNotification(
    FlutterLocalNotificationsPlugin notifications, {
    @required String title,
    @required String body,
    int id = 0,
  }) =>
      _showNotification(notifications,
          title: title, body: body, id: id, type: _ongoing_notdetails);

  // schedule a notification for later displaying
  Future scheduleNotification 
  (
    FlutterLocalNotificationsPlugin notifications, {
    @required String title,
    @required String body,
    int id = 0,
  }) async
  {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 10));
    await notifications.schedule(
        id,
        title,
        body,
        scheduledNotificationDateTime,
        _scheduled_notdetails);
  }

    // schedule a notification for later displaying
  Future setupDailyNotification 
  (
    FlutterLocalNotificationsPlugin notifications, {
    @required String title,
    @required String body,
    int id = 0,
  }) async
  {
  var time = Time(23, 52, 00);
  var now = DateTime.now();
  print(now);
  print(time);
  await notifications.showDailyAtTime(
      id,
      title,
      body,
      time,
      _daily_notdetails);
  }

    // schedule a notification for later displaying
  Future setupRepeatedNotification 
  (
    FlutterLocalNotificationsPlugin notifications, {
    @required String title,
    @required String body,
    int id = 0,
  }) async
  {
  await notifications.periodicallyShow
    (id,
    title,
    body,
    RepeatInterval.EveryMinute,
    _repeated_notdetails);
  }


  // general function for displaying any type pf notification
  Future _showNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  @required NotificationDetails type,
  int id = 0,
}) =>
    notifications.show(id, title, body, type);


}












