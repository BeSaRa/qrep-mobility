import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class RentView extends StatefulWidget {
  const RentView({super.key});

  @override
  State<RentView> createState() => _RentViewState();
}

class _RentViewState extends State<RentView> {
  @override
  Widget build(BuildContext context) {
    return  Placeholder(child: Text(AppStrings().rent.tr()),);
  }
}
