import 'package:codehub/controllers/GetBootcamps/Getbootcampsbyid/bloc/bootcampsbyid_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../Contants/app_style.dart';
import '../../widgets/SizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';

class TechBootcampPage extends StatefulWidget {
  final String reqid;
  const TechBootcampPage({super.key, required this.reqid});

  @override
  State<TechBootcampPage> createState() => _TechBootcampPageState();
}

class _TechBootcampPageState extends State<TechBootcampPage> {
  final BootcampsbyidBloc bootcampbloc = BootcampsbyidBloc();
  @override
  void initState() {
    bootcampbloc.add(BootCampInitialFetchEventbyid(id: widget.reqid));
    super.initState();
  }

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
        body: BlocConsumer<BootcampsbyidBloc, BootCampsState>(
          listener: (context, state) {},
          bloc: bootcampbloc,
          listenWhen: (previous, current) => current is BootcampsActionState,
          buildWhen: (previous, current) => current is! BootcampsActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case BootCampsbyidFetchingLoadingState:
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  },
                );
              case BootCampsbyidFetchingSuccessfulState:
                final successState =
                    state as BootCampsbyidFetchingSuccessfulState;
                return SafeArea(
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
                            successState.bootcamps.name,
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
                            successState.bootcamps.category,
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
                            width: MediaQuery.of(context)
                                .size
                                .width, // 70% of screen width
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius24),
                              image: DecorationImage(
                                image: NetworkImage(
                                  successState.bootcamps.imageUrl,
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
                                  padding:
                                      const EdgeInsets.only(right: 8, left: 8),
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
                                        successState.bootcamps.tags[index],
                                        style: kInterBold.copyWith(
                                          color: kWhiteFF,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  3.5,
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
                          onTap: () {
                            appinfo.openExternalApplication(
                                successState.bootcamps.website);
                          },
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
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Icon(Icons.link_sharp,
                                    color: kBlueAzure4A),
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
                              const Icon(
                                  CupertinoIcons.person_2_square_stack_fill,
                                  color: kWhiteF7),
                              Text(
                                "Organizer : ${successState.bootcamps.organizer}",
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
                                "Location : ${successState.bootcamps.location}",
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
                              const Icon(CupertinoIcons.person_3_fill,
                                  color: kWhiteF7),
                              Text(
                                "Team Size : ${successState.bootcamps.teamsize} ",
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
                                    border:
                                        Border.all(color: kWhiteF7, width: 1),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Start Date: ${successState.bootcamps.startDate}",
                                          style: TextStyle(
                                            fontFamily: "Mulish",
                                            color: kWhiteF7,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "End Date: ${successState.bootcamps.endDate}",
                                          style: TextStyle(
                                            fontFamily: "Mulish",
                                            color: kWhiteF7,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
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
                                    border:
                                        Border.all(color: kWhiteF7, width: 1),
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
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          successState.bootcamps.duration,
                                          style: TextStyle(
                                            fontFamily: "Mulish",
                                            color: kWhiteF7,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
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
                            successState.bootcamps.description,
                            style: TextStyle(
                              fontFamily: "Mulish",
                              color: Colors.white.withOpacity(0.6),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
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
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
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
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
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
                                      "Contact Email : ${successState.bootcamps.contactEmail}",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontFamily: "Mulish",
                                        color: kWhiteF7,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
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
                );
              default:
                return Container();
            }
          },
        ));
  }
}
