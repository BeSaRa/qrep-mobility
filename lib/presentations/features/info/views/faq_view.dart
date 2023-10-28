import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../resources/resources.dart';

class FAQView extends StatefulWidget {
  const FAQView({super.key});

  @override
  State<FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        leading: BackButton(color: ColorManager.white),
        title: Text(
          'FAQ',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
        backgroundColor: ColorManager.primary,
      ),
    );
  }
}
