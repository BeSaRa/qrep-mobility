import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../../widgets/selected_municipality_widget.dart';

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
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            SizedBox(width: AppSizeW.s16),
            SelectedMunicipality(
              value: getObjectByLookupKey([], 4),
              list: [],
              onChanged: (municipal) {},
            ),
            SizedBox(width: AppSizeW.s10),

            // BlocBuilder(
            //   bloc: context
            //       .read<LookupBloc>(),
            //   builder: (context,
            //       LookupState state) {
            //     return state.map(
            //       loadingLookup: (value) {
            //         return
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizeH.s5),
              child: Icon(
                Icons.filter_list_sharp,
                color: ColorManager.golden,
              ),
            ),
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
          SizedBox(
            height: AppSizeH.s25,
          ),
          Padding(
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
                          Text('12',
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
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppSizeW.s20),
            padding: EdgeInsets.symmetric(
                vertical: AppSizeH.s10, horizontal: AppSizeW.s20),
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(AppSizeR.s10)),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return RealEstateCard(
                    name: 'بست باي بروبرتيز',
                    country: 'الدوحة',
                    phone: 'hgfdfghj',
                    email: 'hgfdfghj',
                    divider: index != 4,
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class RealEstateCard extends StatelessWidget {
  final String name;
  final String country;
  final String phone;
  final String email;
  final bool divider;

  const RealEstateCard({
    super.key,
    required this.name,
    required this.country,
    required this.phone,
    required this.email,
    this.divider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppSizeH.s20, vertical: AppSizeH.s5),
      decoration: BoxDecoration(color: ColorManager.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    country,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.local_phone_outlined,
                        color: ColorManager.golden,
                        size: AppSizeH.s20,
                      ),
                      SizedBox(
                        width: AppSizeW.s5,
                      ),
                      Text(
                        phone,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: AppSizeSp.s16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: ColorManager.golden,
                      ),
                      SizedBox(
                        width: AppSizeW.s5,
                      ),
                      Text(
                        email,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: AppSizeSp.s16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          if (divider)
            Padding(
              padding: EdgeInsets.only(top: AppSizeH.s10),
              child: Center(
                child: Divider(
                  color: ColorManager.lightSilver,
                  endIndent: AppSizeW.s15,
                  indent: AppSizeW.s15,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
