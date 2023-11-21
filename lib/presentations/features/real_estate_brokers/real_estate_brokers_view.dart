import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class REalEstateBrokersView extends StatefulWidget {
  const REalEstateBrokersView({super.key});

  @override
  State<REalEstateBrokersView> createState() => _REalEstateBrokersViewState();
}

class _REalEstateBrokersViewState extends State<REalEstateBrokersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.transparent],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
          },
          blendMode: BlendMode.dstIn,
          child: Image.asset(
            ImageAssets.appbarBg,
            // height: 400,

            fit: BoxFit.fill,
          ),
        ),

        leading: IconButton(
            onPressed: () {
              Navigator.maybePop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorManager.golden,
            )),
        // BackButton(
        //   color: ColorManager.golden,
        // ),
        title: Text(
          AppStrings().realEstateBrokers,
          style: Theme
              .of(context)
              .textTheme
              .headlineLarge,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}
