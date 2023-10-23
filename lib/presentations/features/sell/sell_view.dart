import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/rent_requests/request_mean_value.dart';
import 'package:ebla/domain/models/requests/sell_requests/request_sell_values.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_default/sell_default_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_grid_kpis_bloc/sell_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_transaction/sell_transaction_bloc.dart';
import 'package:ebla/presentations/features/sell/widgets/sell_grid_item_widget.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/global_functions.dart';
import '../rent/blocs/cubits/cubit/change_status_cubit.dart';
import '../rent/rent_view.dart';
import '../../widgets/selected_municipality_widget.dart';
import '../../widgets/selected_year_widget.dart';
import 'blocs/sell_bloc/sell_bloc.dart';
import 'widgets/bottom_sheet_filter_sell.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  late SellGridKPIsBloc sellGridKPIsBloc;
  late SellDefaultBloc sellDefaultBloc;
  late SellTransactionBloc sellTransactionBloc;
  late ChangeStatusCubit changeStatusCubit;

  @override
  void initState() {
    sellGridKPIsBloc = instance<SellGridKPIsBloc>();
    sellDefaultBloc = instance<SellDefaultBloc>()
      ..add(SellDefaultEvent.started(
          request: context.read<SellBloc>().requestSellDefault));
    sellTransactionBloc = instance<SellTransactionBloc>();
    changeStatusCubit = ChangeStatusCubit();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, SellState state) {
        state.mapOrNull(
          loadedSellLookup: (value) {
            sellGridKPIsBloc.add(SellGridKPIsEvent.getData(
                request: context.read<SellBloc>().requestSell));
            sellTransactionBloc.add(SellTransactionEvent.started(
                request: context.read<SellBloc>().requestSellDefault));
          },
        );
      },
      bloc: context.read<SellBloc>(),
      builder: (context, SellState state) {
        return state.map(
          loadingSellLookup: (value) {
            return const AnimatedPulesLogo();
          },
          loadedSellLookup: (value) {
            return BlocBuilder<SellDefaultBloc, SellDefaultState>(
                bloc: sellDefaultBloc,
                builder: (context, state) => state.when(
                    initial: () => const SizedBox(),
                    loading: () => const AnimatedPulesLogo(),
                    done: (done) => Column(
                          children: [
                            Container(
                              height: AppSizeH.s40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(ImageAssets.appbarBg),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: RefreshIndicator(
                                onRefresh: () {
                                  context.read<SellBloc>().add(
                                      const SellEvent.getSellLookupEvent());
                                  return Future.value();
                                },
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      BlocBuilder(
                                        bloc: changeStatusCubit,
                                        builder: (context, state) {
                                          return Column(children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(width: AppSizeW.s16),
                                                  SelectedMunicipality(
                                                    value: getObjectByLookupKey(
                                                            context
                                                                    .read<
                                                                        SellBloc>()
                                                                    .loockUpSell
                                                                    ?.municipalityList ??
                                                                [],
                                                            context
                                                                    .read<
                                                                        SellBloc>()
                                                                    .requestSell
                                                                    .municipalityId ??
                                                                4) ??
                                                        const RentLookupModel(),
                                                    list: context
                                                            .read<SellBloc>()
                                                            .loockUpSell
                                                            ?.municipalityList ??
                                                        [],
                                                    onChanged: (municipal) {
                                                      context
                                                              .read<SellBloc>()
                                                              .requestSell =
                                                          context
                                                              .read<SellBloc>()
                                                              .requestSell
                                                              .copyWith(
                                                                  municipalityId:
                                                                      municipal
                                                                          ?.lookupKey,
                                                                  areaCode: -1);
                                                      changeStatusCubit
                                                          .changeStatus();
                                                    },
                                                  ),
                                                  SizedBox(width: AppSizeW.s5),
                                                  SelectedYearWidget(
                                                    value: context
                                                            .read<SellBloc>()
                                                            .requestSell
                                                            .issueDateYear ??
                                                        DateTime.now().year,
                                                    onChanged: (year) {
                                                      context
                                                              .read<SellBloc>()
                                                              .requestSell =
                                                          context
                                                              .read<SellBloc>()
                                                              .requestSell
                                                              .copyWith(
                                                                  issueDateYear:
                                                                      year);
                                                      changeStatusCubit
                                                          .changeStatus();
                                                    },
                                                  ),
                                                  SizedBox(width: AppSizeW.s7),
                                                  BlocBuilder(
                                                    bloc: context
                                                        .read<SellBloc>(),
                                                    builder: (context,
                                                        SellState state) {
                                                      return state.map(
                                                        loadingSellLookup:
                                                            (value) {
                                                          return Icon(
                                                            Icons
                                                                .filter_list_sharp,
                                                            color: ColorManager
                                                                .golden,
                                                          );
                                                        },
                                                        loadedSellLookup:
                                                            (value) {
                                                          return IconButton(
                                                              onPressed:
                                                                  () async {
                                                                var res =
                                                                    await bottomSheetWidget(
                                                                  context,
                                                                  child:
                                                                      BlocProvider
                                                                          .value(
                                                                    value: context
                                                                        .read<
                                                                            SellBloc>(),
                                                                    child:
                                                                        const BottomSheetFilterSellWidget(),
                                                                  ),
                                                                );
                                                                if (res !=
                                                                        null &&
                                                                    res) {
                                                                  // changeStatusCubit
                                                                  //     .changeStatus();
                                                                }
                                                              },
                                                              icon: Icon(
                                                                size: AppSizeW
                                                                    .s32,
                                                                Icons
                                                                    .filter_list_sharp,
                                                                color:
                                                                    ColorManager
                                                                        .golden,
                                                              ));
                                                        },
                                                        errorSellLookUp:
                                                            (value) {
                                                          return const SizedBox();
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  SizedBox(
                                                    width: AppSizeW.s7,
                                                  ),
                                                ]),
                                            // SizedBox(height: AppSizeH.s12),
                                            // Padding(
                                            //   padding: EdgeInsets.symmetric(
                                            //     horizontal: AppSizeW.s11,
                                            //   ),
                                            //   child: SizedBox(
                                            //       height: AppSizeH.s26,
                                            //       child: Row(
                                            //           children: context
                                            //                   .read<RentBloc>()
                                            //                   .loockUpRent
                                            //                   ?.periodTime
                                            //                   .map((e) {
                                            //                 return e.id != 5
                                            //                     ? ChosenPeriodWidget(
                                            //                         id: e.id,
                                            //                         enName: e
                                            //                             .enName,
                                            //                         arName: e
                                            //                             .arName,
                                            //                       )
                                            //                     : const SizedBox();
                                            //               }).toList() ??
                                            //               [])),
                                            // ),
                                          ]);
                                        },
                                      ),
                                      SizedBox(height: AppSizeH.s22),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: AppSizeW.s31),
                                        child: StaggeredGridView(
                                          // for development only: UniqueKey forces the rebuild of the widget on hot reload
                                          key: UniqueKey(),
                                          itemsCount: 4,
                                          rightSectionTopPadding: AppSizeH.s17,
                                          mainAxisSpacing: AppSizeH.s22,
                                          crossAxisSpacing: AppSizeW.s23,
                                          gridItemChildBuilder:
                                              (context, index) {
                                            return BlocProvider.value(
                                              value: sellGridKPIsBloc,
                                              child: SellGridItemWidget(
                                                response: RentDefault(
                                                    kpi1Val: 100,
                                                    kpi4Val: 400,
                                                    kpi7Val: 700,
                                                    kpi13Val: 1300),
                                                kpi: SellGridKPIs.values[index],
                                                index: index,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppSizeH.s20,
                                      ),
                                      Center(
                                        child: Text(
                                          AppStrings().rentContractList,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ),
                                      const GreyLinerContainer(),
                                      BlocBuilder<SellTransactionBloc,
                                              SellTransactionState>(
                                          bloc: sellTransactionBloc,
                                          builder: (context, state) =>
                                              state.when(
                                                  initial: () => Container(),
                                                  loading: () => Center(
                                                        child: SizedBox(
                                                            width: AppSizeW.s50,
                                                            height:
                                                                AppSizeW.s50,
                                                            child:
                                                                const CircularProgressIndicator()),
                                                      ),
                                                  success: (success) =>
                                                      ListView.builder(
                                                          itemCount: success
                                                                      .transactionList
                                                                      .length >
                                                                  3
                                                              ? 3
                                                              : success
                                                                  .transactionList
                                                                  .length,
                                                          shrinkWrap: true,
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          itemBuilder:
                                                              (context, index) {
                                                            return MainContainerWithBloc(
                                                                price:
                                                                    "${success.transactionList[index].realEstateMT?.toStringAsFixed(3)} ${AppStrings().currency}",
                                                                area: success
                                                                        .transactionList[
                                                                            index]
                                                                        .realEstateValue
                                                                        ?.toStringAsFixed(
                                                                            0) ??
                                                                    '0',
                                                                bedCount: success
                                                                        .transactionList[
                                                                            index]
                                                                        .roi
                                                                        ?.toStringAsFixed(
                                                                            0) ??
                                                                    '0',
                                                                location: '');
                                                          }),
                                                  error: (String message) =>
                                                      SizedBox(
                                                          height: AppSizeH.s200,
                                                          width: AppSizeH.s200,
                                                          child: Column(
                                                            children: [
                                                              SizedBox(
                                                                  height:
                                                                      AppSizeH
                                                                          .s130,
                                                                  width:
                                                                      AppSizeH
                                                                          .s130,
                                                                  child: Lottie.asset(
                                                                      ImageAssets
                                                                          .animationError)),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    sellTransactionBloc.add(SellTransactionEvent.started(
                                                                        request: context
                                                                            .read<SellBloc>()
                                                                            .requestSellDefault));
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .refresh))
                                                            ],
                                                          ))))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    error: (String message) => ErrorGlobalWidget(
                          message: message,
                          onPressed: () {
                            sellDefaultBloc.add(SellDefaultEvent.started(
                                request: context
                                    .read<SellBloc>()
                                    .requestSellDefault));
                          },
                        )));
          },
          errorSellLookUp: (value) {
            return ErrorGlobalWidget(
              message: value.message,
              onPressed: () {
                context
                    .read<SellBloc>()
                    .add(const SellEvent.getSellLookupEvent());
              },
            );
          },
        );
      },
    );
  }
}
