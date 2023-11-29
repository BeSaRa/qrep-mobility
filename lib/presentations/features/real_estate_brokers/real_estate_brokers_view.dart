import 'package:ebla/presentations/features/real_estate_brokers/blocs/lookup_bloc/look_up_broker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/global_functions.dart';
import '../../resources/resources.dart';
import '../../widgets/widgets.dart';
import '../rent/blocs/cubits/cubit/change_status_cubit.dart';
import 'widgets/bottom_sheet_filter_broker_widget.dart';

class RealEstateBrokersView extends StatefulWidget {
  const RealEstateBrokersView({super.key});

  @override
  State<RealEstateBrokersView> createState() => _RealEstateBrokersViewState();
}

class _RealEstateBrokersViewState extends State<RealEstateBrokersView> {
  late ChangeStatusCubit changeStatusCubit;

  @override
  void initState() {
    super.initState();
    changeStatusCubit = ChangeStatusCubit();
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
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                flexibleSpace: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
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
                              SelectedMunicipality(
                                value: getObjectByLookupKey(
                                    context
                                            .read<LookUpBrokerBloc>()
                                            .lookupBroker
                                            ?.municipalityList ??
                                        [],
                                    context
                                            .read<LookUpBrokerBloc>()
                                            .requestBroker
                                            .municipalityId ??
                                        4),
                                list: context
                                        .read<LookUpBrokerBloc>()
                                        .lookupBroker
                                        ?.municipalityList ??
                                    [],
                                onChanged: (municipal) {},
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
                    Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizeW.s47,
                        ),
                        child: Container(
                          height: AppSizeH.s120,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(AppSizeR.s20)),
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
                                            ?.copyWith(
                                                fontSize: AppSizeSp.s16)),
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
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return RealEstateCard(
                              name: 'بست باي بروبرتيز',
                              country: 'الدوحة',
                              phone: '0994368478',
                              email: 'fatina.haidar@nasca-sy.com',
                              divider: index != 4,
                            );
                          }),
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

  _callNumber(String num) async {
    //set the number here
    // bool? res = await FlutterPhoneDirectCaller.callNumber(num);
  }

  // _sendEmail() async {
  //   final Email email = Email(
  //     body: 'Email body',
  //     subject: 'Email subject',
  //     recipients: ['example@example.com'],
  //     cc: ['cc@example.com'],
  //     bcc: ['bcc@example.com'],
  //     attachmentPaths: ['/path/to/attachment.zip'],
  //     isHTML: false,
  //   );
  //
  //   await FlutterEmailSender.send(email);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppSizeH.s10, vertical: AppSizeH.s5),
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
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: AppSizeSp.s12),
                  ),
                  Text(
                    country,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: AppSizeSp.s12),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      _callNumber(phone);
                    },
                    child: Row(
                      children: [
                        Text(
                          phone,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: AppSizeSp.s14),
                        ),
                        SizedBox(
                          width: AppSizeW.s5,
                        ),
                        Icon(
                          Icons.local_phone_outlined,
                          color: ColorManager.golden,
                          size: AppSizeH.s15,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        email,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: AppSizeSp.s14),
                      ),
                      SizedBox(
                        width: AppSizeW.s5,
                      ),
                      Icon(
                        Icons.email_outlined,
                        color: ColorManager.golden,
                        size: AppSizeH.s15,
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
