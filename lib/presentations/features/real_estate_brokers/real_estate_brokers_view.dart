import 'package:flutter/material.dart';

import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../../widgets/selected_municipality_widget.dart';
import '../../widgets/selected_year_widget.dart';

class REalEstateBrokersView extends StatefulWidget {
  const REalEstateBrokersView({super.key});

  @override
  State<REalEstateBrokersView> createState() => _REalEstateBrokersViewState();
}

class _REalEstateBrokersViewState extends State<REalEstateBrokersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: ShaderMask(
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
            // height: 400,

            fit: BoxFit.fill,
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

        title: Text(
          AppStrings().realEstateBrokers,
          style: Theme
              .of(context)
              .textTheme
              .headlineLarge,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(children: [
            Row(
                mainAxisAlignment:
                MainAxisAlignment.end,
                children: [
                  SizedBox(width: AppSizeW.s16),
                  SelectedMunicipality(
                    value: getObjectByLookupKey([], 4),
                    list: [],
                    onChanged: (municipal) {

                    },
                  ),
                  SizedBox(width: AppSizeW.s5),
                  SelectedYearWidget(
                    value:
                    DateTime
                        .now()
                        .year,
                    onChanged: (year) {

                    },
                  ),
                  SizedBox(width: AppSizeW.s7),
                  // BlocBuilder(
                  //   bloc: context
                  //       .read<LookupBloc>(),
                  //   builder: (context,
                  //       LookupState state) {
                  //     return state.map(
                  //       loadingLookup: (value) {
                  //         return Icon(
                  //           Icons
                  //               .filter_list_sharp,
                  //           color: ColorManager
                  //               .golden,
                  //         );
                  //       },
                  //       loadedLookup: (value) {
                  //         return IconButton(
                  //             onPressed:
                  //                 () async {
                  //               var res =
                  //               await bottomSheetWidget(
                  //                 context,
                  //                 child:
                  //                 MultiBlocProvider(
                  //                   providers: [
                  //                     BlocProvider.value(
                  //                         value:
                  //                         context.read<SellBloc>()),
                  //                     BlocProvider.value(
                  //                         value:
                  //                         context.read<LookupBloc>()),
                  //                   ],
                  //                   child:
                  //                   const BottomSheetFilterSellWidget(),
                  //                 ),
                  //               );
                  //               if (res !=
                  //                   null &&
                  //                   res) {
                  //                 changeStatusCubit
                  //                     .changeStatus();
                  //                 sellGridKPIsBloc.add(
                  //                     SellGridKPIsEvent.getData(
                  //                         request: context
                  //                             .read<
                  //                             SellBloc>()
                  //                             .requestSell));
                  //                 topvaluesBloc.add(TopvaluesEvent
                  //                     .countTransictionNumberEvent(
                  //                     request: context
                  //                         .read<
                  //                         SellBloc>()
                  //                         .requestSell));
                  //                 sellTransactionBloc.add(
                  //                     SellTransactionEvent.started(
                  //                         request: context
                  //                             .read<
                  //                             SellBloc>()
                  //                             .requestSell));
                  //               }
                  //             },
                  //             icon: Icon(
                  //               size: AppSizeW
                  //                   .s32,
                  //               Icons
                  //                   .filter_list_sharp,
                  //               color:
                  //               ColorManager
                  //                   .golden,
                  //             ));
                  //       },
                  //       errorLookUp: (value) {
                  //         return const SizedBox();
                  //       },
                  //     );
                  //   },
                  // ),
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
            //                   .read<SellBloc>()
            //                   .loockUpSell
            //                   ?.periodTime
            //                   .map((e) {
            //                 return e.id != 5
            //                     ? ChosenPeriodWidget(
            //                         periodId: context
            //                             .read<
            //                                 SellBloc>()
            //                             .requestSell
            //                             .periodId,
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
          ])


        ],
      ),
    );
  }
}
