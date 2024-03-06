import 'package:flutter/cupertino.dart';
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
  int totalpages = 0, currentpage = 1, loading = 0;

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
        title: BuildText(
            widget.title, MediaQuery.of(context).size.width, 20, Colors.white),
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

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
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
            loading == 0
                ? BuildText(
                    "Loading PDF ....",
                    MediaQuery.of(context).size.width,
                    18,
                    Colors.red) // Show this icon when loading is 0
                : BuildText("Total Pages : ${totalpages}",
                    MediaQuery.of(context).size.width, 15, Colors.black),
            IconButton(
                onPressed: () {
                  pdfControllerPinch.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.bounceInOut);
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined)),
            BuildText("Current Page : ${currentpage}",
                MediaQuery.of(context).size.width, 15, Colors.black),
            IconButton(
                onPressed: () {
                  pdfControllerPinch.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.bounceInOut);
                },
                icon: const Icon(Icons.arrow_forward_ios)),
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
          loading = 1;
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
