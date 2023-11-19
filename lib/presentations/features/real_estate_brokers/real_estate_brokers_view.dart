import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class REalEstateBrokersView extends StatefulWidget {
  const REalEstateBrokersView({super.key});

  @override
  State<REalEstateBrokersView> createState() => _REalEstateBrokersViewState();
}

class _REalEstateBrokersViewState extends State<REalEstateBrokersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              ImageAssets.appbarBg,
              height: AppSizeH.s50,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                return Future.value();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(children: [
                      // Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      //   SizedBox(width: AppSizeW.s16),
                      //   SelectedMunicipality(
                      //     value: '',
                      //     list: [],
                      //     onChanged: (municipal) {},
                      //   ),
                      //   SizedBox(width: AppSizeW.s5),
                      //   SelectedYearWidget(
                      //     value: context
                      //             .read<MortgageBloc>()
                      //             .requestMeanValue
                      //             .issueDateYear ??
                      //         DateTime.now().year,
                      //     onChanged: (year) {
                      //       context.read<MortgageBloc>().requestMeanValue =
                      //           context
                      //               .read<MortgageBloc>()
                      //               .requestMeanValue
                      //               .copyWith(
                      //                   offset: 0,
                      //                   issueDateEndMonth:
                      //                       year == DateTime.now().year
                      //                           ? DateTime.now().month
                      //                           : 12,
                      //                   issueDateYear: year);
                      //       changeStatusCubit.changeStatus();
                      //       mortgageGridKPIsBloc.add(
                      //           MortgageGridKPIsEvent.getData(
                      //               request: context
                      //                   .read<MortgageBloc>()
                      //                   .requestMeanValue));
                      //       mortgageTransactionsBloc.add(
                      //           MortgageTransactionsEvent.started(
                      //               requestMortgageValues: context
                      //                   .read<MortgageBloc>()
                      //                   .requestMeanValue));
                      //     },
                      //   ),
                      //   SizedBox(width: AppSizeW.s7),
                      //   BlocBuilder(
                      //     bloc: context.read<LookupBloc>(),
                      //     builder: (context, LookupState state) {
                      //       return state.map(
                      //         loadingLookup: (value) {
                      //           return Icon(
                      //             Icons.filter_list_sharp,
                      //             color: ColorManager.golden,
                      //           );
                      //         },
                      //         loadedLookup: (value) {
                      //           return IconButton(
                      //               onPressed: () async {
                      //                 var res = await bottomSheetWidget(
                      //                   context,
                      //                   child: MultiBlocProvider(
                      //                     providers: [
                      //                       BlocProvider.value(
                      //                           value: context
                      //                               .read<MortgageBloc>()),
                      //                       BlocProvider.value(
                      //                           value:
                      //                               context.read<LookupBloc>())
                      //                     ],
                      //                     child:
                      //                         const BottomSheetFilterMortgageWidget(),
                      //                   ),
                      //                 );
                      //                 if (res != null && res) {
                      //                   changeStatusCubit.changeStatus();
                      //                   mortgageTransactionsBloc.add(
                      //                       MortgageTransactionsEvent.started(
                      //                           requestMortgageValues: context
                      //                               .read<MortgageBloc>()
                      //                               .requestMeanValue));
                      //                   mortgageGridKPIsBloc.add(
                      //                       MortgageGridKPIsEvent.getData(
                      //                           request: context
                      //                               .read<MortgageBloc>()
                      //                               .requestMeanValue));
                      //                 }
                      //               },
                      //               icon: Icon(
                      //                 size: AppSizeW.s32,
                      //                 Icons.filter_list_sharp,
                      //                 color: ColorManager.golden,
                      //               ));
                      //         },
                      //         errorLookUp: (value) {
                      //           return const SizedBox();
                      //         },
                      //       );
                      //     },
                      //   ),
                      //   SizedBox(
                      //     width: AppSizeW.s7,
                      //   ),
                      // ]),

                    ]),
                    SizedBox(height: AppSizeH.s22),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
