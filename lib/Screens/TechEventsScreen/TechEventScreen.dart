import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../Contants/app_style.dart';
import '../../controllers/GetTechEvents/GetTechEventsbyid/bloc/TechEventsbyid_bloc.dart';
import '../../widgets/SizeConfig.dart';

class EventPage extends StatefulWidget {
  final String reqid;
  const EventPage({super.key, required this.reqid});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final TechEventsByIdBloc techEventsByIdBloc = TechEventsByIdBloc();
  @override
  void initState() {
    techEventsByIdBloc.add(TechEventInitialFetchEventById(widget.reqid));
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
                    textStyle:TextStyle(
                      fontFamily: "Mulish",
                      color: kWhiteF7,
                      fontSize:
                      SizeConfig.blockSizeHorizontal! * 4,
                      fontWeight: FontWeight.bold,
                    ),),
                onPressed: () {},
                child: const Text(
                  'Register Now',
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: BlocConsumer<TechEventsByIdBloc, TechEventsState>(
          listener: (context, state) {},
          bloc: techEventsByIdBloc,
          listenWhen: (previous, current) => current is TechEventsActionState,
          buildWhen: (previous, current) => current is! TechEventsActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case TechEventsByIdFetchingLoadingState:
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
              case TechEventsByIdFetchingSuccessfulState:
                final successState =
                state as TechEventsByIdFetchingSuccessfulState;

                DateTime startDate = successState.techEvent.date;

                String formattedStartDate =
                    "${startDate.day}-${startDate.month}-${startDate.year}";
          

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
                            successState.techEvent.name,
                            style: TextStyle(
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
                                  successState.techEvent.imglink,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: kPadding32,
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
                                "Organizer : ${successState.techEvent.organizer}",
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
                                "Location : ${successState.techEvent.location}",
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
                            successState.techEvent.description,
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
