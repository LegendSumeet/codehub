import 'package:codehub/Contants/app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../widgets/SizeConfig.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ShapeBorder a =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));
    ShapeBorder b =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0));

    double t = 0.5;
    return Scaffold(
      backgroundColor: kBlack,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kPadding28,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: kPadding28,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildText("Create your Profile",
                          MediaQuery.of(context).size.width, 28, kWhiteFF),
                      BuildText(
                          "Codehub will set up your Profile using your profile name and photo",
                          MediaQuery.of(context).size.width,
                          16,
                          kWhiteFF),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        handlegooglesignin();
                      },
                      child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width *
                              0.95, // Adjust the percentage as needed
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.blue,
                            boxShadow: [
                              BoxShadow(
                                color: kBlackRich12,
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(28.0)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                CupertinoIcons.mail_solid,
                                size: 40,
                                color: kWhite,
                              ),
                              BuildText(
                                  "Continue with Google",
                                  MediaQuery.of(context).size.width,
                                  22,
                                  kWhiteFF),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handlegooglesignin() {
    try {
      GoogleAuthProvider _googleauth = GoogleAuthProvider();
      _auth.signInWithProvider(_googleauth);
    } catch (error) {
      print(error);
    }
  }
}
