import 'dart:async';
import 'dart:convert';

import 'package:codehub/Screens/ListScreen/Conferences/ConferenceList.dart';
import 'package:codehub/Screens/ListScreen/Events/EventList.dart';
import 'package:codehub/Screens/ListScreen/hackathon/hackathonscreenlist.dart';
import 'package:codehub/Screens/pdfprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Contants/app_style.dart';
import '../../widgets/SizeConfig.dart';
import '../ListScreen/bootcamp/bootcampscreenlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kPadding16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BuildText("Explore", MediaQuery.of(context).size.width, 35,
                        Colors.white),
                    GestureDetector(
                      onTap: () => debugPrint('Search Tapped!'),
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: kPadding12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Container(
                  height: 4,
                  width: SizeConfig.blockSizeHorizontal! * 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.blockSizeHorizontal! * 10,
                    ),
                    color: kBlueAzure4A,
                  ),
                ),
              ),
              const SizedBox(
                height: kPadding28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildText("Pick The Right Opportunity!",
                        MediaQuery.of(context).size.width, 16, kWhiteFF),
                    const SizedBox(
                      height: kPadding4,
                    ),
                    Text(
                      'Explore opportunities that best suits your skills and interests!',
                      style: TextStyle(
                        fontFamily: "Mulish",
                        color: kWhiteFF.withOpacity(0.6),
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: kPadding16,
              ),
              SizedBox(
                height: 250,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.symmetric(
                    horizontal: kPadding28,
                  ),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 1,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => const BootcampsList(),
                          curve: Curves.easeInOutSine,
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kGrey85, width: 1),
                          borderRadius: BorderRadius.circular(kBorderRadius26),
                          image: const DecorationImage(
                            colorFilter: ColorFilter.srgbToLinearGamma(),
                            filterQuality: FilterQuality.high,
                            image: AssetImage("assets/images/bootcamps.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: kPadding16, vertical: kPadding24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Bootcamps',
                              style: TextStyle(
                                fontFamily: "Mulish",
                                color: kWhiteFF,
                                fontSize: SizeConfig.blockSizeHorizontal! * 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => const HackathonList(),
                          curve: Curves.easeInOutSine,
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kGrey85, width: 1),
                          borderRadius: BorderRadius.circular(kBorderRadius26),
                          image: const DecorationImage(
                            colorFilter: ColorFilter.srgbToLinearGamma(),
                            filterQuality: FilterQuality.high,
                            image: AssetImage("assets/images/hacakthon.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: kPadding16, vertical: kPadding24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Hackathons',
                              style: TextStyle(
                                color: kWhiteFF,
                                fontFamily: "Mulish",
                                fontSize: SizeConfig.blockSizeHorizontal! * 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => const EventList(),
                          curve: Curves.easeInOutSine,
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kGrey85, width: 1),
                          borderRadius: BorderRadius.circular(kBorderRadius26),
                          image: const DecorationImage(
                            colorFilter: ColorFilter.srgbToLinearGamma(),
                            filterQuality: FilterQuality.high,
                            image: AssetImage("assets/images/techevents.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: kPadding16, vertical: kPadding24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tech Events',
                              style: TextStyle(
                                fontFamily: "Mulish",
                                color: kWhiteFF,
                                fontSize: SizeConfig.blockSizeHorizontal! * 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => const ConferenceList(),
                          curve: Curves.easeInOutSine,
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kGrey85, width: 1),
                          borderRadius: BorderRadius.circular(kBorderRadius26),
                          image: const DecorationImage(
                            colorFilter: ColorFilter.srgbToLinearGamma(),
                            filterQuality: FilterQuality.high,
                            image: AssetImage("assets/images/confer.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: kPadding16, vertical: kPadding24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tech Conferences',
                              maxLines: 2,
                              style: TextStyle(
                                color: kWhiteFF,
                                fontFamily: "Mulish",
                                fontSize: SizeConfig.blockSizeHorizontal! * 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kGrey85, width: 1),
                          borderRadius: BorderRadius.circular(kBorderRadius26),
                          image: const DecorationImage(
                            colorFilter: ColorFilter.srgbToLinearGamma(),
                            filterQuality: FilterQuality.high,
                            image: AssetImage("assets/images/github.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: kPadding16, vertical: kPadding24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Open Source Github Repo',
                              style: TextStyle(
                                fontFamily: "Mulish",
                                color: kWhiteFF,
                                fontSize: SizeConfig.blockSizeHorizontal! * 5,
                              ),
                            ),
                            Text(
                              'Coming Soon',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: "Mulish",
                                color: Colors.redAccent,
                                fontSize: SizeConfig.blockSizeHorizontal! * 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: kPadding28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildText("Developer Roadmaps!",
                        MediaQuery.of(context).size.width, 16, kWhiteFF),
                    const SizedBox(
                      height: kPadding4,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: kPadding16,
              ),
              SizedBox(
                height: 250,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.symmetric(horizontal: kPadding28),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 1,
                  children: generateGridItemsFromJson(jsonString),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> generateGridItemsFromJson(String jsonStr) {
  List<dynamic> data = json.decode(jsonStr);
  List<Widget> items = [];

  data.forEach((item) {
    GridItem gridItem = GridItem.fromJson(item);
    items.add(
      InkWell(
        onTap: () {
          Get.to(
            () => PdfProfile(
              title: gridItem.title,
              desciptions: gridItem.info,
              ownersite: gridItem.ownersite,
              linkpdf: gridItem.pdflink,
              imglink: gridItem.imglink,
              credit: gridItem.owner,
            ),
            curve: Curves.easeInOutSine,
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 500),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: kGrey85, width: 1),
            borderRadius: BorderRadius.circular(kBorderRadius26),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: kPadding16, vertical: kPadding24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding16,
                ),
                child: Text(
                  gridItem.title,
                  maxLines: 2,
                  semanticsLabel: gridItem.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: "Mulish",
                    color: kWhiteFF,
                    fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                  ),
                ),
              ),
              const Divider(
                color: kGreyB7,
              ),
              Image.network(
                gridItem.imagePath,
                fit: BoxFit.cover,
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  });
  return items; // Add this return statement
}

class GridItem {
  final String title;
  final String imagePath;
  final String route;
  final String owner;
  final String info;
  final String imglink;
  final String pdflink;
  final String ownersite; // New field

  GridItem({
    required this.title,
    required this.imagePath,
    required this.route,
    required this.owner,
    required this.info,
    required this.imglink,
    required this.pdflink,
    required this.ownersite, // New field
  });

  factory GridItem.fromJson(Map<String, dynamic> json) {
    return GridItem(
      title: json['title'],
      imagePath: json['imagePath'],
      route: json['route'],
      owner: json['owner'],
      info: json['info'],
      imglink: json['imglink'],
      pdflink: json['pdflink'],
      ownersite: json['ownersite'], // New field
    );
  }
}

String jsonString =
'''
[
  {
    "title": "Frontend Developer",
    "imagePath": "https://img.freepik.com/free-vector/hand-drawn-web-developers_23-2148819604.jpg",
    "owner": "roadmap.sh by kamrify",
    "info": "Step by step guide to becoming a Frontend developer in 2024",
    "imglink": "https://img.freepik.com/free-vector/hand-drawn-web-developers_23-2148819604.jpg",
    "pdflink": "https://roadmap.sh/pdfs/roadmaps/frontend.pdf",
    "ownersite": "https://roadmap.sh/",
    "route": "bootcamp_route1"
  },
  {
    "title": "Backend Developer",
    "imagePath": "https://www.simplilearn.com/ice9/free_resources_article_thumb/How_to_Become_a_Back_End_Developer.jpg",
    "owner": "roadmap.sh by kamrify",
    "info": "Step by step guide to becoming a Backend developer in 2024",
    "imglink": "https://www.simplilearn.com/ice9/free_resources_article_thumb/How_to_Become_a_Back_End_Developer.jpg",
    "pdflink": "https://roadmap.sh/pdfs/roadmaps/backend.pdf",
    "ownersite": "https://roadmap.sh/",
    "route": "bootcamp_route2"
  },
  {
    "title": "Android Developer",
    "imagePath": "https://huddle.eurostarsoftwaretesting.com/wp-content/uploads/2018/04/Java-or-Android.png",
    "owner": "roadmap.sh by kamrify",
    "info": "Step by step guide to becoming an Android developer in 2024",
    "imglink": "https://huddle.eurostarsoftwaretesting.com/wp-content/uploads/2018/04/Java-or-Android.png",
    "pdflink": "https://roadmap.sh/pdfs/roadmaps/android.pdf",
    "ownersite": "https://roadmap.sh/",
    "route": "bootcamp_route3"
  }
]
''';
