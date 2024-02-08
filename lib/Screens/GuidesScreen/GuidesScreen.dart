import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Contants/app_style.dart';
import '../../widgets/SizeConfig.dart';

class GuidesScreen extends StatefulWidget {
  const GuidesScreen({super.key});

  @override
  State<GuidesScreen> createState() => _GuidesScreenState();
}

class _GuidesScreenState extends State<GuidesScreen> {
 

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kBlack0D,
      body: SafeArea(child: Column(children: [
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
                  SvgPicture.asset('assets/headphone-icon.svg'),
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
      ],),),
    );
  }
}
