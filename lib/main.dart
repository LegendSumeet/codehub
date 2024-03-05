import 'dart:convert';

import 'package:codehub/widgets/NavBar/Bottom_Nav_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/onBoardingScreen/Screen.dart';
import 'controllers/utils/notification.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Widget defaulthome = const OnboardingScreen();

Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("Some notification Received");
  }
}



void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final bool? islogged = preferences.getBool('islogged');
  if (islogged == true) {
    defaulthome = const EntryPoint();
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await PushNotifications.init();
  await PushNotifications.localNotiInit();
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String payloadData = jsonEncode(message.data);
    print("Got a message in foreground");
    if (message.notification != null) {
      PushNotifications.showSimpleNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
          payload: payloadData);
    }
  });
  final RemoteMessage? message =
      await FirebaseMessaging.instance.getInitialMessage();
  runApp(const CodeHub());
}

class CodeHub extends StatelessWidget {
  const CodeHub({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CodeHub App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: EntryPoint(),
    );
  }
}
