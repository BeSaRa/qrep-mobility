
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/strings_manager.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: AppBar(
      toolbarHeight: 100, // Set this height
      flexibleSpace: SvgPicture.asset(
          ImageAssets.appbarBg,
           fit: BoxFit.cover,
         ),
      backgroundColor: Colors.transparent,
      title:Text(AppStrings().moreTitle.tr(),style: Theme.of(context).textTheme.titleLarge,),
    ));
  }
}
