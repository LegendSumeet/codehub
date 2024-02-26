import 'package:codehub/controllers/GetBootcamps/Getbootcampsbyid/bloc/bootcampsbyid_bloc.dart';
import 'package:codehub/controllers/GetHackathons/GetHackathonsbyid/bloc/hackathonsbyid_bloc.dart';
import 'package:codehub/models/HackathonModel/hackathonbyid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../Contants/app_style.dart';
import '../../controllers/GetConfernces/GetConferencebyid/bloc/conferencesbyid_bloc.dart';
import '../../widgets/SizeConfig.dart';

class ConferencePage extends StatefulWidget {
  final String reqid;
  const ConferencePage({super.key, required this.reqid});

  @override
  State<ConferencePage> createState() => _ConferencePageState();
}

class _ConferencePageState extends State<ConferencePage> {
  final ConferencesByIdBloc conferencesByIdBloc = ConferencesByIdBloc();
  @override
  void initState() {
    conferencesByIdBloc.add(ConferenceInitialFetchEventById(widget.reqid));
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
                  textStyle: TextStyle(
                    fontFamily: "Mulish",
                    color: kWhiteF7,
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Register Now',
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: BlocConsumer<ConferencesByIdBloc, ConferenceState>(
          listener: (context, state) {},
          bloc: conferencesByIdBloc,
          listenWhen: (previous, current) => current is HackathonsActionState,
          buildWhen: (previous, current) => current is! HackathonsActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case ConferenceFetchingLoadingState:
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
              case ConferenceFetchingSuccessfulState:
                final successState = state as ConferenceFetchingSuccessfulState;

                DateTime startDate = successState.conference.startDate;
                DateTime endDate = successState.conference.endDate;

                String formattedStartDate =
                    "${startDate.day}-${startDate.month}-${startDate.year}";
                String formattedEndDate =
                    "${endDate.day}-${endDate.month}-${endDate.year}";

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
                            successState.conference.name,
                            style:TextStyle(
                              fontFamily: "Mulish",
                              color: kWhiteF7,
                              fontSize:
                              SizeConfig.blockSizeHorizontal! * 7.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: kPadding12,
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
                                  successState.conference.imglink,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: kPadding32,
                        ),
                        const SizedBox(
                          height: kPadding16,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kPadding28,
                              ),
                              child: Text(
                                "Speakers",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  color: kWhiteF7,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: kPadding16,
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
                                        successState.conference.speakers[index],
                                        style: TextStyle(
                                          fontFamily: "Mulish",
                                          color: kWhiteF7,
                                          fontSize:
                                          SizeConfig.blockSizeHorizontal! *
                                              3.5,
                                          fontWeight: FontWeight.bold,
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
                        const SizedBox(
                          height: kPadding16,
                        ),
                        InkWell(
                          onTap: () {
                            appinfo.openExternalApplication(
                                successState.conference.website);
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
                                "Organizer : ${successState.conference.organizer}",
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
                              const Icon(CupertinoIcons.group, color: kWhiteF7),
                              Text(
                                "Max Attendees : ${successState.conference.maxAttendees}",
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
                              Text(
                                "Price: ₹ ${successState.conference.fee}",
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
                                "Location : ${successState.conference.location}",
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
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kPadding28,
                              ),
                              child: Text(
                                "Topics",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  color: kWhiteF7,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: kPadding16,
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
                                        successState.conference.topics[index],
                                        style: TextStyle(
                                          fontFamily: "Mulish",
                                          color: kWhiteF7,
                                          fontSize:
                                          SizeConfig.blockSizeHorizontal! *
                                              3.5,
                                          fontWeight: FontWeight.bold,
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
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kPadding28,
                              ),
                              child: Text(
                                "Sponsors",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  color: kWhiteF7,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: kPadding16,
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
                                        successState.conference.sponsors[index],
                                        style: TextStyle(
                                          fontFamily: "Mulish",
                                          color: kWhiteF7,
                                          fontSize:
                                          SizeConfig.blockSizeHorizontal! *
                                              3.5,
                                          fontWeight: FontWeight.bold,
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
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kPadding28,
                              ),
                              child: Text(
                                "Timeline",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  color: kWhiteF7,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kPadding28,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                kBorderRadius16,
                              ),
                              color: kWhiteFF.withOpacity(0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kPadding28,
                              ),
                              child: Text(
                                successState.conference.schedule,
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: kPadding16,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kPadding28,
                              ),
                              child: Text(
                                "AdditionalInfo",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  color: kWhiteF7,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kPadding28,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                kBorderRadius16,
                              ),
                              color: kWhiteFF.withOpacity(0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kPadding28,
                              ),
                              child: Text(
                                successState.conference.additionalInfo,
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                                          "Start Date: ${formattedStartDate}",
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
                                          "End Date: ${formattedEndDate}",
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
                            "Description",
                            style: TextStyle(
                              fontFamily: "Mulish",
                              color: kWhiteF7,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kPadding28,
                          ),
                          child: Text(
                            successState.conference.description,
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
                                      "Contact Email : ${successState.conference.contactEmail}",
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
