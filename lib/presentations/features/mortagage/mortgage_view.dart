import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class MortgageView extends StatefulWidget {
  const MortgageView({super.key});

  @override
  State<MortgageView> createState() => _MortagageViewState();
}

class _MortagageViewState extends State<MortgageView> {
  @override
  Widget build(BuildContext context) {
    return  Placeholder(
      child: Text(AppStrings().mortgage.tr()),
    );
  }
}
