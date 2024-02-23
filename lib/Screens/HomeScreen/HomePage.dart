import 'dart:async';

import 'package:codehub/Screens/ListScreen/hackathon/hackathonscreenlist.dart';
import 'package:codehub/controllers/GetBootcamps/Getbootcampsbyid/bloc/bootcampsbyid_bloc.dart';
import 'package:codehub/controllers/GetBootcamps/bloc/bootcamps_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Contants/app_style.dart';
import '../../widgets/SizeConfig.dart';
import '../ListScreen/bootcamp/bootcampscreenlist.dart';
import '../TechBootcampsScreen/Screen.dart';
import '../eventdetails/eventpage.dart';

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
      backgroundColor: kBlack0D,
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
                height: kPadding16,
              ),
              const SizedBox(
                height: kPadding16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BuildText("Ongoing Events",
                        MediaQuery.of(context).size.width, 16, kWhiteFF)
                  ],
                ),
              ),
              const SizedBox(
                height: kPadding16,
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kPadding18,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const HackathonList(),
                            curve: Curves.easeInOutSine,
                            transition: Transition.rightToLeftWithFade,
                            duration: Duration(milliseconds: 500),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.81,
                          decoration: BoxDecoration(
                            border: Border.all(color: kGrey85, width: 1),
                            borderRadius:
                                BorderRadius.circular(kBorderRadius26),
                            image: const DecorationImage(
                              colorFilter: ColorFilter.srgbToLinearGamma(),
                              filterQuality: FilterQuality.high,
                              image: AssetImage("assets/images/liveh.jpg"),
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
                                style: kInterBold.copyWith(
                                  color: kWhiteFF,
                                  fontSize: SizeConfig.blockSizeHorizontal! * 5,
                                ),
                              ),
                              const BlinkingWidget(
                                children: [
                                  Text(
                                    'LIVE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          16.0), // Adjust spacing if necessary
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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
                      style: kInterBold.copyWith(
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
                        Get.to(() => const BootcampsList(),
                          curve: Curves.easeInOutSine,
                          transition: Transition.rightToLeftWithFade,
                          duration: Duration(milliseconds: 500),
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
                              style: kInterBold.copyWith(
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
                        Get.to(() => const HackathonList(),
                          curve: Curves.easeInOutSine,
                          transition: Transition.rightToLeftWithFade,
                          duration: Duration(milliseconds: 500),
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
                              style: kInterBold.copyWith(
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
                        Get.to(() => const HackathonList(),
                          curve: Curves.easeInOutSine,
                          transition: Transition.rightToLeftWithFade,
                          duration: Duration(milliseconds: 500),
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
                              style: kInterBold.copyWith(
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
                        Get.to(() => const HackathonList(),
                          curve: Curves.easeInOutSine,
                          transition: Transition.rightToLeftWithFade,
                          duration: Duration(milliseconds: 500),
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
                              style: kInterBold.copyWith(
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
                        Get.to(() => const HackathonList(),
                          curve: Curves.easeInOutSine,
                          transition: Transition.rightToLeftWithFade,
                          duration: Duration(milliseconds: 500),
                        );
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
                              style: kInterBold.copyWith(
                                color: kWhiteFF,
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
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlinkingWidget extends StatefulWidget {
  final List<Widget> children;
  final Duration interval;

  const BlinkingWidget({
    Key? key,
    required this.children,
    this.interval = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  _BlinkingWidgetState createState() => _BlinkingWidgetState();
}

class _BlinkingWidgetState extends State<BlinkingWidget> {
  bool _isVisible = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.interval, (timer) {
      setState(() {
        _isVisible = !_isVisible;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isVisible ? Row(children: widget.children) : Container();
  }
}
