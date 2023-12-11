import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/features/real_estate_brokers/blocs/kpi1_bloc/brokers_count_bloc.dart';
import 'package:ebla/presentations/features/real_estate_brokers/blocs/lookup_bloc/look_up_broker_bloc.dart';
import 'package:ebla/presentations/features/real_estate_brokers/widgets/broker_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/depndency_injection.dart';
import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../../widgets/shimmer_placeholder.dart';
import '../../widgets/widgets.dart';
import '../rent/blocs/cubits/cubit/change_status_cubit.dart';
import 'blocs/transaction_bloc/broker_transaction_bloc.dart';
import 'widgets/bottom_sheet_filter_broker_widget.dart';

class RealEstateBrokersView extends StatefulWidget {
  const RealEstateBrokersView({super.key});

  @override
  State<RealEstateBrokersView> createState() => _RealEstateBrokersViewState();
}

class _RealEstateBrokersViewState extends State<RealEstateBrokersView> {
  late ChangeStatusCubit changeStatusCubit;
  late BrokersCountBloc brokersCountBloc;
  late BrokerTransactionBloc brokerTransactionBloc;
  TextEditingController searchcontrolller = TextEditingController();

  @override
  void initState() {
    super.initState();
    changeStatusCubit = ChangeStatusCubit();
    brokersCountBloc = instance<BrokersCountBloc>()
      ..add(BrokersCountEvent.started(
          request: context.read<LookUpBrokerBloc>().requestBroker));
    brokerTransactionBloc = instance<BrokerTransactionBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<LookUpBrokerBloc>(),
      builder: (context, LookUpBrokerState state) {
        return state.map(
          loading: (value) {
            return const AnimatedPulesLogo();
          },
          done: (value) {
            return Scaffold(
              appBar: EblaAppBar(
                title: AppStrings().realEstateBrokers,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder(
                      bloc: changeStatusCubit,
                      builder: (context, state) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(width: AppSizeW.s16),
                              Flexible(
                                child: SearchTextFieldWidget(
                                  controller: searchcontrolller,
                                  hint: AppStrings().brokerCompanyName,
                                  onChange: (val) {
                                    brokerTransactionBloc.add(
                                        BrokerTransactionEvent.search(
                                            name: val));
                                  },
                                ),
                              ),
                              SizedBox(width: AppSizeW.s10),
                              BlocBuilder(
                                bloc: context.read<LookUpBrokerBloc>(),
                                builder: (context, LookUpBrokerState state) {
                                  return state.map(
                                    loading: (value) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: AppSizeH.s5),
                                        child: Icon(
                                          Icons.filter_list_sharp,
                                          color: ColorManager.golden,
                                        ),
                                      );
                                    },
                                    done: (value) {
                                      return IconButton(
                                          onPressed: () async {
                                            var res = await bottomSheetWidget(
                                              context,
                                              child: MultiBlocProvider(
                                                providers: [
                                                  BlocProvider.value(
                                                      value: context.read<
                                                          LookUpBrokerBloc>()),
                                                ],
                                                child:
                                                    const BottomSheetFilterBrokerWidget(),
                                              ),
                                            );
                                            if (res != null && res) {
                                              changeStatusCubit.changeStatus();
                                            }
                                          },
                                          icon: Icon(
                                            size: AppSizeW.s32,
                                            Icons.filter_list_sharp,
                                            color: ColorManager.golden,
                                          ));
                                    },
                                    error: (value) {
                                      return const SizedBox();
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                width: AppSizeW.s7,
                              ),
                            ]);
                      },
                    ),
                    SizedBox(
                      height: AppSizeH.s25,
                    ),
                    BlocBuilder<BrokersCountBloc, BrokersCountState>(
                      bloc: brokersCountBloc,
                      builder: (context, state) {
                        return state.map(
                            initial: (value) => const BrokerCountContainer(
                                  count: '106',
                                ),
                            loading: (value) =>
                                const BrokerCountContainerShimmer(),
                            loaded: (value) {
                              brokerTransactionBloc.add(
                                  BrokerTransactionEvent.started(
                                      request: context
                                          .read<LookUpBrokerBloc>()
                                          .requestBroker
                                          .copyWith(limit: value.val.ceil())));

                              return BrokerCountContainer(
                                count: value.val.toStringAsFixed(0),
                              );
                            },
                            error: (value) => ErrorGlobalWidget(
                                  small: true,
                                  onPressed: () {},
                                  message: value.message,
                                ));
                      },
                    ),
                    SizedBox(
                      height: AppSizeH.s40,
                    ),
                    Center(
                      child: Text(
                        AppStrings().realEstateBrokersDashboard,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: AppSizeW.s150, vertical: AppSizeH.s20),
                      height: AppSizeH.s5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizeR.s5),
                          color: ColorManager.lightSilver),
                    ),
                    BlocBuilder<BrokerTransactionBloc, BrokerTransactionState>(
                      bloc: brokerTransactionBloc,
                      builder: (context, state) {
                        return state.map(initial: (initial) {
                          return Container();
                        }, loading: (val) {
                          return Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: AppSizeW.s20),
                            padding: EdgeInsets.symmetric(
                                vertical: AppSizeH.s10,
                                horizontal: AppSizeW.s20),
                            decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius:
                                    BorderRadius.circular(AppSizeR.s10)),
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return const RealEstateCardShimmer();
                                }),
                          );
                        }, loaded: (loaded) {
                          if (loaded.response.isEmpty) {
                            return Text(AppStrings().noDataFound);
                          } else {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: AppSizeW.s20),
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSizeH.s10,
                                  horizontal: AppSizeW.s20),
                              decoration: BoxDecoration(
                                  color: ColorManager.white,
                                  borderRadius:
                                      BorderRadius.circular(AppSizeR.s10)),
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: loaded.response.length,
                                  itemBuilder: (context, index) {
                                    return RealEstateCard(
                                      name: context.locale == ARABIC_LOCAL
                                          ? loaded.response[index].brokerArName
                                          : loaded.response[index].brokerEnName,
                                      country: context.locale == ARABIC_LOCAL
                                          ? getObjectByLookupKey(
                                                      context
                                                              .read<
                                                                  LookUpBrokerBloc>()
                                                              .lookupBroker
                                                              ?.municipalityList ??
                                                          [],
                                                      loaded.response[index]
                                                          .municipalityId)
                                                  ?.arName ??
                                              ''
                                          : getObjectByLookupKey(
                                                      context
                                                              .read<
                                                                  LookUpBrokerBloc>()
                                                              .lookupBroker
                                                              ?.municipalityList ??
                                                          [],
                                                      loaded.response[index]
                                                          .municipalityId)
                                                  ?.enName ??
                                              '',
                                      phone:
                                          loaded.response[index].brokerPhone1,
                                      email: loaded.response[index].brokerEmail,
                                      divider:
                                          index != loaded.response.length - 1,
                                    );
                                  }),
                            );
                          }
                        }, error: (error) {
                          return const ErrorGlobalWidget();
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
          error: (value) {
            return const SizedBox();
          },
        );
      },
    );
  }
}

