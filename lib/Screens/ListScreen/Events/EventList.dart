import 'package:codehub/Contants/app_style.dart';
import 'package:codehub/Screens/TechEventsScreen/TechEventScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/GetBootcamps/bloc/bootcamps_bloc.dart';
import '../../../controllers/GetTechEvents/bloc/TechEvents_bloc.dart';
import '../../../widgets/SizeConfig.dart';
import '../../TechBootcampsScreen/Screen.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final TechEventsBloc techEventsBloc = TechEventsBloc();

  @override
  void initState() {
    techEventsBloc.add(TechEventsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack0D,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tech Events",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: "Mulish",
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kBlack0D,
        iconTheme: const IconThemeData(color: kWhiteFF),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: BlocConsumer<TechEventsBloc, TechEventsState>(
        bloc: techEventsBloc,
        listenWhen: (previous, current) => current is TechEventsActionState,
        buildWhen: (previous, current) => current is! TechEventsActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case TechEventsFetchingLoadingState:
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.0,
                ),
                itemCount: 8,
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
            case TechEventsFetchingSuccessfulState:
              final successState = state as TechEventsFetchingSuccessfulState;
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: successState.techEvents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kPadding18, vertical: kPadding8),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        border: Border.all(color: kGrey8E),
                        color: kBlack,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        // Wrap Column with Row
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Image Widget
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: successState.techEvents[index].imglink !=
                                    null
                                ? Image.network(
                                    successState.techEvents[index].imglink,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  )
                                : Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                          const SizedBox(
                              width:
                                  12), // Add some spacing between image and text
                          // Column for text content
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BuildText(
                                      successState.techEvents[index].name,
                                      MediaQuery.of(context).size.width,
                                      MediaQuery.of(context).size.width * 0.05,
                                      kWhiteFF,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      successState
                                          .techEvents[index].description,
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "Mulish",
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: kPadding18),
                                const Divider(
                                  height: 1,
                                  color: kGrey8E,
                                ),
                                InkWell(
                                  hoverColor: kWhiteF7,
                                  onTap: () {
                                    Get.to(
                                      () => EventPage(
                                        reqid:
                                            successState.techEvents[index].id,
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "View More",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );

            default:
              return Container();
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}

Widget buildStatusContainer(
    {required IconData icon, required String text, required Color color}) {
  return Container(
    transform:
        Matrix4.translationValues(SizeConfig.blockSizeHorizontal! * 16, 0, 0),
    height: SizeConfig.blockSizeVertical! * 20,
    color: color,
    padding: const EdgeInsets.symmetric(
      horizontal: 6,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: SizeConfig.blockSizeHorizontal! * 3,
          color: Colors.black,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(text,
            style: const TextStyle(
              fontSize: 15,
            )),
      ],
    ),
  );
}
