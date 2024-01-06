// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart' as local;
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/features/auth/blocs/cubits/error_message_cubit.dart';
import 'package:ebla/presentations/features/auth/blocs/cubits/face_id_check_cubit.dart';
import 'package:ebla/presentations/features/auth/blocs/cubits/logged_in_user_cubit.dart';
import 'package:ebla/presentations/features/auth/blocs/forget_password_bloc/forget_password_bloc.dart';
import 'package:ebla/presentations/features/auth/blocs/login_bloc/login_bloc.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../app/app_preferences.dart';
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
  late ErrorMessageCubit errorMessageCubit;

  late FaceIdCheckCubit faceIdCheck;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _resetFormKey = GlobalKey<FormState>();

  late ForgetPasswordBloc forgetPasswordBloc;

  @override
  void initState() {
    haveFaceId();
    faceIdCheck = FaceIdCheckCubit(false);
    errorMessageCubit = ErrorMessageCubit('');
    light = faceIdCheck.appPreferences.getUserFaceId();
    forgetPasswordBloc = instance<ForgetPasswordBloc>();
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

  @override
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
            context.read<UserBloc>().add(const UserEvent.getUserInfo());
            context.read<LoggedInUserCubit>().save(true);
            context.pop();
          }
          if (state.isHasError) {
            errorMessageCubit.save(state.errorMessage);
            Future.delayed(const Duration(seconds: 15))
                .then((value) => errorMessageCubit.remove());
            // Fluttertoast.showToast(
            //     msg: state.errorMessage, backgroundColor: ColorManager.red);
          }
        },
        child: Form(
          key: _formKey,
          child: Container(
            height: AppSizeH.s465,
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
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: ColorManager.primary,
                        size: AppSizeSp.s18,
                      ),
                    )),
              ),
              SizedBox(
                height: AppSizeH.s8,
              ),
              GestureDetector(
                onTap: () async {
                  var res = await showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildResetPasswordDialog(context, ''));
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings().forgetPassword,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 12.sp),
                  ),
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
                          width: AppSizeW.s20,
                        ),
                        Text(
                          AppStrings().activateFaceId,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Switch(
                          // This bool value toggles the switch.
                          value: light,
                          activeColor: Theme.of(context).primaryColor,
                          activeTrackColor:
                              Theme.of(context).colorScheme.onTertiaryContainer,
                          inactiveThumbColor:
                              Theme.of(context).colorScheme.onTertiary,
                          inactiveTrackColor:
                              Theme.of(context).colorScheme.onTertiaryContainer,
                          // trackOutlineColor: Theme.of(context).primaryColor,
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
              SizedBox(
                height: AppSizeH.s10,
              ),
              BlocBuilder(
                bloc: errorMessageCubit,
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizeH.s20, vertical: AppSizeW.s10),
                    decoration: BoxDecoration(
                        color: errorMessageCubit.state.length > 1
                            ? Theme.of(context).canvasColor
                            : Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(AppSizeH.s10)),
                    child: Text(
                      errorMessageCubit.state,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: ColorManager.red),
                    ),
                  );
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
                  return CupertinoButton(
                    color: ColorManager.primary,
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
                      style: Theme.of(context).textTheme.displaySmall,
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
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Spacer(),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(children: [
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
                    backgroundColor:
                        instance<AppPreferences>().getTheme().brightness ==
                                Brightness.light
                            ? ColorManager.porcelain
                            : ColorManager.greyCloud,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResetPasswordDialog(BuildContext context, String data) {
    return Dialog(
      elevation: 0,
      child: Form(
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
                  AppStrings().enterYourEmailToReset,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              TextFormField(
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
              const Spacer(),
              BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
                bloc: forgetPasswordBloc,
                listener: (context, state) {
                  state.map(
                      initial: (val) {},
                      loading: (val) {},
                      done: (val) {
                        Navigator.of(context).pop(true);
                        errorMessageCubit.save(val.url);
                      },
                      error: (val) {
                        Navigator.of(context).pop(true);
                        errorMessageCubit.save(val.message);
                      });
                },
                builder: (context, state) {
                  return state.map(initial: (val) {
                    return _ConfirmButton(
                      formKey: _resetFormKey,
                      confirm: () {
                        if (_resetFormKey.currentState!.validate()) {
                          forgetPasswordBloc.add(ForgetPasswordEvent.started(
                              emailController.text));
                        }
                      },
                    );
                  }, loading: (valu) {
                    return SizedBox(
                        height: AppSizeH.s25,
                        child: const CircularProgressIndicator());
                  }, done: (done) {
                    return _ConfirmButton(
                      formKey: _resetFormKey,
                      confirm: () {
                        if (_resetFormKey.currentState!.validate()) {
                          forgetPasswordBloc.add(ForgetPasswordEvent.started(
                              emailController.text));
                        }
                      },
                    );
                  }, error: (val) {
                    return _ConfirmButton(
                      formKey: _resetFormKey,
                      confirm: () {
                        if (_resetFormKey.currentState!.validate()) {
                          forgetPasswordBloc.add(ForgetPasswordEvent.started(
                              emailController.text));
                        }
                      },
                    );
                  });
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConfirmButton extends StatelessWidget {
  const _ConfirmButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.confirm,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final Function confirm;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(children: [
        Expanded(
          child: CustomElevatedButton(
            isPrimary: true,
            backgroundColor: Theme.of(context).primaryColor,
            title: AppStrings().confirm,
            onPress: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).pop(true);
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
            backgroundColor: instance<AppPreferences>().getTheme().brightness ==
                    Brightness.light
                ? ColorManager.porcelain
                : ColorManager.greyCloud,
          ),
        ),
      ]),
    );
  }
}
