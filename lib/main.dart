import 'package:codehub/Screens/onBoardingScreen/Screen.dart';
import 'package:codehub/controllers/utils/notification.dart';
import 'package:codehub/widgets/NavBar/Bottom_Nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Widget defaulthome = const OnboardingScreen();

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
  await FirebaseApi().initNotification();
  await FirebaseApi().localInitNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
