import 'package:codehub/Screens/onBoardingScreen/content.dart';
import 'package:codehub/widgets/NavBar/Bottom_Nav_bar.dart';
import 'package:codehub/widgets/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/authsignin.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  List colors = const [
    Color(0xffDAD3C8),
    Color(0xffFFE5DE),
    Color(0xffDCF6E6),
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding:
                        EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 5),
                    child: Column(
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: SizeConfig.blockSizeVertical! * 35,
                        ),
                        SizedBox(
                          height: (height >= 840) ? 60 : 30,
                        ),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal! * 8,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          contents[i].desc,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w300,
                            fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (int index) => _buildDots(
                        index: index,
                      ),
                    ),
                  ),
                  _currentPage + 1 == contents.length
                      ? Padding(
                          padding: EdgeInsets.all(
                              SizeConfig.blockSizeHorizontal! * 7.5),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => const AuthPage(),
                                curve: Curves.easeInOutSine,
                                transition: Transition.rightToLeftWithFade,
                                duration: Duration(milliseconds: 500),                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    SizeConfig.blockSizeHorizontal! * 12,
                                vertical: SizeConfig.blockSizeHorizontal! * 3,
                              ),
                              textStyle: TextStyle(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 5),
                            ),
                            child: const Text(
                              "START",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(
                              SizeConfig.blockSizeHorizontal! * 7.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _controller.jumpToPage(2);
                                },
                                style: TextButton.styleFrom(
                                  elevation: 0,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 5,
                                  ),
                                ),
                                child: const Text(
                                  "SKIP",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  elevation: 0,
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal! * 3,
                                    vertical:
                                        SizeConfig.blockSizeHorizontal! * 3,
                                  ),
                                  textStyle: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 5,
                                  ),
                                ),
                                child: const Text("NEXT",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
