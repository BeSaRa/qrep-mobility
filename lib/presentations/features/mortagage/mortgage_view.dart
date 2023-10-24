import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../resources/assets_manager.dart';

class MortgageView extends StatefulWidget {
  const MortgageView({super.key});

  @override
  State<MortgageView> createState() => _MortagageViewState();
}

class _MortagageViewState extends State<MortgageView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height / 2,
      width: 200,
      child: Lottie.asset(
        ImageAssets.comingSoon,
        fit: BoxFit.contain,
      ),
    );
  }
}
