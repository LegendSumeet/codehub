import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Contants/app_style.dart';
import '../../widgets/SizeConfig.dart';
import '../eventdetails/eventpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [
    'Tech Bootcamp',
    'Hackathon',
    'Programs',
    'Conferences',
  ];
  final List<IconData> categoryIcons = [
    CupertinoIcons.desktopcomputer,
    CupertinoIcons.lightbulb_fill,
    CupertinoIcons.arrow_swap,
    CupertinoIcons.mic_solid,
  ];
  String _searchText = "";
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kWhiteFF,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          style: const TextStyle(
                              color:
                                  Colors.black), // Changed text color to black
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            contentPadding: const EdgeInsets.all(12),
                            prefixIcon: const Icon(Icons.search_sharp),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                            hintText: "Search Events",
                            suffixIcon: _searchText.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear),
                                    color: Colors.grey.shade500,
                                    onPressed: () =>
                                        setState(() => _searchText = ""),
                                  )
                                : null,
                          ),
                          onChanged: (text) =>
                              setState(() => _searchText = text),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: kPadding28,
                    ), // Added SizedBox to create space between the text field and the button
                    GestureDetector(
                      onTap: () {
                        // Action on settings icon tap
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          CupertinoIcons.slider_horizontal_3,
                          size: 30,
                          color: kBlack0D,
                        ),
                      ),
                    )
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
                height: 180,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 176,
                      width: 305,
                      margin: EdgeInsets.only(
                        left: index == 0 ? kPadding28 : kPadding20,
                        right: index == 1 ? kPadding28 : 0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius26),
                        image: const DecorationImage(
                          colorFilter: ColorFilter.srgbToLinearGamma(),
                          image: AssetImage(
                            'assets/images/bg-blue.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      padding: const EdgeInsets.all(kPadding24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sleep Meditation',
                                style: kInterBold.copyWith(
                                  color: kWhiteFF,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 5.5,
                                ),
                              ),
                              const SizedBox(
                                height: kPadding4,
                              ),
                              Text(
                                '7 Day Audio and Video Series',
                                style: kInterBold.copyWith(
                                  color: kWhiteFF.withOpacity(0.6),
                                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: kPadding28,
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: categories.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        margin: EdgeInsets.only(
                          left: index == 0 ? 28 : 12,
                          right: index == categories.length - 1 ? 28 : 0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: kWhiteF7,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.transparent,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                categoryIcons[
                                    index], // Use the icon corresponding to the index
                                size: 24, // Adjust icon size as needed
                              ),
                              const SizedBox(
                                  height:
                                      4), // Add spacing between icon and text
                              Text(
                                categories[index],
                                style: const TextStyle(fontSize: 16),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BuildText("Recent added Events",
                        MediaQuery.of(context).size.width, 16, kWhiteFF)
                  ],
                ),
              ),
              const SizedBox(
                height: kPadding16,
              ),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding28,
                ),
                crossAxisSpacing: 20,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Get.to(() => const EventDetailPage());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius26),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/bg-blue.jpg',
                          ),
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
                            'Sleep Meditation',
                            style: kInterBold.copyWith(
                              color: kWhiteFF,
                              fontSize: SizeConfig.blockSizeHorizontal! * 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius26),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/bg-blue.jpg',
                        ),
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
                          'Sleep Meditation',
                          style: kInterBold.copyWith(
                            color: kWhiteFF,
                            fontSize: SizeConfig.blockSizeHorizontal! * 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius26),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/bg-blue.jpg',
                        ),
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
                          'Sleep Meditation',
                          style: kInterBold.copyWith(
                            color: kWhiteFF,
                            fontSize: SizeConfig.blockSizeHorizontal! * 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius26),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/bg-blue.jpg",
                        ),
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
                          'Sleep Meditation',
                          style: kInterBold.copyWith(
                            color: kWhiteFF,
                            fontSize: SizeConfig.blockSizeHorizontal! * 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius26),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/bg-blue.jpg',
                        ),
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
                          'Sleep Meditation',
                          style: kInterBold.copyWith(
                            color: kWhiteFF,
                            fontSize: SizeConfig.blockSizeHorizontal! * 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius26),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/bg-blue.jpg',
                        ),
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
                          'Sleep Meditation',
                          style: kInterBold.copyWith(
                            color: kWhiteFF,
                            fontSize: SizeConfig.blockSizeHorizontal! * 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius26),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/bg-blue.jpg',
                        ),
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
                          'Sleep Meditation',
                          style: kInterBold.copyWith(
                            color: kWhiteFF,
                            fontSize: SizeConfig.blockSizeHorizontal! * 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