class BrokerCountContainer extends StatelessWidget {
  final String count;

  const BrokerCountContainer({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizeW.s47,
        ),
        child: Container(
          height: AppSizeH.s120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppSizeR.s20)),
            boxShadow: [
              BoxShadow(
                  spreadRadius: AppSizeR.s2,
                  blurRadius: AppSizeR.s11,
                  color: ColorManager.black.withAlpha(30)),
            ],
            gradient: LinearGradient(
              colors: [
                ColorManager.platinum,
                ColorManager.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.2, 1.0],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings().totalCertifiedRealEstate,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: AppSizeSp.s16),
                    ),
                    SizedBox(
                      height: AppSizeH.s10,
                    ),
                    Text(count,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: AppSizeSp.s16)),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: AppSizeH.s20,
                  ),
                  SvgPicture.asset(
                    IconAssets.sellHome,
                    // color:
                    //     Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class BrokerCountContainerShimmer extends StatelessWidget {
  const BrokerCountContainerShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizeW.s47,
        ),
        child: Container(
          height: AppSizeH.s120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppSizeR.s20)),
            boxShadow: [
              BoxShadow(
                  spreadRadius: AppSizeR.s2,
                  blurRadius: AppSizeR.s11,
                  color: ColorManager.black.withAlpha(30)),
            ],
            gradient: LinearGradient(
              colors: [
                ColorManager.platinum,
                ColorManager.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.2, 1.0],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings().totalCertifiedRealEstate,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: AppSizeSp.s16),
                    ),
                    SizedBox(
                      height: AppSizeH.s10,
                    ),
                    ShimmerPlaceholder(
                      child: Container(
                        width: AppSizeW.s50,
                        height: AppSizeH.s12,
                        decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(AppSizeR.s12)),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: AppSizeH.s20,
                  ),
                  SvgPicture.asset(
                    IconAssets.sellHome,
                    // color:
                    //     Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
