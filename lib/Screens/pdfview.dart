import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

import '../Contants/app_style.dart';

class PdfView extends StatefulWidget {

  final String title;
  final String pdflink;
  const PdfView({super.key, required this.title, required this.pdflink});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  late PdfControllerPinch pdfControllerPinch;
  int totalpages = 0, currentpage = 1;

  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openData(InternetFile.get(widget.pdflink)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BuildText("Frontend Roadmap", MediaQuery.of(context).size.width,
            20, Colors.white),
        backgroundColor: kBlack0D,
        iconTheme: const IconThemeData(color: kWhiteFF),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: BodyUI(),
    );
  }

  Widget BodyUI() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BuildText("Total Pages : ${totalpages}",
                MediaQuery.of(context).size.width, 15, Colors.black),
            IconButton(
                onPressed: () {
                  pdfControllerPinch.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.bounceInOut);
                },
                icon: Icon(Icons.arrow_back_ios_new_outlined)),
            BuildText("Current Page : ${currentpage}",
                MediaQuery.of(context).size.width, 15, Colors.black),
            IconButton(
                onPressed: () {
                  pdfControllerPinch.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.bounceInOut);
                },
                icon: Icon(Icons.arrow_forward_ios)),
          ],
        ),
        _pdfview()
      ],
    );
  }

  Widget _pdfview() {
    return Expanded(
        child: PdfViewPinch(
      scrollDirection: Axis.vertical,
      controller: pdfControllerPinch,
      onDocumentLoaded: (doc) {
        setState(() {
          totalpages = doc.pagesCount;
        });
      },
      onPageChanged: (page) {
        setState(() {
          currentpage = page;
        });
      },
    ));
  }
}
