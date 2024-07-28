import 'dart:convert';

import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/features/favourite/bloc/UpdateFav/update_favourite_bloc.dart';
import 'package:ebla/presentations/features/favourite/bloc/create_favourite_bloc/create_favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app_preferences.dart';
import '../../../app/depndency_injection.dart';
import '../../../domain/models/favourite/favourite_models.dart';
import '../../resources/resources.dart';
import '../../widgets/shimmer_placeholder.dart';
import '../../widgets/widgets.dart';
import '../more/blocs/user_bloc/user_bloc.dart';

class FavouriteItemWidget extends StatelessWidget {
  final String name;
  final String page;
  final String date;
  final bool divider;
  final Function deleteFav;
  final Function updateFav;
  final Function applyFav;
  final Function openCard;
  final bool showApply;
  const FavouriteItemWidget({
    super.key,
    required this.name,
    required this.page,
    required this.date,
    this.divider = true,
    required this.deleteFav,
    required this.updateFav,
    required this.applyFav,
    required this.openCard,
    this.showApply = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openCard();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: AppSizeH.s5, horizontal: AppSizeR.s8),
        padding: EdgeInsets.symmetric(vertical: AppSizeH.s10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(AppSizeR.s10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: AppSizeSp.s18),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                "${AppStrings().page}: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: AppSizeSp.s14,
                                        fontWeight: FontWeight.w700),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                page,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: AppSizeSp.s14),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        DateTime.parse(date ?? '').toFormattedString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: AppSizeSp.s14),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          updateFav();
                        },
                        child: Container(
                          width: AppSizeW.s42,
                          decoration: BoxDecoration(
                              color: ColorManager.golden,
                              borderRadius: BorderRadius.circular(AppSizeR.s8)),
                          padding: EdgeInsets.all(AppSizeH.s3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.edit,
                                color: ColorManager.white,
                                size: AppSizeH.s24,
                              ),
                              SizedBox(
                                width: AppSizeW.s5,
                              ),
                              Text(
                                AppStrings().edit,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: AppSizeSp.s12,
                                        color: ColorManager.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          deleteFav();
                        },
                        child: Container(
                          width: AppSizeW.s42,
                          decoration: BoxDecoration(
                              color: ColorManager.golden,
                              borderRadius: BorderRadius.circular(AppSizeR.s8)),
                          padding: EdgeInsets.all(AppSizeH.s3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.delete,
                                color: ColorManager.white,
                                size: AppSizeH.s24,
                              ),
                              SizedBox(
                                width: AppSizeW.s5,
                              ),
                              Text(
                                AppStrings().delete,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: AppSizeSp.s12,
                                        color: ColorManager.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (showApply)
                        GestureDetector(
                          onTap: () async {
                            applyFav();
                          },
                          child: Container(
                            width: AppSizeW.s42,
                            decoration: BoxDecoration(
                                color: ColorManager.golden,
                                borderRadius:
                                    BorderRadius.circular(AppSizeR.s8)),
                            padding: EdgeInsets.all(AppSizeH.s3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.bolt,
                                  color: ColorManager.white,
                                  size: AppSizeH.s24,
                                ),
                                SizedBox(
                                  width: AppSizeW.s5,
                                ),
                                Text(
                                  AppStrings().apply,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: AppSizeSp.s12,
                                          color: ColorManager.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
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
      ),
    );
  }
}

class FavouriteItemShimmer extends StatelessWidget {
  const FavouriteItemShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: AppSizeH.s5, horizontal: AppSizeR.s10),
      padding: EdgeInsets.symmetric(vertical: AppSizeH.s10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(AppSizeR.s10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: AppSizeW.s140,
                      height: AppSizeH.s50,
                      child: ShimmerPlaceholder(
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius:
                                  BorderRadius.circular(AppSizeR.s12)),
                        ),
                      )),
                  Row(
                    children: [
                      Text(
                        AppStrings().page,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: AppSizeSp.s14,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: AppSizeW.s5,
                      ),
                      ShimmerPlaceholder(
                        child: Container(
                          width: AppSizeW.s76,
                          // width: double.infinity,
                          height: AppSizeH.s15,
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius:
                                  BorderRadius.circular(AppSizeR.s12)),
                        ),
                      )
                    ],
                  ),
                  ShimmerPlaceholder(
                    child: Container(
                      width: AppSizeW.s76,
                      // width: double.infinity,
                      height: AppSizeH.s15,
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(AppSizeR.s12)),
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // _callNumber(phone);
                    },
                    child: Container(
                      width: AppSizeW.s42,
                      decoration: BoxDecoration(
                          color: ColorManager.golden,
                          borderRadius: BorderRadius.circular(AppSizeR.s8)),
                      padding: EdgeInsets.all(AppSizeH.s3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.edit,
                            color: ColorManager.white,
                            size: AppSizeH.s24,
                          ),
                          SizedBox(
                            width: AppSizeW.s5,
                          ),
                          Text(
                            AppStrings().edit,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: AppSizeSp.s12,
                                    color: ColorManager.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    // height: AppSizeH.s10,
                    width: AppSizeH.s10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // sendEmail(email);
                    },
                    child: Container(
                      width: AppSizeW.s42,
                      decoration: BoxDecoration(
                          color: ColorManager.golden,
                          borderRadius: BorderRadius.circular(AppSizeR.s8)),
                      padding: EdgeInsets.all(AppSizeH.s3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.delete,
                            color: ColorManager.white,
                            size: AppSizeH.s24,
                          ),
                          SizedBox(
                            width: AppSizeW.s5,
                          ),
                          Text(
                            AppStrings().delete,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: AppSizeSp.s12,
                                    color: ColorManager.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    // height: AppSizeH.s10,
                    width: AppSizeH.s10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // openMap();
                    },
                    child: Container(
                      width: AppSizeW.s42,
                      decoration: BoxDecoration(
                          color: ColorManager.golden,
                          borderRadius: BorderRadius.circular(AppSizeR.s8)),
                      padding: EdgeInsets.all(AppSizeH.s3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.bolt,
                            color: ColorManager.white,
                            size: AppSizeH.s24,
                          ),
                          SizedBox(
                            width: AppSizeW.s5,
                          ),
                          Text(
                            AppStrings().apply,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: AppSizeSp.s12,
                                    color: ColorManager.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // if (divider)
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

class PagesNames {
  String arName;
  String enName;
  int num;
  PagesNames(this.num, this.arName, this.enName);
}

extension IndicatorsTypeNumber on Indicators {
  int get number {
    switch (this) {
      case Indicators.broker:
        return 1;
      case Indicators.sell:
        return 2;
      case Indicators.rental:
        return 3;
      case Indicators.mortgage:
        return 4;
      case Indicators.general:
        return 5;
      case Indicators.occupied:
        return 6;
      case Indicators.ownership:
        return 7;
    }
  }
}

class DeleteItemWidget extends StatelessWidget {
  const DeleteItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: AppSizeH.s200,
      padding: EdgeInsets.symmetric(
          vertical: AppSizeH.s30, horizontal: AppSizeW.s30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizeW.s15),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStrings().delete,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: AppSizeH.s20,
          ),
          Text(
            AppStrings().checkDeleteFav,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: AppSizeH.s20,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    isPrimary: false,
                    titleStyle: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: ColorManager.primary),
                    title: AppStrings().yes,
                    onPress: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ),
                SizedBox(width: AppSizeW.s8),
                Expanded(
                  child: CustomElevatedButton(
                    isPrimary: true,
                    title: AppStrings().no,
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                    backgroundColor:
                        instance<AppPreferences>().getTheme().brightness ==
                                Brightness.light
                            ? ColorManager.primary
                            : ColorManager.greyCloud,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UpdateFavWidget extends StatefulWidget {
  final FavouriteResponse name;
  const UpdateFavWidget({super.key, required this.name});

  @override
  State<UpdateFavWidget> createState() => _UpdateFavWidgetState();
}

class _UpdateFavWidgetState extends State<UpdateFavWidget> {
  late UpdateFavouriteBloc updateFavouriteBloc;
  final GlobalKey<FormState> _resetFormKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    updateFavouriteBloc = instance<UpdateFavouriteBloc>();
    name.text = widget.name.name ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _resetFormKey,
      child: Container(
        height: AppSizeH.s250,
        padding: EdgeInsets.symmetric(
            vertical: AppSizeH.s30, horizontal: AppSizeW.s30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizeW.s15),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                AppStrings().editName,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            TextFormField(
              controller: name,
              style: Theme.of(context).textTheme.bodyMedium,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings().validatorNameEmpty;
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: widget.name.name,
                prefixIcon: const Icon(
                  Icons.abc,
                ),
              ),
            ),
            const Spacer(),
            BlocConsumer<UpdateFavouriteBloc, UpdateFavouriteState>(
              bloc: updateFavouriteBloc,
              listener: (context, state) {
                state.map(
                    initial: (val) {},
                    loading: (val) {},
                    done: (val) {
                      Navigator.of(context).pop(true);
                    },
                    error: (val) {
                      Navigator.of(context).pop(false);
                    });
              },
              builder: (context, state) {
                return state.map(initial: (val) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(children: [
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: true,
                          backgroundColor: Theme.of(context).primaryColor,
                          title: AppStrings().confirm,
                          onPress: () {
                            if (_resetFormKey.currentState!.validate()) {
                              updateFavouriteBloc.add(
                                  UpdateFavouriteEvent.started(
                                      widget.name.copyWith(name: name.text)));
                            }
                          },
                        ),
                      ),
                      SizedBox(width: AppSizeW.s8),
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: false,
                          title: AppStrings().cancel,
                          onPress: () {
                            Navigator.of(context).pop();
                          },
                          backgroundColor: instance<AppPreferences>()
                                      .getTheme()
                                      .brightness ==
                                  Brightness.light
                              ? ColorManager.porcelain
                              : ColorManager.greyCloud,
                        ),
                      ),
                    ]),
                  );
                }, loading: (valu) {
                  return SizedBox(
                      height: AppSizeH.s25,
                      child: const CircularProgressIndicator());
                }, done: (done) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(children: [
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: true,
                          backgroundColor: Theme.of(context).primaryColor,
                          title: AppStrings().confirm,
                          onPress: () {
                            if (_resetFormKey.currentState!.validate()) {
                              updateFavouriteBloc.add(
                                  UpdateFavouriteEvent.started(
                                      widget.name.copyWith(name: name.text)));
                            }
                          },
                        ),
                      ),
                      SizedBox(width: AppSizeW.s8),
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: false,
                          title: AppStrings().cancel,
                          onPress: () {
                            Navigator.of(context).pop();
                          },
                          backgroundColor: instance<AppPreferences>()
                                      .getTheme()
                                      .brightness ==
                                  Brightness.light
                              ? ColorManager.porcelain
                              : ColorManager.greyCloud,
                        ),
                      ),
                    ]),
                  );
                }, error: (val) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(children: [
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: true,
                          backgroundColor: Theme.of(context).primaryColor,
                          title: AppStrings().confirm,
                          onPress: () {
                            if (_resetFormKey.currentState!.validate()) {
                              updateFavouriteBloc.add(
                                  UpdateFavouriteEvent.started(
                                      widget.name.copyWith(name: name.text)));
                            }
                          },
                        ),
                      ),
                      SizedBox(width: AppSizeW.s8),
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: false,
                          title: AppStrings().cancel,
                          onPress: () {
                            Navigator.of(context).pop();
                          },
                          backgroundColor: instance<AppPreferences>()
                                      .getTheme()
                                      .brightness ==
                                  Brightness.light
                              ? ColorManager.porcelain
                              : ColorManager.greyCloud,
                        ),
                      ),
                    ]),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CreateFavWidget extends StatefulWidget {
  final CriteriaObject criteria;
  final Indicators page;
  const CreateFavWidget(
      {super.key, required this.criteria, required this.page});

  @override
  State<CreateFavWidget> createState() => _CreateFavWidgetState();
}

