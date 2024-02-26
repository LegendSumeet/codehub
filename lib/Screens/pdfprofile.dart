import 'package:codehub/Screens/pdfview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../Contants/app_style.dart';
import '../../controllers/GetTechEvents/GetTechEventsbyid/bloc/TechEventsbyid_bloc.dart';
import '../../widgets/SizeConfig.dart';

class PdfProfile extends StatelessWidget {
  final String title;
  final String linkpdf;
  final String imglink;
  final String credit;
  final String ownersite;
  final String desciptions;

  const PdfProfile({super.key, required this.title, required this.linkpdf, required this.imglink, required this.credit, required this.ownersite, required this.desciptions, });

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
                onPressed: () {
                  Get.to(()=> PdfView(title:title,pdflink: linkpdf,));
                },
                child: const Text(
                  'Open PDF',
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
                    title,
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
                          imglink,
                        ),
                        fit: BoxFit.cover,
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
                  child: Column(
                    children: [
                      Text(
                        "Owner and Create by  : ${credit}",
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
                InkWell(
                  onTap: (){
                    appinfo.openExternalApplication(ownersite);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kPadding28,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Owner Site",
                          style: TextStyle(
                            fontFamily: "Mulish",
                            color: kBlue,
                            fontSize:
                            MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                  child: Text(
                    desciptions,
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
        ),
    );
  }
}
