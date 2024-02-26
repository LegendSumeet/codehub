import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print(message.notification?.title);
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'high_importance_notification',
      description: "this channel is used for important notification",
      importance: Importance.high);

  final _localNoti = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    print(token);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final noti = message.notification;
      if (noti == null) return;
      _localNoti.show(
        noti.hashCode,
        noti.title,
        noti.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@mipmap/codehublogo',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }
  Future<void> localInitNotification() async {
    const android = AndroidInitializationSettings('@mipmap/codehublogo');
    const settings = InitializationSettings(android: android);

    await _localNoti.initialize(
      settings,
      onDidReceiveNotificationResponse: (payload) async {
        if (payload != null) {
          final message = RemoteMessage.fromMap(jsonDecode(payload as String));
          handleBackgroundMessage(message);
        }
      },
    );
    final platform = _localNoti.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
  }
}
