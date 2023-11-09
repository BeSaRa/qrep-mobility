import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/Auth/auth_models.dart';
import 'package:ebla/domain/models/Auth/requests_auth/request_auth.dart';
import 'package:ebla/presentations/features/auth/blocs/login_bloc/login_bloc.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../resources/assets_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // late LoginBloc loginBloc;
  bool light = true;
  final identifierController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    // loginBloc = instance<LoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: context.read<LoginBloc>(),
      listener: (context, LoginState state) {
        if (state.isSuccessLogin) {
          context.pop();
        }
      },
      child: Container(
        height: AppSizeH.s400,
        padding: EdgeInsets.symmetric(
            vertical: AppSizeH.s30, horizontal: AppSizeW.s30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizeW.s15),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(children: [
          Text(
            AppStrings().login,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: AppSizeH.s20,
          ),
          TextFormField(
            controller: identifierController,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: AppStrings().userName,
              prefixIcon: const Icon(
                Icons.person_outline_outlined,
              ),
            ),
          ),
          TextFormField(
            controller: passwordController,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: AppStrings().password,
              prefixIcon: const Icon(
                Icons.lock_outline,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppStrings().forgetPassword,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 12.sp),
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: AppSizeW.s20,
                width: AppSizeW.s20,
                child: SvgPicture.asset(
                  IconAssets.faceIdIcon,
                  // ignore: deprecated_member_use
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor,
                ),
              ),
              SizedBox(
                width: AppSizeW.s5,
              ),
              Text(
                AppStrings().activateFaceId,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              Switch(
                // This bool value toggles the switch.
                value: light,
                activeColor: Theme.of(context).primaryColor,
                activeTrackColor:
                    Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                inactiveThumbColor: Theme.of(context).primaryColor,
                inactiveTrackColor:
                    Theme.of(context).unselectedWidgetColor.withOpacity(0.2),

                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    light = value;
                  });
                },
              ),
            ],
          ),
          const Spacer(),
          BlocBuilder(
            bloc: context.read<LoginBloc>(),
            builder: (context, LoginState state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return CupertinoButton.filled(
                borderRadius: BorderRadius.circular(AppSizeR.s12),
                onPressed: () {
                  context.read<LoginBloc>().add(LoginEvent.login(
                      authRequest: RequestAuth(
                          identifier: identifierController.text,
                          json: "json",
                          password: passwordController.text)));
                },
                child: Text(
                  AppStrings().login,
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
