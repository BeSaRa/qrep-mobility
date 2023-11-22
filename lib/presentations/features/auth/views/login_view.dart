// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/features/auth/blocs/cubits/face_id_check_cubit.dart';
import 'package:ebla/presentations/features/auth/blocs/login_bloc/login_bloc.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../domain/models/Auth/requests_auth/request_auth.dart';
import '../../../widgets/widgets.dart';
import '../../main/blocs/lookup_bloc/lookup_bloc.dart';
import '../../more/blocs/user_bloc/user_bloc.dart';
import 'biometrec_logic.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // late LoginBloc loginBloc;
  bool light = true;
  bool canAuthenticateout = false;
  bool isSecure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication();

  late FaceIdCheckCubit faceIdCheck;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    haveFaceId();
    faceIdCheck = FaceIdCheckCubit(false);
    light = faceIdCheck.appPreferences.getUserFaceId();
    super.initState();
  }

  Future<bool> haveFaceId() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    faceIdCheck.save(canAuthenticate);
    canAuthenticateout = canAuthenticate;
    if (light) {
      String data = await getBioProtectedEntry() ?? '';
      if (data.isNotEmpty) {
        var res = await showDialog(
            context: context,
            builder: (BuildContext context) =>
                _buildPopupDialog(context, data));
        if (res != null && res == true) {
          emailController.text =
              data.split(',').first.replaceAll('username:', '');
          passwordController.text =
              data.split(',').last.replaceAll('password:', '');
          context.read<LoginBloc>().add(LoginEvent.login(
              authRequest: RequestAuth(
                  email: data.split(',').first.replaceAll('username:', ''),
                  mode: "json",
                  password: data.split(',').last.replaceAll('password:', ''))));
        }
      }
    }
    return canAuthenticate;
  }

  Widget build(BuildContext context) {
    return BlocListener(
      bloc: context.read<UserBloc>(),
      listener: (context, UserState state) {
        state.mapOrNull(
          loading: (value) {
            context.read<UserBloc>().add(const UserEvent.getUserInfo());
          },
        );
      },
      child: BlocListener(
        bloc: context.read<LoginBloc>(),
        listener: (context, LoginState state) async {
          if (state.isSuccessLogin) {
            if (light && canAuthenticateout) {
              //save password in biometrics
              createBioProtectedEntry(
                  emailController.text, passwordController.text);
            }
            await resetAllModules();
            context.read<LookupBloc>().add(const LookupEvent.initilaEvent());
            context.read<UserBloc>().add(const UserEvent.initialUser());
            context.pop();
          }
          if (state.isHasError) {
            Fluttertoast.showToast(
                msg: state.errorMessage, backgroundColor: ColorManager.red);
          }
        },
        child: Form(
          key: _formKey,
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
                controller: emailController,
                style: Theme.of(context).textTheme.bodyMedium,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings().validatorEmailEmpty;
                  }
                  if (value.emailReg()) {
                    return AppStrings().validatorEmailFormat;
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: AppStrings().email,
                  prefixIcon: const Icon(
                    Icons.person_outline_outlined,
                  ),
                ),
              ),
              TextFormField(
                obscureText: isSecure,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: passwordController,
                style: Theme.of(context).textTheme.bodyMedium,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings().validatorPasswordEmpty;
                  }

                  return null;
                },
                decoration: InputDecoration(
                    hintText: AppStrings().password,
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        passwordController.text.isEmpty
                            ? null
                            : setState(() {
                                isSecure = !isSecure;
                              });
                      },
                      child: Icon(
                        isSecure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: ColorManager.primary,
                        size: AppSizeSp.s18,
                      ),
                    )),
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
              BlocBuilder(
                bloc: faceIdCheck,
                builder: (context, state) {
                  if (state == true) {
                    return Row(
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
                          activeTrackColor: Theme.of(context)
                              .unselectedWidgetColor
                              .withOpacity(0.2),
                          inactiveThumbColor: Theme.of(context).primaryColor,
                          inactiveTrackColor: Theme.of(context)
                              .unselectedWidgetColor
                              .withOpacity(0.2),

                          onChanged: (bool value) {
                            if (value == true) {
                              haveFaceId();
                            }
                            faceIdCheck.appPreferences.setUserFaceId(value);
                            setState(() {
                              light = value;
                            });
                          },
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
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
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginBloc>().add(LoginEvent.login(
                            authRequest: RequestAuth(
                                email: emailController.text,
                                mode: "json",
                                password: passwordController.text)));
                      }
                    },
                    child: Text(
                      AppStrings().login,
                    ),
                  );
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context, String data) {
    return Dialog(
      elevation: 0,
      child: Container(
        height: AppSizeH.s200,
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
                AppStrings.loginWithUsernameStored.tr(args: [
                  data.split(',').first.replaceAll(
                        'username:',
                        '',
                      )
                ]),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const Spacer(),
            Row(children: [
              Expanded(
                child: CustomElevatedButton(
                  isPrimary: true,
                  title: AppStrings().confirm,
                  onPress: () {
                    Navigator.of(context).pop(true);
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
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
