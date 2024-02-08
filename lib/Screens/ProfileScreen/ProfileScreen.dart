import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Contants/app_style.dart';
import '../../widgets/SizeConfig.dart';

class PorfileScreen extends StatefulWidget {
  const PorfileScreen({super.key});

  @override
  State<PorfileScreen> createState() => _PorfileScreenState();
}

class _PorfileScreenState extends State<PorfileScreen> {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kBlack0D,
    );
  }
}
