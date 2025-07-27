import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import '../features/main/cubit/bottom_nav_cubit.dart';
import '../resources/resources.dart';

class AqaratNavigationBar extends StatefulWidget {
  const AqaratNavigationBar({
    super.key,
    required TabController controller,
    required this.body,
    required this.onTap,
  }) : _controller = controller;

  final Function(int index) onTap;
  final Widget body;
  final TabController _controller;

  @override
  State<AqaratNavigationBar> createState() => _AqaratNavigationBarState();
}

class _AqaratNavigationBarState extends State<AqaratNavigationBar> {
  @override
  void initState() {
    chatHistoryCubit = ChatHistoryCubit();
    super.initState();
  }

  late ChatHistoryCubit chatHistoryCubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          // width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: ColorManager.textBlack.withAlpha(8),
                  offset: const Offset(0, 0),
                  spreadRadius: AppSizeR.s8,
                  blurRadius: AppSizeR.s18,
                ),
              ]),
          child: BlocBuilder(
            bloc: context.read<BottomNavCubit>(),
            builder: (context, state) {
              return Material(
                type: MaterialType.transparency,
                child: TabBar(
                  onTap: widget.onTap,
                  padding: EdgeInsets.symmetric(horizontal: AppSizeW.s12),
                  splashBorderRadius: BorderRadius.circular(AppSizeR.s50),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.all(AppSizeW.s5),
                  controller: widget._controller,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: Theme.of(context)
                          .bottomNavigationBarTheme
                          .backgroundColor!,
                      width: AppSizeW.s6,
                    ),
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSizeR.s2)),
                    insets: EdgeInsets.fromLTRB(
                        AppSizeH.s28, 0.0, AppSizeH.s28, AppSizeH.s65),
                  ),
                  tabs: [
                    SizedBox(
                      height: AppSizeH.s75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: state == 0
                                    ? Theme.of(context).primaryColor
                                    : null),
                            padding: EdgeInsets.all(AppSizeR.s5),
                            child: SvgPicture.asset(IconAssets.homeIcon,
                                // ignore: deprecated_member_use
                                color: Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedIconTheme!
                                    .color),
                          ),
                          FittedBox(
                            child: Text(AppStrings().main,
                                style: Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedLabelStyle),
                          ),
                          // const Spacer()
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSizeH.s75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: state == 1
                                    ? Theme.of(context).primaryColor
                                    : null),
                            padding: EdgeInsets.all(AppSizeR.s5),
                            child: ImageIcon(
                              const AssetImage(IconAssets.services),
                              // ignore: deprecated_member_use
                              color: Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .unselectedIconTheme!
                                  .color,
                            ),
                          ),
                          FittedBox(
                            child: Text(AppStrings().services,
                                style: Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedLabelStyle),
                          ),
                          // const Spacer()
                        ],
                      ),
                    ),
                    BlocProvider<ChatHistoryCubit>.value(
                      value: chatHistoryCubit,
                      child: Container(
                        height: AppSizeH.s20,
                        width: AppSizeH.s20,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                        padding: EdgeInsets.all(AppSizeR.s6),
                      ),
                    ),
                    // SizedBox(
                    //   height: AppSizeH.s75,
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       // const Spacer(),
                    //       SizedBox(
                    //         // height: AppSizeH.s36,
                    //         child: SvgPicture.asset(
                    //           state == 2
                    //               ? IconAssets.sellIconFill
                    //               : IconAssets.sellIcon,
                    //           // ignore: deprecated_member_use
                    //           color: state == 2
                    //               ? Theme.of(context)
                    //                   .bottomNavigationBarTheme
                    //                   .selectedIconTheme!
                    //                   .color
                    //               : Theme.of(context)
                    //                   .bottomNavigationBarTheme
                    //                   .unselectedIconTheme!
                    //                   .color,
                    //         ),
                    //       ),
                    //       FittedBox(
                    //         child: Text(
                    //           AppStrings().sell,
                    //           style: state == 2
                    //               ? Theme.of(context)
                    //                   .bottomNavigationBarTheme
                    //                   .selectedLabelStyle
                    //               : Theme.of(context)
                    //                   .bottomNavigationBarTheme
                    //                   .unselectedLabelStyle,
                    //         ),
                    //       ),
                    //       // const Spacer()
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: AppSizeH.s75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: state == 3
                                    ? Theme.of(context).primaryColor
                                    : null),
                            padding: EdgeInsets.all(AppSizeR.s5),
                            child: ImageIcon(const AssetImage(IconAssets.map),
                                // ignore: deprecated_member_use
                                color: Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedIconTheme!
                                    .color),
                          ),
                          FittedBox(
                            child: Text(
                              AppStrings().map,
                              style: Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .unselectedLabelStyle,
                            ),
                          ),
                          // const Spacer()
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSizeH.s75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: state == 4
                                    ? Theme.of(context).primaryColor
                                    : null),
                            padding: EdgeInsets.all(AppSizeR.s5),
                            child: ImageIcon(const AssetImage(IconAssets.stats),
                                // ignore: deprecated_member_use
                                color: Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedIconTheme!
                                    .color),
                          ),
                          FittedBox(
                            child: Text(AppStrings().indicators,
                                style: Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedLabelStyle),
                          ),
                          // const Spacer()
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: AppSizeH.s12,
          child: GestureDetector(
            onTap: () {
              widget._controller.animateTo(2);
              widget.onTap(2);
            },
            child: BlocProvider<ChatHistoryCubit>.value(
              value: chatHistoryCubit,
              child: Column(
                children: [
                  Container(
                    height: AppSizeH.s60,
                    width: AppSizeH.s60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            spreadRadius: 3,
                          )
                        ],
                        image: const DecorationImage(
                            image: AssetImage(
                              ImageAssets.chatBot,
                            ),
                            fit: BoxFit.cover)),
                    padding: EdgeInsets.all(AppSizeR.s6),
                    // child:
                    // Image(
                    //   image: const AssetImage(ImageAssets.chatBot),
                    //   width: AppSizeW.s54,
                    //   height: AppSizeH.s54,
                    // ),
                  ),
                  Text("عقاري",
                      style: Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedLabelStyle)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
