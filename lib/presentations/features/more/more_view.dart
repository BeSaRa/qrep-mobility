import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
    return  Placeholder(child: Text(AppStrings().more.tr()),);
  }
}
