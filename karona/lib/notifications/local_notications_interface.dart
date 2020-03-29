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

NotificationDetails get _transient_notdetails{
  final androidChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.Max,
    priority: Priority.High,
    ongoing: false,
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

class NotificationManagerInterface
{

    String _toTwoDigitString(int value) {
    return value.toString().padLeft(2, '0');}
    final notifications = FlutterLocalNotificationsPlugin();

  void init_notification_functionality()
  {
    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }

   Future onSelectNotification(String payload) async => print("Selected notification " + payload);

  // show a silent notification, immediately
Future showSilentNotification({
      @required String title,
      @required String body,
      int id = 0,
    }) =>
    _showNotification(title: title, body: body, id: id, type: _noSound_notdetails);

  // show an ongoing notification, immediately
  Future showOngoingNotification( {
    @required String title,
    @required String body,
    int id = 0,
  }) =>
      _showNotification(title: title, body: body, id: id, type: _ongoing_notdetails);

  // show an ongoing notification, immediately
  Future showTransientNotification( {
    @required String title,
    @required String body,
    int id = 0,
  }) =>
      _showNotification(title: title, body: body, id: id, type: _transient_notdetails);

  // schedule a notification for later displaying
  Future scheduleNotification 
  ({
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
  ({
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
  ({
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
  Future _showNotification({
  @required String title,
  @required String body,
  @required NotificationDetails type,
  int id = 0,
}) =>
    notifications.show(id, title, body, type);

  void cancelAll()
  {
    notifications.cancelAll();
  }
}












