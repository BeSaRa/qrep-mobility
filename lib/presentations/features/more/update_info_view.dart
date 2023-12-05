import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/cms_models/user/requests/update_info_model.dart';
import '../../resources/resources.dart';
import '../../widgets/widgets.dart';
import 'blocs/user_bloc/user_bloc.dart';
import 'more_view.dart';

class UpdateInfoView extends StatefulWidget {
  const UpdateInfoView({super.key});

  @override
  State<UpdateInfoView> createState() => _UpdateInfoViewState();
}

class _UpdateInfoViewState extends State<UpdateInfoView> {
  final firstNameController = TextEditingController();
  @override
  void initState() {
    firstNameController.text = context.read<UserBloc>().user?.firstName ?? "";
    super.initState();
  }

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
        // BackButton(
        //   color: ColorManager.golden,
        // ),
        title: Text(
          "تحديث المعلومات",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: Container(
        // alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            vertical: AppSizeH.s15, horizontal: AppSizeW.s30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizeW.s15),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: AppSizeW.s65,
                      height: AppSizeW.s65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizeH.s25),
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).shadowColor.withOpacity(0.7),
                            Theme.of(context).primaryColor,
                            Theme.of(context).primaryColor.withOpacity(0.8),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          context.read<UserBloc>().user?.firstName[0] ?? "G",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                  fontSize: AppSizeSp.s18,
                                  fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    Text(
                      context.read<UserBloc>().user?.firstName ?? "Guest",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("الاسم الاول",
                            style: Theme.of(context).textTheme.labelMedium),
                        SearchTextFieldWidget(
                            controller: firstNameController,
                            hint: "الاسم الاول"),
                      ],
                    ),
                  ),
                  SizedBox(width: AppSizeW.s12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("الاسم الاخير",
                            style: Theme.of(context).textTheme.labelMedium),
                        SearchTextFieldWidget(
                            controller: TextEditingController(),
                            hint: "الاسم الاخير"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizeH.s12),
              Divider(
                color: ColorManager.grey,
                height: AppSizeH.s1,
              ),
              SizedBox(height: AppSizeH.s12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("اللقب", style: Theme.of(context).textTheme.labelMedium),
                  SearchTextFieldWidget(
                      controller: TextEditingController(), hint: "اللقب"),
                ],
              ),
              SizedBox(height: AppSizeH.s12),
              Divider(
                color: ColorManager.grey,
                height: AppSizeH.s1,
              ),
              SizedBox(height: AppSizeH.s12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("البريد الالكتروني",
                      style: Theme.of(context).textTheme.labelMedium),
                  SearchTextFieldWidget(
                      controller: TextEditingController(),
                      hint: "البريد الالكتروني"),
                ],
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
                              id: context.read<UserBloc>().user?.id ?? "",
                              requestUpdateInfo: RequestUpdateInfoModel(
                                  firstName: firstNameController.text)));
                          // if (_formKey.currentState!.validate()) {
                          //   context.read<LoginBloc>().add(LoginEvent.login(
                          //       authRequest: RequestAuth(
                          //           email: emailController.text,
                          //           mode: "json",
                          //           password: passwordController.text)));
                          // }
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
