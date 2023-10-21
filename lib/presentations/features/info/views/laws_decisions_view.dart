import 'package:flutter/material.dart';

import '../../../resources/resources.dart';

class LawsDecisionsView extends StatefulWidget {
  const LawsDecisionsView({super.key});

  @override
  State<LawsDecisionsView> createState() => _LawsDecisionsViewState();
}

class _LawsDecisionsViewState extends State<LawsDecisionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: ColorManager.white),
        title: Text('Laws and decisions',
            style: Theme.of(context).textTheme.displayMedium),
        centerTitle: true,
        backgroundColor: ColorManager.primary,
      ),
    );
  }
}
