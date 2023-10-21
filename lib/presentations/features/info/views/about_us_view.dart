import 'package:ebla/presentations/features/info/blocs/about_bloc/about_bloc.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../rent/rent_view.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: ColorManager.white),
        title: Text(
          'About Us',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
        backgroundColor: ColorManager.primary,
      ),
      body: BlocBuilder(
        bloc: context.read<AboutBloc>(),
        builder: (context, AboutState state) {
          return state.map(
            loading: (value) {
              return const AnimatedPulesLogo();
            },
            loaded: (value) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizeH.s12, vertical: AppSizeH.s6),
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(color: ColorManager.primary),
                    child: Text(
                      value.about.title,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Html(
                        data: value.about.content,
                      ),
                    ),
                  )
                ],
              );
            },
            error: (value) {
              return const Text('error');
            },
          );
        },
      ),
    );
  }
}
