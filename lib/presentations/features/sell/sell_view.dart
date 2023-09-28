import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class SellView extends StatefulWidget {
  const SellView({super.key});

  @override
  State<SellView> createState() => _SellViewState();
}

class _SellViewState extends State<SellView> {
  @override
  Widget build(BuildContext context) {
    return  Placeholder(child: Text(AppStrings().sell.tr()),);
  }
}
