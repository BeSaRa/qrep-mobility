import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../app/depndency_injection.dart';
import '../../../domain/models/rent_models/rent_models.dart';
import '../../../utils/global_functions.dart';
import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';
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

  // bool showInkWell = false;

  @override
  void initState() {
    // rentBloc = instance<RentBloc>()..add(const RentEvent.getRentLookupEvent());
    meanValueBloc = instance<MeanValueBloc>();

    super.initState();
  }

  // bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TitleAppBar(),
        body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Lottie.asset(
              ImageAssets.comingSoon,
              fit: BoxFit.contain,
            ),
          ),
        )
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
