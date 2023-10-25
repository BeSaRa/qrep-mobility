import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/presentations/features/mortagage/blocs/mortgage_bloc.dart';
import 'package:ebla/presentations/features/mortagage/blocs/transactions/mortgage_transactions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../../widgets/animated_pulse_logo.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/main_data_container.dart';
import '../../widgets/pagination_widget/pagination_widget.dart';

class MortgageView extends StatefulWidget {
  const MortgageView({super.key});

  @override
  State<MortgageView> createState() => _MortagageViewState();
}

class _MortagageViewState extends State<MortgageView> {
  late MortgageTransactionsBloc mortgageTransactionsBloc;

  @override
  void initState() {
    mortgageTransactionsBloc = instance<MortgageTransactionsBloc>();
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
            initial: () => Container(),
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
                              SizedBox(height: AppSizeH.s22),
                              Center(
                                child: Text(
                                  AppStrings().currentPerformanceSummary,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              const GreyLinerContainer(),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(
                              //       horizontal: AppSizeW.s20),
                              //   child: StaggeredGridView(
                              //     // for development only: UniqueKey forces the rebuild of the widget on hot reload
                              //     key: UniqueKey(),
                              //     itemsCount: 4,
                              //     rightSectionTopPadding: AppSizeH.s17,
                              //     mainAxisSpacing: AppSizeH.s22,
                              //     crossAxisSpacing: AppSizeW.s23,
                              //     gridItemChildBuilder: (context, index) {
                              //       return BlocProvider.value(
                              //         value: rentGridKPIsBloc,
                              //         child: RentGridItemWidget(
                              //           response: response,
                              //           kpi: KPI.values[index],
                              //           index: index,
                              //         ),
                              //       );
                              //     },
                              //   ),
                              // ),

                              SizedBox(height: AppSizeH.s20),
                              Center(
                                child: Text(
                                  AppStrings().rentContractList,
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
                                                    title:
                                                        AppStrings().rentValue,
                                                    totalPrice:
                                                        "${done.transactionList[index].realEstateValue?.toStringAsFixed(3)}${AppStrings().currency}",
                                                    value: done
                                                            .transactionList[
                                                                index]
                                                            .areaCode
                                                            ?.toStringAsFixed(
                                                                0) ??
                                                        '0',
                                                    valueDescription:
                                                        AppStrings().rentArea,
                                                    titleInfo:
                                                        "${AppStrings().roomsCount}:",
                                                    valueInfo: done
                                                            .transactionList[
                                                                index]
                                                            .buyer ??
                                                        '',
                                                    location: context.locale ==
                                                            ARABIC_LOCAL
                                                        ? getObjectById(
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
                                                        : getObjectById(
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
                                                        .offset ==
                                                    0
                                                ? 1
                                                : context
                                                        .read<MortgageBloc>()
                                                        .requestMeanValue
                                                        .offset ??
                                                    0 + 1,
                                            limitPerPage: 3,
                                            totalDataCount:
                                                mortgageTransactionsBloc
                                                        .response?.count ??
                                                    0,
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
                                            previousPageIcon: context.locale ==
                                                    ARABIC_LOCAL
                                                ? Icons
                                                    .keyboard_arrow_right_sharp
                                                : Icons
                                                    .keyboard_arrow_left_sharp,
                                            backToFirstPageIcon:
                                                Icons.first_page,
                                            nextPageIcon: context.locale ==
                                                    ARABIC_LOCAL
                                                ? Icons
                                                    .keyboard_arrow_left_sharp
                                                : Icons
                                                    .keyboard_arrow_right_sharp,
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
                                                        .offset ==
                                                    0
                                                ? 1
                                                : context
                                                        .read<MortgageBloc>()
                                                        .requestMeanValue
                                                        .offset ??
                                                    0 + 1,
                                            limitPerPage: 3,
                                            totalDataCount:
                                                mortgageTransactionsBloc
                                                        .response?.count ??
                                                    0,
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
                                                      requestMortgageValues:
                                                          context
                                                              .read<
                                                                  MortgageBloc>()
                                                              .requestMeanValue));
                                            },
                                            onBackToFirstPage: (firstPage) {
                                              context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue =
                                                  context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue
                                                      .copyWith(
                                                          offset: firstPage);
                                              mortgageTransactionsBloc.add(
                                                  MortgageTransactionsEvent.started(
                                                      requestMortgageValues:
                                                          context
                                                              .read<
                                                                  MortgageBloc>()
                                                              .requestMeanValue));
                                            },
                                            onNextPage: (nextPage) {
                                              context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue =
                                                  context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue
                                                      .copyWith(
                                                          offset: nextPage);
                                              mortgageTransactionsBloc.add(
                                                  MortgageTransactionsEvent.started(
                                                      requestMortgageValues:
                                                          context
                                                              .read<
                                                                  MortgageBloc>()
                                                              .requestMeanValue));
                                            },
                                            onGoToLastPage: (lastPage) {
                                              context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue =
                                                  context
                                                      .read<MortgageBloc>()
                                                      .requestMeanValue
                                                      .copyWith(
                                                          offset: lastPage);
                                              mortgageTransactionsBloc.add(
                                                  MortgageTransactionsEvent.started(
                                                      requestMortgageValues:
                                                          context
                                                              .read<
                                                                  MortgageBloc>()
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
                                                ? Icons
                                                    .keyboard_arrow_right_sharp
                                                : Icons
                                                    .keyboard_arrow_left_sharp,
                                            backToFirstPageIcon:
                                                Icons.first_page,
                                            nextPageIcon: context.locale ==
                                                    ARABIC_LOCAL
                                                ? Icons
                                                    .keyboard_arrow_left_sharp
                                                : Icons
                                                    .keyboard_arrow_right_sharp,
                                            goToLastPageIcon: Icons.last_page,
                                          );
                                        }
                                      },
                                      error: (error) => SizedBox())),
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