class _CreateFavWidgetState extends State<CreateFavWidget> {
  late CreateFavouriteBloc createFavouriteBloc;
  final GlobalKey<FormState> _resetFormKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    createFavouriteBloc = instance<CreateFavouriteBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _resetFormKey,
      child: Container(
        height: AppSizeH.s250,
        padding: EdgeInsets.symmetric(
            vertical: AppSizeH.s30, horizontal: AppSizeW.s30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizeW.s15),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                AppStrings().editName,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            TextFormField(
              controller: name,
              style: Theme.of(context).textTheme.bodyMedium,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings().validatorNameEmpty;
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: AppStrings().nickName,
                prefixIcon: const Icon(
                  Icons.abc,
                ),
              ),
            ),
            const Spacer(),
            BlocConsumer<CreateFavouriteBloc, CreateFavouriteState>(
              bloc: createFavouriteBloc,
              listener: (context, state) {
                state.map(
                    initial: (val) {},
                    loading: (val) {},
                    done: (val) {
                      Navigator.of(context).pop(true);
                    },
                    error: (val) {
                      Navigator.of(context).pop(false);
                    });
              },
              builder: (context, state) {
                return state.map(initial: (val) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(children: [
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: true,
                          backgroundColor: Theme.of(context).primaryColor,
                          title: AppStrings().confirm,
                          onPress: () {
                            if (_resetFormKey.currentState!.validate()) {
                              widget.criteria
                                  .toJson()
                                  .removeWhere((key, value) => value == null);
                              FavouriteResponse body = FavouriteResponse(
                                  name: name.text,
                                  criteria: json.encode(widget.criteria),
                                  pageName: widget.page,
                                  userId:
                                      context.read<UserBloc>().user?.id ?? '');
                              createFavouriteBloc
                                  .add(CreateFavouriteEvent.started(body));
                            }
                          },
                        ),
                      ),
                      SizedBox(width: AppSizeW.s8),
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: false,
                          title: AppStrings().cancel,
                          onPress: () {
                            Navigator.of(context).pop();
                          },
                          backgroundColor: instance<AppPreferences>()
                                      .getTheme()
                                      .brightness ==
                                  Brightness.light
                              ? ColorManager.porcelain
                              : ColorManager.greyCloud,
                        ),
                      ),
                    ]),
                  );
                }, loading: (valu) {
                  return SizedBox(
                      height: AppSizeH.s25,
                      child: const CircularProgressIndicator());
                }, done: (done) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(children: [
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: true,
                          backgroundColor: Theme.of(context).primaryColor,
                          title: AppStrings().confirm,
                          onPress: () {
                            if (_resetFormKey.currentState!.validate()) {
                              FavouriteResponse body = FavouriteResponse(
                                  name: name.text,
                                  criteria: widget.criteria.toString(),
                                  pageName: widget.page,
                                  userId:
                                      context.read<UserBloc>().user?.id ?? '');
                              createFavouriteBloc
                                  .add(CreateFavouriteEvent.started(body));
                            }
                          },
                        ),
                      ),
                      SizedBox(width: AppSizeW.s8),
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: false,
                          title: AppStrings().cancel,
                          onPress: () {
                            Navigator.of(context).pop();
                          },
                          backgroundColor: instance<AppPreferences>()
                                      .getTheme()
                                      .brightness ==
                                  Brightness.light
                              ? ColorManager.porcelain
                              : ColorManager.greyCloud,
                        ),
                      ),
                    ]),
                  );
                }, error: (val) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(children: [
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: true,
                          backgroundColor: Theme.of(context).primaryColor,
                          title: AppStrings().confirm,
                          onPress: () {
                            if (_resetFormKey.currentState!.validate()) {
                              FavouriteResponse body = FavouriteResponse(
                                  name: name.text,
                                  criteria: widget.criteria.toString(),
                                  pageName: widget.page,
                                  userId:
                                      context.read<UserBloc>().user?.id ?? '');
                              createFavouriteBloc
                                  .add(CreateFavouriteEvent.started(body));
                            }
                          },
                        ),
                      ),
                      SizedBox(width: AppSizeW.s8),
                      Expanded(
                        child: CustomElevatedButton(
                          isPrimary: false,
                          title: AppStrings().cancel,
                          onPress: () {
                            Navigator.of(context).pop();
                          },
                          backgroundColor: instance<AppPreferences>()
                                      .getTheme()
                                      .brightness ==
                                  Brightness.light
                              ? ColorManager.porcelain
                              : ColorManager.greyCloud,
                        ),
                      ),
                    ]),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
