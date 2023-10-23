import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/rent_requests/request_mean_value.dart';
import 'package:ebla/presentations/features/sell/blocs/bloc/sell_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_default/sell_default_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_grid_kpis_bloc/sell_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_transaction/sell_transaction_bloc.dart';
import 'package:ebla/presentations/features/sell/widgets/sell_grid_item_widget.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../rent/rent_view.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  late SellGridKPIsBloc sellGridKPIsBloc;
  late SellDefaultBloc sellDefaultBloc;
  late SellTransactionBloc sellTransactionBloc;

  @override
  void initState() {
    sellGridKPIsBloc = instance<SellGridKPIsBloc>()
      ..add(SellGridKPIsEvent.getData(
          request: RequestMeanValue(
        municipalityId: 1,
        propertyTypeList: [-1],
        purposeList: [-1],
        issueDateQuarterList: [1, 2, 3, 4],
        furnitureStatus: -1,
        issueDateYear: 2023,
        issueDateStartMonth: 1,
        issueDateEndMonth: DateTime.now().month,
        zoneId: -1,
        limit: 5,
        periodId: 1,
        offset: 0,
      )));
    sellDefaultBloc = instance<SellDefaultBloc>()
      ..add(SellDefaultEvent.started(
          request: context.read<SellBloc>().requestSellDefault));
    sellTransactionBloc = context.read<SellTransactionBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellDefaultBloc, SellDefaultState>(
      bloc: sellDefaultBloc,
      builder: (context, state) => state.when(
        initial: () => Container(),
        loading: () => const AnimatedPulesLogo(),
        done: (success) => BlocBuilder(
          bloc: context.read<SellBloc>(),
          builder: (context, SellState state) {
            return state.map(
              loadingSellLookup: (value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              loadedSellLookup: (value) {
                return Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
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
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: AppSizeW.s31),
                          child: StaggeredGridView(
                            // for development only: UniqueKey forces the rebuild of the widget on hot reload
                            key: UniqueKey(),
                            itemsCount: 4,
                            rightSectionTopPadding: AppSizeH.s17,
                            mainAxisSpacing: AppSizeH.s22,
                            crossAxisSpacing: AppSizeW.s23,
                            gridItemChildBuilder: (context, index) {
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
                        Center(
                          child: Text(
                            AppStrings().rentContractList,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        const GreyLinerContainer(),
                        BlocBuilder<SellTransactionBloc, SellTransactionState>(
                            bloc: sellTransactionBloc,
                            builder: (context, state) => state.when(
                                initial: () => Container(),
                                loading: () => Center(
                                      child: SizedBox(
                                          width: AppSizeW.s50,
                                          height: AppSizeW.s50,
                                          child:
                                              const CircularProgressIndicator()),
                                    ),
                                success: (success) => ListView.builder(
                                    itemCount:
                                        success.transactionList.length > 3
                                            ? 3
                                            : success.transactionList.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return MainContainerWithBloc(
                                          price:
                                              "${success.transactionList[index].realEstateMT?.toStringAsFixed(3)} ${AppStrings().currency}",
                                          area: success.transactionList[index]
                                                  .realEstateValue
                                                  ?.toStringAsFixed(0) ??
                                              '0',
                                          bedCount: success
                                                  .transactionList[index].roi
                                                  ?.toStringAsFixed(0) ??
                                              '0',
                                          location: '');
                                    }),
                                error: (String message) => SizedBox(
                                    height: AppSizeH.s200,
                                    width: AppSizeH.s200,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            height: AppSizeH.s130,
                                            width: AppSizeH.s130,
                                            child: Lottie.asset(
                                                ImageAssets.animationError)),
                                        IconButton(
                                            onPressed: () {
                                              sellTransactionBloc.add(
                                                  SellTransactionEvent.started(
                                                      request: context
                                                          .read<SellBloc>()
                                                          .requestSellDefault));
                                            },
                                            icon: const Icon(Icons.refresh))
                                      ],
                                    ))))
                      ],
                    ),
                  ),
                );
              },
              errorSellLookUp: (value) {
                return Center(
                  child: Container(
                    child: const Text('Error LookUp Sell '),
                  ),
                );
              },
            );
          },
        ),
        error: (String message) => ErrorGlobalWidget(
          message: message,
          onPressed: () {
            sellDefaultBloc.add(SellDefaultEvent.started(
                request: context.read<SellBloc>().requestSellDefault));
          },
        ),
      ),
    );
  }
}
