import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Text(AppStrings().sell.tr()),
    );
  }
}
