import 'package:codehub/Screens/onBoardingScreen/Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Contants/app_style.dart';
import '../../widgets/SizeConfig.dart';

class PorfileScreen extends StatefulWidget {
  const PorfileScreen({super.key});

  @override
  State<PorfileScreen> createState() => _PorfileScreenState();
}

class _PorfileScreenState extends State<PorfileScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack0D,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: BuildText(
            "Profile", MediaQuery.of(context).size.width, 24, kWhiteFA),
      ),
      backgroundColor: kBlack0D,
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: _getUserInfo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Show loading indicator while fetching data
                } else {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final name = snapshot.data?['user_name'] ?? '';
                    final email = snapshot.data?['user_email'] ?? '';
                    final photoUrl = snapshot.data?['user_photo_url'] ?? '';
                    print("i am here");
                    print(
                        photoUrl); // Use obtained name, email, and photoUrl in your UI
                    return Column(
                      children: [
                        // Profile Picture with Circular Border
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kPadding28),
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: kWhiteFA,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.network(
                                photoUrl,
                                fit: BoxFit.cover,
                                height: 200,
                                width: 200,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: kPadding16),
                        const SizedBox(height: kPadding16),
                        const SizedBox(height: kPadding16),

                        // Name Section
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kPadding28),
                          child: Container(
                            width: MediaQuery.of(context)
                                .size
                                .width, // Set container width to full screen width

                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: kWhiteFA,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BuildText(
                                    "Name : ",
                                    MediaQuery.of(context).size.width,
                                    16,
                                    kBlackRich12),
                                const SizedBox(width: 8),
                                BuildText(
                                    name,
                                    MediaQuery.of(context).size.width,
                                    20,
                                    kBlack),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: kPadding16),

                        // Email Section
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kPadding28),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              color: kWhiteFA,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BuildText(
                                    "Email : ",
                                    MediaQuery.of(context).size.width,
                                    16,
                                    kBlackRich12),
                                const SizedBox(width: 8),
                                BuildText(
                                    email,
                                    MediaQuery.of(context).size.width,
                                    18,
                                    kBlack),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: kPadding16),
                        const SizedBox(height: kPadding16),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kPadding28),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 20),
                              decoration: BoxDecoration(
                                color: kWhiteFA,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: TextButton.icon(
                                onPressed: () async {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.clear();
                                  _auth.signOut();
                                  Get.to(() => const OnboardingScreen());
                                },
                                icon: const Icon(CupertinoIcons.arrow_right),
                                label: BuildText(
                                    "Logout",
                                    MediaQuery.of(context).size.width,
                                    20,
                                    kBlack),
                              )),
                        ),
                      ],
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<Map<String, String>> _getUserInfo() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final String name = preferences.getString('user_name') ?? '';
  final String email = preferences.getString('user_email') ?? '';
  final String photoUrl = preferences.getString('user_photo_url') ?? '';
  return {
    'user_name': name,
    'user_email': email,
    'user_photo_url': photoUrl,
  };
}
