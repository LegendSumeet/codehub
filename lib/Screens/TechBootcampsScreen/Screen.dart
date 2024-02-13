import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Contants/app_style.dart';
import '../../widgets/SizeConfig.dart';

class TechBootcampPage extends StatelessWidget {
  const TechBootcampPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kBlack0D,
      appBar: AppBar(
        backgroundColor: kBlack0D,
        iconTheme: const IconThemeData(color: kWhiteFF),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          debugPrint('Start Tapped');
        },
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: kPadding28,
          ),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kBorderRadius16),
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: kWhiteFF,
                  padding: const EdgeInsets.symmetric(
                    vertical: kPadding16,
                  ),
                  backgroundColor: kBlackRichLight1C,
                  textStyle: kInterBold.copyWith(
                    color: kWhiteFF,
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  )),
              onPressed: () {},
              child: const Text(
                'Register Now',
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kPadding22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Text(
                  'Smart India Hackathon',
                  style: kInterBold.copyWith(
                    color: kWhiteFF,
                    fontSize: SizeConfig.blockSizeHorizontal! * 7.5,
                  ),
                ),
              ),
              const SizedBox(
                height: kPadding12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Text(
                  'Government Sector Hackathon Level',
                  style: kInterRegular.copyWith(
                    color: kWhiteFF.withOpacity(0.7),
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  ),
                ),
              ),
              const SizedBox(
                height: kPadding24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height *
                      0.3, // 30% of screen height
                  width:
                      MediaQuery.of(context).size.width, // 70% of screen width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius24),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://static.toiimg.com/thumb/msid-103068370,width-1280,height-720,resizemode-4/103068370.jpg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: kPadding32,
              ),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kPadding8,
                  ),
                  child: ListView.builder(
                    itemCount: 2,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              kBorderRadius16,
                            ),
                            color: kWhiteFF.withOpacity(0.1),
                          ),
                          padding: const EdgeInsets.all(kPadding14),
                          child: Center(
                            child: Text(
                              'healthCare',
                              style: kInterBold.copyWith(
                                color: kWhiteFF,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: kPadding16,
              ),
              const SizedBox(
                height: kPadding16,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kPadding28,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Visit Website",
                        style: TextStyle(
                          fontFamily: "Mulish",
                          color: kBlueAzure4A,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.link_sharp, color: kBlueAzure4A),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: kPadding16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Row(
                  children: [
                    const Icon(CupertinoIcons.person_2_square_stack_fill,
                        color: kWhiteF7),
                    Text(
                      "Organizer : Coding Academy Inc. ",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        color: kWhiteF7,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: kPadding16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: kWhiteF7),
                    Text(
                      "Location : New York, NY ",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        color: kWhiteF7,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: kPadding16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Row(
                  children: [
                    const Icon(CupertinoIcons.person_3_fill, color: kWhiteF7),
                    Text(
                      "Team Size : 2 - 4 ",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        color: kWhiteF7,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
                    Container(
                      decoration: BoxDecoration(
                          color: kBlack,
                          border: Border.all(color: kWhiteF7, width: 1),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Column(
                            children: [
                              Text(
                                "Start Date: 23 jan 2024",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  color: kWhiteF7,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "End Date: 23 jan 2024",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  color: kWhiteF7,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kBlack,
                          border: Border.all(color: kWhiteF7, width: 1),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Column(
                            children: [
                              Text(
                                "Duration",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  color: kWhiteF7,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "12 weeks",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  color: kWhiteF7,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: kPadding16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Text(
                  "Meditation is a practice where an individual uses a technique – such as mindfulness, or focusing their mind on a particular object, thought or activity – to train attention ",
                  style: TextStyle(
                    fontFamily: "Mulish",
                    color: Colors.white.withOpacity(0.6),
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: kPadding16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Text(
                  "Meditation is a practice where an individual uses a technique – such as mindfulness, or focusing their mind on a particular object, thought or activity – to train attention ",
                  style: TextStyle(
                    fontFamily: "Mulish",
                    color: Colors.white.withOpacity(0.6),
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: kPadding16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Text(
                  "Meditation is a practice where an individual uses a technique – such as mindfulness, or focusing their mind on a particular object, thought or activity – to train attention ",
                  style: TextStyle(
                    fontFamily: "Mulish",
                    color: Colors.white.withOpacity(0.6),
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: kPadding16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: kWhiteF7, width: 1),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Column(
                        children: [
                          Text(
                            "Contact Email : Sumeet FDFSDSDFDF",
                            maxLines: 2,
                            style: TextStyle(
                              fontFamily: "Mulish",
                              color: kWhiteF7,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
