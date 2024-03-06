import 'package:codehub/Contants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../pdfview.dart';

class GuidesScreen extends StatefulWidget {
  const GuidesScreen({super.key});

  @override
  State<GuidesScreen> createState() => _GuidesScreenState();
}

class _GuidesScreenState extends State<GuidesScreen> {
  final List<Map<String, String>> _data = [
    {
      "title": "Ultimate React Native Guide",
      "description":
          "Explore this comprehensive guide, designed to provide you with valuable insights and practical knowledge.Whether you're a beginner or an experienced developer, this resource covers key concepts, tips, and best practices to enhance your skills.Dive in now and take your expertise to the next level!",
      "link":
          "https://firebasestorage.googleapis.com/v0/b/codehub-app.appspot.com/o/React-Native-Guide.pdf?alt=media&token=814312c7-354e-4054-8908-be4bf4a5f7da"
    },
    {
      "title": "Ultimate MERN Guide",
      "description":
          "Explore this comprehensive guide, designed to provide you with valuable insights and practical knowledge.Whether you're a beginner or an experienced developer, this resource covers key concepts, tips, and best practices to enhance your skills.Dive in now and take your expertise to the next level!",
      "link":
          "https://firebasestorage.googleapis.com/v0/b/codehub-app.appspot.com/o/Mern-Guide.pdf?alt=media&token=7b9f26e6-b1a7-4169-8088-e38d0fd92862"
    },
    {
      "title": "Blockchain Developer Step by Step Roadmap Guide",
      "description":
          "Explore this comprehensive guide, designed to provide you with valuable insights and practical knowledge.Whether you're a beginner or an experienced developer, this resource covers key concepts, tips, and best practices to enhance your skills.Dive in now and take your expertise to the next level!",
      "link":
          "https://firebasestorage.googleapis.com/v0/b/codehub-app.appspot.com/o/Web3-Guide.pdf?alt=media&token=ab41e26d-0dc7-457b-baf2-5b6e69fd16a5"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Most Popular Resources",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: "Mulish",
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: kWhiteFF),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
            horizontal: kPadding18, vertical: kPadding8),
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final item = _data[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Border color
                borderRadius: BorderRadius.circular(10.0), // Border radius
              ),
              child: ListTile(
                title: Text(
                  item['title']!,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Mulish",
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: Text(
                  item['description']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Mulish",
                    color: Colors.white.withOpacity(0.6),
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Get.to(() => PdfView(
                        title: item['title']!,
                        pdflink: item['link']!,
                      ));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
