import 'package:ebla/presentations/features/info/blocs/faq/faq_bloc.dart';
import 'package:ebla/presentations/features/info/views/laws_details_view.dart';
import 'package:ebla/presentations/widgets/animated_pulse_logo.dart';
import 'package:ebla/presentations/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocBuilder<FaqBloc, FaqState>(
        bloc: context.read<FaqBloc>(),
        builder: (context, state) {
          if (state.isLoading) {
            return const AnimatedPulesLogo();
          } else if (state.hasError) {
            return Scaffold(
              appBar: AppBar(
                surfaceTintColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.appbarBg),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                leading: BackButton(
                  color: ColorManager.golden,
                ),
                title: Text(
                  AppStrings().faqs,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                centerTitle: true,
              ),
              body: ErrorGlobalWidget(
                onPressed: () {
                  context.read<FaqBloc>().add(const FaqEvent.getFaq());
                },
              ),
            );
          }
          if (state.faqResponse.data.isNotEmpty) {
            return Scaffold(
              appBar: AppBar(
                surfaceTintColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.appbarBg),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                leading: BackButton(
                  color: ColorManager.golden,
                ),
                title: Text(
                  AppStrings().faqs,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizeW.s30,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: AppSizeH.s40),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              bottom: AppSizeH
                                  .s1, // This can be the space you need between text and underline
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: ColorManager.golden,
                                  width: AppSizeSp
                                      .s2, // This would be the width of the underline
                                ),
                              ),
                            ),
                            child: Text(
                              '${AppStrings().faqs}:',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSizeH.s30),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.faqResponse.data.length,
                        itemBuilder: (context, index) {
                          return LawArticleWidget(
                            faqItemModel: state.faqResponse.data[index],
                            article: null,
                            maxExpandedHeight: AppSizeH.s250,
                          );
                        },
                      ),
                      SizedBox(height: AppSizeH.s30),
                    ],
                  ),
                ),
              ),
            );
          } else if (state.faqResponse.data.isNotEmpty) {
            return Container();
          }
          return Container();
        },
      ),
    );
  }
}
