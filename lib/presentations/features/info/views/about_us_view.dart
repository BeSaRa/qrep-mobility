import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/features/info/blocs/about_bloc/about_bloc.dart';
import 'package:ebla/presentations/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/resources.dart';
import '../../../widgets/animated_pulse_logo.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<AboutBloc>(),
      builder: (context, AboutState state) {
        return state.map(
          loading: (value) {
            return const AnimatedPulesLogo();
          },
          loaded: (value) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                flexibleSpace: Container(
                  height: AppSizeH.s50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.appbarBg),
                      fit: BoxFit.cover,
                    ),
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
                  AppStrings().aboutUs,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                centerTitle: true,
              ),
              body: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.homeBg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizeW.s17),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: AppSizeH.s197,
                          alignment: Alignment.center,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSizeH.s27,
                                  horizontal: AppSizeW.s37),
                              decoration: BoxDecoration(
                                  color: ColorManager.white,
                                  border: Border.all(
                                      width: 1,
                                      color: ColorManager.lightSilver),
                                  borderRadius:
                                      BorderRadius.circular(AppSizeR.s15)),
                              child: SvgPicture.asset(IconAssets.aboutHome)),
                        ),
                        Html(
                          data: context.locale == ARABIC_LOCAL
                              ? value.about.translations[0].title
                              : value.about.translations[1].title,
                        ),
                        Divider(
                          color: ColorManager.grey,
                          height: AppSizeH.s1,
                        ),
                        Html(
                          data: context.locale == ARABIC_LOCAL
                              ? value.about.translations[0].content
                              : value.about.translations[1].content,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          error: (value) {
            return Scaffold(
              body: ErrorGlobalWidget(
                message: value.message,
                onPressed: () {
                  context.read<AboutBloc>().add(const AboutEvent.getAbout());
                },
              ),
            );
          },
        );
      },
    );
  }
}
