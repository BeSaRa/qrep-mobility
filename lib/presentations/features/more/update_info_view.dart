import 'package:ebla/presentations/features/more/blocs/cubits/change_notification_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/cms_models/user/requests/update_info_model.dart';
import '../../../domain/models/cms_models/user/user_model.dart';
import '../../resources/resources.dart';
import '../../widgets/text_field_filter_widget.dart';
import 'blocs/user_bloc/user_bloc.dart';

class UpdateInfo extends StatefulWidget {
  final UserModel model;

  const UpdateInfo({
    super.key,
    required this.model,
  });

  @override
  State<UpdateInfo> createState() => _UpdateInfoState();
}

class _UpdateInfoState extends State<UpdateInfo> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final nickNameController = TextEditingController();
  final emailNameController = TextEditingController();
  late ChangeNotificationCubit notificationCubit;

  @override
  void initState() {
    firstNameController.text = widget.model.firstName;
    lastNameController.text = widget.model.lastName;
    nickNameController.text = widget.model.title;
    emailNameController.text = widget.model.email;
    notificationCubit =
        ChangeNotificationCubit(widget.model.emailNotifications);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EblaAppBar(
        title: AppStrings().updateProfile,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppSizeH.s15, horizontal: AppSizeW.s30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizeW.s15),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: firstNameController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      // if (value == null || value.isEmpty) {
                      //   return AppStrings().validatorEmailEmpty;
                      // }
                      if (value!.length > 49) {
                        return AppStrings().nameValidationLength;
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: AppStrings().firstName,
                      prefixIcon: const Icon(
                        Icons.person_outline,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizeW.s20),
                  TextFormField(
                    controller: lastNameController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value!.length > 49) {
                        return AppStrings().validatorEmailEmpty;
                      }
                      return null;
                      // if (value.emailReg()) {
                      //   return AppStrings().validatorEmailFormat;
                      // }
                      // return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: AppStrings().lastName,
                      prefixIcon: const Icon(
                        Icons.person_pin_outlined,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizeH.s20),
                  TextFormField(
                    controller: nickNameController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value!.length > 49) {
                        return AppStrings().nameValidationLength;
                      }
                      // if (value.emailReg()) {
                      //   return AppStrings().validatorEmailFormat;
                      // }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: AppStrings().nickName,
                      prefixIcon: const Icon(
                        Icons.nature_outlined,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizeH.s20),
                  TextFormField(
                    enabled: false,
                    controller: emailNameController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintText: AppStrings().email,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizeH.s20),
                  BlocBuilder(
                    bloc: notificationCubit,
                    builder: (context, state) {
                      return Row(
                        children: [
                          Checkbox(
                            value: notificationCubit.state,
                            onChanged: (value) {
                              notificationCubit.save(!notificationCubit.state);
                            },
                          ),
                          Text(AppStrings().activateEmailNotifications,
                              style: Theme.of(context).textTheme.labelMedium),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            BlocConsumer(
              listener: (context, UserState state) {
                state.mapOrNull(
                  loaded: (value) {
                    context.pop();
                  },
                );
              },
              bloc: context.read<UserBloc>(),
              builder: (context, UserState state) {
                return state.map(
                  loading: (value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  loaded: (value) {
                    return CupertinoButton.filled(
                      borderRadius: BorderRadius.circular(AppSizeR.s12),
                      onPressed: () {
                        context.read<UserBloc>().add(UserEvent.updateUserInfo(
                            id: widget.model.id,
                            requestUpdateInfo: RequestUpdateInfoModel(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                title: nickNameController.text,
                                emailNotifications: notificationCubit.state)));
                      },
                      child: Text(
                        AppStrings().confirm,
                      ),
                    );
                  },
                  error: (value) {
                    return const SizedBox();
                  },
                  initial: (value) {
                    return const SizedBox();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
