import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../app/depndency_injection.dart';
import '../../../domain/models/rent_models/rent_models.dart';
import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../../widgets/widgets.dart';
import '../more/more_view.dart';
import '../rent/blocs/certificate_contract_bloc/certificate_contract_bloc.dart';
import '../rent/blocs/mean_value_bloc/mean_value_bloc.dart';
import '../rent/blocs/rent_bloc/rent_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.title = 'press'});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // late RentBloc rentBloc;
  late MeanValueBloc meanValueBloc;

  final _textController = TextEditingController();

  final PageController _pageController = PageController();
  int _indexCubit = 0;

  @override
  void initState() {
    // rentBloc = instance<RentBloc>()..add(const RentEvent.getRentLookupEvent());
    meanValueBloc = instance<MeanValueBloc>();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.homeBg), fit: BoxFit.fill)),
      child: Scaffold(
        appBar: const TitleAppBar(),
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizeH.s20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            _HomeContainer(
                              isBig: true,
                              title: AppStrings().sellIndicators,
                              color: ColorManager.white,
                              image: IconAssets.sellHome,
                              isShadow: true,
                            ),
                            _HomeContainer(
                              isBig: false,
                              title: AppStrings().mortgageIndicators,
                              color: ColorManager.silver,
                              image: IconAssets.mortagageHome,
                              iconColor: ColorManager.white,
                              isShadow: true,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            _HomeContainer(
                              isBig: false,
                              title: AppStrings().rentIndicators,
                              color: ColorManager.cloudyGrey,
                              image: IconAssets.rentHome,
                              imageColor: ColorManager.white,
                              textColor: ColorManager.white,
                              iconColor: ColorManager.silver,
                              isShadow: true,
                            ),
                            _HomeContainer(
                              isBig: true,
                              title: AppStrings().realEstateBrokers,
                              color: Colors.white.withOpacity(0.8),
                              image: IconAssets.inMiddleHome,
                              isShadow: true,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: AppSizeH.s10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizeW.s20, vertical: AppSizeH.s14),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        AppStrings().news,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: AppSizeW.s10),
                        height: AppSizeH.s5,
                        width: AppSizeW.s40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSizeR.s5),
                            color: ColorManager.lightSilver),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizeW.s14, vertical: AppSizeH.s2),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorManager.golden),
                        borderRadius: BorderRadius.circular(AppSizeR.s20)),
                    child: Row(
                      children: [
                        Text(
                          AppStrings().more,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: ColorManager.golden,
                          size: AppSizeH.s14,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: AppSizeH.s100,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: 3,
                  onPageChanged: (index) {
                    setState(() {
                      _indexCubit = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizeW.s20, vertical: AppSizeH.s4),
                      child: const NewsItemWidget(
                          date: '15 مارس 2023',
                          label: 'وزارة البلدية تطلق المرحلة الأولى '
                              'من مشروع المنصة العقارية لدولة قطر'),
                    );
                  }),
            ),
            SizedBox(
              height: AppSizeH.s10,
            ),
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: _indexCubit,
                count: 3,
                textDirection: TextDirection.rtl,
                effect: ExpandingDotsEffect(
                    dotColor: ColorManager.silver,
                    activeDotColor: Theme.of(context).primaryColor,
                    dotHeight: AppSizeH.s6,
                    dotWidth: AppSizeW.s6),
              ),
            ),
            SizedBox(
              height: AppSizeH.s20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizeH.s20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StaticPagesContainer(
                    icon: IconAssets.aboutHome,
                    title: AppStrings().aboutUs,
                  ),
                  StaticPagesContainer(
                    icon: IconAssets.lawsHome,
                    title: AppStrings().lawsAndDecisions,
                  ),
                  StaticPagesContainer(
                    icon: IconAssets.faqHome,
                    title: AppStrings().faqs,
                  ),
                ],
              ),
            )
          ],
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: AppSizeW.s15),
        //   child: Column(
        //     children: [
        //       ElevatedButton(
        //           onPressed: () {
        //             // print(getAllMonthsInYear());
        //             bottomSheetWidget(
        //               context,
        //               child: BlocProvider.value(
        //                 value: context.read<RentBloc>(),
        //                 child: const BottomSheetFilterWidget(),
        //               ),
        //             );
        //           },
        //           child: const Text('data')),
        //       IconButton(
        //           onPressed: () {
        //             showDatePickerPopup(context);
        //           },
        //           icon: const Icon(Icons.calendar_month)),
        //       BlocBuilder(
        //         bloc: context.read<RentBloc>(),
        //         builder: (context, RentState state) {
        //           if (state.isLoadingRentLookup) {
        //             return const LinearProgressIndicator();
        //           }
        //           if (state.rentLookup != const RentLookupResponse()) {
        //             return SingleDropDownValue(
        //                 list: state.rentLookup.municipalityList);
        //           }
        //           return const Text('Error');
        //         },
        //       ),
        //       Row(
        //         children: [
        //           Expanded(
        //               child: SearchTextFieldWidget(controller: _textController)),
        //           const Expanded(flex: 2, child: SizedBox())
        //         ],
        //       ),
        //       Expanded(
        //         child: ListView(
        //           children: [
        //             const StatisTicsWidget(),
        //             SizedBox(height: AppSizeH.s20),
        //             Row(
        //               children: [
        //                 const Expanded(child: GrowthRateWidget(index: 0)),
        //                 SizedBox(
        //                   width: AppSizeW.s20,
        //                 ),
        //                 const Expanded(child: GrowthRateWidget(index: 1)),
        //               ],
        //             ),
        //             const NewsItemWidget(
        //                 date: '15 مارس 2023',
        //                 label:
        //                     'وزارة البلدية تطلق المرحلة الأولى من مشروع المنصة العقارية لدولة قطر'),
        //             SizedBox(height: AppSizeH.s60),
        //             Row(
        //               children: [
        //                 Expanded(
        //                   child: CustomElevatedButton(
        //                     isPrimary: true,
        //                     title: 'بحث',
        //                     onPress: () {
        //                       bottomSheetWidget(
        //                         context,
        //                         child: const BottomSheetFilterWidget(),
        //                       );
        //                     },
        //                   ),
        //                 ),
        //                 SizedBox(width: AppSizeW.s8),
        //                 Expanded(
        //                   child: CustomElevatedButton(
        //                     isPrimary: false,
        //                     title: 'إلغاء',
        //                     onPress: () {},
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

