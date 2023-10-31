// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/features/mortagage/blocs/mortgage_bloc.dart';
import 'package:ebla/presentations/features/mortagage/blocs/transactions/mortgage_transactions_bloc.dart';
import 'package:ebla/presentations/features/mortagage/widgets/mortgage_grid_widget.dart';
import 'package:ebla/presentations/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../domain/models/rent_models/rent_models.dart';
import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../../widgets/pagination_widget/pagination_widget.dart';
import '../../widgets/selected_municipality_widget.dart';
import '../../widgets/selected_period_widget.dart';
import '../../widgets/selected_year_widget.dart';
import '../rent/blocs/cubits/cubit/change_status_cubit.dart';
import 'widgets/bottom_sheet_filter_mortgage.dart';

class MortgageView extends StatefulWidget {
  const MortgageView({super.key});

  @override
  State<MortgageView> createState() => _MortagageViewState();
}

class _MortagageViewState extends State<MortgageView> {
  late MortgageTransactionsBloc mortgageTransactionsBloc;
  late ChangeStatusCubit changeStatusCubit;

  @override
  void initState() {
    mortgageTransactionsBloc = instance<MortgageTransactionsBloc>();
    changeStatusCubit = ChangeStatusCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MortgageBloc, MortgageState>(
      bloc: context.read<MortgageBloc>(),
      listener: (context, state) => state.when(initial: () {
        return;
      }, loading: () {
        return;
      }, success: (success) {
        mortgageTransactionsBloc.add(MortgageTransactionsEvent.started(
            requestMortgageValues:
                context.read<MortgageBloc>().requestDefault));
        return;
      }, error: (String message) {
        context.read<MortgageBloc>().add(const MortgageEvent.started());
        return;
      }),
      child: BlocBuilder<MortgageBloc, MortgageState>(
        bloc: context.read<MortgageBloc>(),
        builder: (context, state) => state.when(
            initial: () => const SizedBox(),
            loading: () => const AnimatedPulesLogo(),
            success: (success) => Column(
                  children: [
                    Container(
                      height: AppSizeH.s50,
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
                          context
                              .read<MortgageBloc>()
                              .add(const MortgageEvent.started());
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
                                                                MortgageBloc>()
                                                            .lookUpMortgage
                                                            ?.municipalityList ??
                                                        [],
                                                    context
                                                            .read<
                                                                MortgageBloc>()
                                                            .requestMeanValue
                                                            .municipalityId ??
                                                        4) ??
                                                const RentLookupModel(),
                                            list: context
                                                    .read<MortgageBloc>()
                                                    .lookUpMortgage
                                                    ?.municipalityList ??
                                                [],
                                            onChanged: (municipal) {
                                              context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue =
                                                  context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue
                                                      .copyWith(
                                                          offset: 0,
                                                          municipalityId:
                                                              municipal
                                                                  ?.lookupKey,
                                                          areaCode: -1);
                                              changeStatusCubit.changeStatus();
                                              mortgageTransactionsBloc.add(
                                                  MortgageTransactionsEvent.started(
                                                      requestMortgageValues:
                                                          context
                                                              .read<
                                                                  MortgageBloc>()
                                                              .requestMeanValue));
                                            },
                                          ),
                                          SizedBox(width: AppSizeW.s5),
                                          SelectedYearWidget(
                                            value: context
                                                    .read<MortgageBloc>()
                                                    .requestMeanValue
                                                    .issueDateYear ??
                                                DateTime.now().year,
                                            onChanged: (year) {
                                              context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue =
                                                  context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue
                                                      .copyWith(
                                                          offset: 0,
                                                          issueDateYear: year);
                                              changeStatusCubit.changeStatus();
                                              mortgageTransactionsBloc.add(
                                                  MortgageTransactionsEvent.started(
                                                      requestMortgageValues:
                                                          context
                                                              .read<
                                                                  MortgageBloc>()
                                                              .requestMeanValue));
                                            },
                                          ),
                                          SizedBox(width: AppSizeW.s7),
                                          BlocBuilder(
                                            bloc: context.read<MortgageBloc>(),
                                            builder:
                                                (context, MortgageState state) {
                                              return state.map(
                                                loading: (value) {
                                                  return Icon(
                                                    Icons.filter_list_sharp,
                                                    color: ColorManager.golden,
                                                  );
                                                },
                                                success: (value) {
                                                  return IconButton(
                                                      onPressed: () async {
                                                        var res =
                                                            await bottomSheetWidget(
                                                          context,
                                                          child: BlocProvider
                                                              .value(
                                                            value: context.read<
                                                                MortgageBloc>(),
                                                            child:
                                                                const BottomSheetFilterMortgageWidget(),
                                                          ),
                                                        );
                                                        if (res != null &&
                                                            res) {
                                                          changeStatusCubit
                                                              .changeStatus();
                                                          mortgageTransactionsBloc.add(
                                                              MortgageTransactionsEvent.started(
                                                                  requestMortgageValues: context
                                                                      .read<
                                                                          MortgageBloc>()
                                                                      .requestMeanValue));
                                                        }
                                                      },
                                                      icon: Icon(
                                                        size: AppSizeW.s32,
                                                        Icons.filter_list_sharp,
                                                        color:
                                                            ColorManager.golden,
                                                      ));
                                                },
                                                error: (value) {
                                                  return const SizedBox();
                                                },
                                                initial: (value) {
                                                  return Icon(
                                                    Icons.filter_list_sharp,
                                                    color: ColorManager.golden,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            width: AppSizeW.s7,
                                          ),
                                        ]),
                                    SizedBox(height: AppSizeH.s12),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppSizeW.s11,
                                      ),
                                      child: SizedBox(
                                          height: AppSizeH.s26,
                                          child: Row(
                                              children: context
                                                      .read<MortgageBloc>()
                                                      .lookUpMortgage
                                                      ?.periodTime
                                                      .map((e) {
                                                    return e.id != 5
                                                        ? ChosenPeriodWidget(
                                                            periodId: context
                                                                .read<
                                                                    MortgageBloc>()
                                                                .requestMeanValue
                                                                .periodId,
                                                            id: e.id,
                                                            enName: e.enName,
                                                            arName: e.arName,
                                                          )
                                                        : const SizedBox();
                                                  }).toList() ??
                                                  [])),
                                    ),
                                  ]);
                                },
                              ),
                              SizedBox(height: AppSizeH.s22),
                              Center(
                                child: Text(
                                  AppStrings().currentPerformanceSummary,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              const GreyLinerContainer(),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppSizeW.s30),
                                  child: MortgageGrid(
                                    mainAxisSpacing: AppSizeH.s22,
                                    crossAxisSpacing: AppSizeW.s23,
                                    // response: response,
                                    // kpi: KPI.values[index],
                                    // index: index,
                                  )),
                              SizedBox(height: AppSizeH.s20),
                              Center(
                                child: Text(
                                  AppStrings().mortgageTransactionsList,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              const GreyLinerContainer(),
                              BlocBuilder<MortgageTransactionsBloc,
                                  MortgageTransactionsState>(
                                bloc: mortgageTransactionsBloc,
                                builder: (context, state) => state.when(
                                    initial: () => Container(),
                                    loading: () => ListView.builder(
                                        itemCount: 3,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return const ShimmerMainContainer();
                                        }),
                                    done: (done) => Column(
                                          children: [
                                            ListView.builder(
                                                itemCount: done.transactionList
                                                            .length >
                                                        3
                                                    ? 3
                                                    : done
                                                        .transactionList.length,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return MainDataContainer(
                                                    hasRooms: false,
                                                    title: AppStrings()
                                                        .mortgageValue,
                                                    totalPrice:
                                                        "${done.transactionList[index].realEstateValue?.toStringAsFixed(1)}${AppStrings().currency}",
                                                    value: done
                                                            .transactionList[
                                                                index]
                                                            .realEstateArea
                                                            ?.toStringAsFixed(
                                                                0) ??
                                                        '0',
                                                    valueDescription:
                                                        AppStrings().rentArea,
                                                    titleInfo: '',
                                                    valueInfo: '',
                                                    descripton: DateTime.parse(done
                                                                .transactionList[
                                                                    index]
                                                                .issueDate ??
                                                            '')
                                                        .toFormattedString(),
                                                    location: context.locale ==
                                                            ARABIC_LOCAL
                                                        ? getObjectByLookupKey(
                                                                    context
                                                                            .read<
                                                                                MortgageBloc>()
                                                                            .lookUpMortgage
                                                                            ?.municipalityList ??
                                                                        [],
                                                                    done.transactionList[index].municipalityId ??
                                                                        0)
                                                                ?.arName ??
                                                            ''
                                                        : getObjectByLookupKey(
                                                                    context
                                                                            .read<
                                                                                MortgageBloc>()
                                                                            .lookUpMortgage
                                                                            ?.municipalityList ??
                                                                        [],
                                                                    done.transactionList[index]
                                                                            .municipalityId ??
                                                                        0)
                                                                ?.enName ??
                                                            '',
                                                  );
                                                }),
                                            SizedBox(height: AppSizeH.s6),
                                          ],
                                        ),
                                    error: (error) => SizedBox(
                                        height: AppSizeH.s200,
                                        width: AppSizeH.s200,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                height: AppSizeH.s130,
                                                width: AppSizeH.s130,
                                                child: Lottie.asset(ImageAssets
                                                    .animationError)),
                                            IconButton(
                                                onPressed: () {
                                                  mortgageTransactionsBloc.add(
                                                      MortgageTransactionsEvent.started(
                                                          requestMortgageValues: context
                                                              .read<
                                                                  MortgageBloc>()
                                                              .requestMeanValue));
                                                },
                                                icon: const Icon(Icons.refresh))
                                          ],
                                        ))),
                              ),
                              BlocBuilder<MortgageTransactionsBloc,
                                  MortgageTransactionsState>(
                                bloc: mortgageTransactionsBloc,
                                builder: (context, state) => state.when(
                                  initial: () => Container(),
                                  loading: () => FlutterCustomPagination(
                                    currentPage: context
                                            .read<MortgageBloc>()
                                            .requestMeanValue
                                            .offset ??
                                        0,
                                    limitPerPage: 3,
                                    totalDataCount:
                                        mortgageTransactionsBloc.response.count,
                                    onPreviousPage: (previousPage) {},
                                    onBackToFirstPage: (firstPage) {},
                                    onNextPage: (nextPage) {},
                                    onGoToLastPage: (lastPage) {},
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    // textStyle: Theme.of(context)
                                    //     .textTheme
                                    //     .labelSmall,
                                    previousPageIcon:
                                        context.locale == ARABIC_LOCAL
                                            ? Icons.keyboard_arrow_right_sharp
                                            : Icons.keyboard_arrow_left_sharp,
                                    backToFirstPageIcon: Icons.first_page,
                                    nextPageIcon: context.locale == ARABIC_LOCAL
                                        ? Icons.keyboard_arrow_left_sharp
                                        : Icons.keyboard_arrow_right_sharp,
                                    goToLastPageIcon: Icons.last_page,
                                  ),
                                  done: (done) {
                                    if (done.transactionList.isEmpty) {
                                      return Text(
                                        AppStrings().noRentContracts,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      );
                                    } else {
                                      return FlutterCustomPagination(
                                        currentPage: context
                                                .read<MortgageBloc>()
                                                .requestMeanValue
                                                .offset ??
                                            0,
                                        limitPerPage: 3,
                                        totalDataCount: mortgageTransactionsBloc
                                            .response.count,
                                        onPreviousPage: (previousPage) {
                                          context
                                                  .read<MortgageBloc>()
                                                  .requestMeanValue =
                                              context
                                                  .read<MortgageBloc>()
                                                  .requestMeanValue
                                                  .copyWith(
                                                      offset: previousPage);
                                          mortgageTransactionsBloc.add(
                                              MortgageTransactionsEvent.started(
                                                  requestMortgageValues: context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue));
                                        },
                                        onBackToFirstPage: (firstPage) {
                                          context
                                                  .read<MortgageBloc>()
                                                  .requestMeanValue =
                                              context
                                                  .read<MortgageBloc>()
                                                  .requestMeanValue
                                                  .copyWith(offset: firstPage);
                                          mortgageTransactionsBloc.add(
                                              MortgageTransactionsEvent.started(
                                                  requestMortgageValues: context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue));
                                        },
                                        onNextPage: (nextPage) {
                                          context
                                                  .read<MortgageBloc>()
                                                  .requestMeanValue =
                                              context
                                                  .read<MortgageBloc>()
                                                  .requestMeanValue
                                                  .copyWith(offset: nextPage);
                                          mortgageTransactionsBloc.add(
                                              MortgageTransactionsEvent.started(
                                                  requestMortgageValues: context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue));
                                        },
                                        onGoToLastPage: (lastPage) {
                                          context
                                                  .read<MortgageBloc>()
                                                  .requestMeanValue =
                                              context
                                                  .read<MortgageBloc>()
                                                  .requestMeanValue
                                                  .copyWith(offset: lastPage);
                                          mortgageTransactionsBloc.add(
                                              MortgageTransactionsEvent.started(
                                                  requestMortgageValues: context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue));
                                        },
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        // textStyle: Theme.of(context)
                                        //     .textTheme
                                        //     .labelSmall,
                                        previousPageIcon: context.locale ==
                                                ARABIC_LOCAL
                                            ? Icons.keyboard_arrow_right_sharp
                                            : Icons.keyboard_arrow_left_sharp,
                                        backToFirstPageIcon: Icons.first_page,
                                        nextPageIcon: context.locale ==
                                                ARABIC_LOCAL
                                            ? Icons.keyboard_arrow_left_sharp
                                            : Icons.keyboard_arrow_right_sharp,
                                        goToLastPageIcon: Icons.last_page,
                                      );
                                    }
                                  },
                                  error: (error) => const SizedBox(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            error: (message) => ErrorGlobalWidget(
                  message: message,
                  onPressed: () {},
                )),
      ),
    );
  }
}
