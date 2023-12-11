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

  @override
  void initState() {
    firstNameController.text = widget.model.firstName;
    lastNameController.text = widget.model.lastName;
    // nickNameController.text = widget.model.;
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: firstNameController,
              ),
              SizedBox(width: AppSizeW.s12),
              TextField(
                controller: TextEditingController(),
              ),
              SizedBox(height: AppSizeH.s12),
              Divider(
                color: ColorManager.grey,
                height: AppSizeH.s1,
              ),
              SizedBox(height: AppSizeH.s12),
              TextField(
                controller: TextEditingController(),
              ),
              SizedBox(height: AppSizeH.s12),
              Divider(
                color: ColorManager.grey,
                height: AppSizeH.s1,
              ),
              SizedBox(height: AppSizeH.s12),
              TextField(
                controller: TextEditingController(),
              ),
              // SizedBox(height: AppSizeH.s20),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text("اشعارات البريد الألكتروني",
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
              SizedBox(height: AppSizeH.s20),
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
                                  firstName: firstNameController.text)));
                        },
                        child: const Text(
                          "تحديث",
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
      ),
    );
  }
}