class StaticPagesContainer extends StatelessWidget {
  final String icon;
  final String title;

  const StaticPagesContainer({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizeH.s125,
      width: AppSizeW.s100,
      padding: EdgeInsets.symmetric(
          horizontal: AppSizeH.s15, vertical: AppSizeH.s10),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSizeW.s14),
          border: Border.all(color: ColorManager.golden, width: AppSizeH.s1)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: AppSizeH.s60,
              width: AppSizeW.s60,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeContainer extends StatelessWidget {
  final bool isBig;
  final String title;
  final Color color;
  final String image;
  final Color? imageColor;
  final Color? iconColor;
  final Color? textColor;
  final bool isShadow;

  const _HomeContainer({
    super.key,
    required this.isBig,
    required this.title,
    required this.color,
    required this.image,
    this.imageColor,
    this.iconColor,
    this.textColor,
    required this.isShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppSizeW.s10, vertical: AppSizeH.s10),
      height:
          (MediaQuery.of(context).size.height / 2.5) * (isBig ? 0.50 : 0.36),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppSizeR.s20),
          border: isShadow ? null : Border.all(color: ColorManager.grey),
          boxShadow: [
            BoxShadow(
                color: ColorManager.grey,
                offset: const Offset(1, 1),
                blurRadius: AppSizeW.s2,
                spreadRadius: AppSizeW.s1),
            BoxShadow(
                color: ColorManager.grey,
                offset: const Offset(-1, -1),
                blurRadius: AppSizeW.s2,
                spreadRadius: AppSizeW.s1),
          ]),
      child: Row(
        children: [
          if (!isBig)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                  softWrap: true,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: textColor, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          if (!isBig)
            SizedBox(
              width: AppSizeH.s4,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isBig ? CrossAxisAlignment.center : CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: context.locale == ARABIC_LOCAL
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Transform.rotate(
                        angle: context.locale == ARABIC_LOCAL
                            ? -45
                            : 45 * math.pi / 180,
                        child: Icon(
                          Icons.arrow_upward_rounded,
                          color: isBig ? ColorManager.greyCloud : iconColor,
                        )),
                  ),
                ),
                if (!isBig)
                  SizedBox(
                    height: AppSizeH.s10,
                  ),
                Align(
                  alignment: isBig ? Alignment.center : Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    image,
                    height: AppSizeH.s70,
                    width: AppSizeW.s70,
                    color: imageColor ?? Theme.of(context).primaryColor,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                if (isBig)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatisTicsWidget extends StatefulWidget {
  const StatisTicsWidget({super.key});

  @override
  State<StatisTicsWidget> createState() => _StatisTicsWidgetState();
}

class _StatisTicsWidgetState extends State<StatisTicsWidget> {
  int indexx = 0;
  late CertificateContractBloc certificateContractBloc;

  @override
  void initState() {
    certificateContractBloc = instance<CertificateContractBloc>();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: context.read<RentBloc>(),
      listener: (context, RentState state) {
        if (state.rentLookup != const RentLookupResponse()) {
          certificateContractBloc.add(
              CertificateContractEvent.certificateCountEvent(
                  request: context.read<RentBloc>().requestMeanValue));
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizeW.s50),
                  child: EblaTabBarWidget(
                    initialIndex: indexx,
                    firstTab: 'عدد عقود الإيجار',
                    secondTab: 'عدد الوحدات',
                    onPressed: (index) {
                      indexx == index
                          ? null
                          : index == 0
                              ? certificateContractBloc.add(
                                  CertificateContractEvent
                                      .certificateCountEvent(
                                          request: context
                                              .read<RentBloc>()
                                              .requestMeanValue))
                              : certificateContractBloc.add(
                                  CertificateContractEvent.contractCountEvent(
                                      request: context
                                          .read<RentBloc>()
                                          .requestMeanValue),
                                );
                      setState(() {
                        indexx = index;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppSizeH.s30,
          ),
          BlocBuilder(
            bloc: certificateContractBloc,
            builder: (context, CertificateContractState state) {
              if (state.isLoadingCertificate || state.isLoadingContract) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.isHasErrorCertificate || state.isHasErrorContract) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(state.errorMessageCertificate),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.refresh_outlined))
                  ],
                );
              }
              if (state.certificateCountResponse.isNotEmpty && indexx == 0) {
                return StatisticsRentWidget(
                    statistics: state.certificateCountResponse.map((e) {
                  return StatisticsModel(
                      title: getObjectByLookupKey(
                                  context
                                      .read<RentBloc>()
                                      .loockUpRent!
                                      .zoneList,
                                  e.zoneId.toInt())
                              ?.arName ??
                          '',
                      number: e.kpiVal.toString());
                }).toList());
              }
              if (state.contractCountResponse.isNotEmpty && indexx == 1) {
                return StatisticsRentWidget(
                    statistics: state.certificateCountResponse.map((e) {
                  return StatisticsModel(
                      title: getObjectByLookupKey(
                                  context
                                      .read<RentBloc>()
                                      .loockUpRent!
                                      .zoneList,
                                  e.zoneId.toInt())
                              ?.arName ??
                          '',
                      number: e.kpiVal.toString());
                }).toList());
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
