import 'package:bloc/bloc.dart';
import 'package:ebla/app/app_preferences.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class FaceIdCheckCubit extends Cubit<bool> {
  FaceIdCheckCubit(super.initialState);

  void save(bool val) => emit(val);

  final LocalAuthentication auth = LocalAuthentication();

  AppPreferences appPreferences = instance<AppPreferences>();
  bool? _canCheckBiometrics;
  List<BiometricType>? availableBiometrics;
  String authorized = 'Not Authorized';
  bool isAuthenticating = false;

  Future<void> checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      if (kDebugMode) {
        print(e);
      }
    }

    _canCheckBiometrics = canCheckBiometrics;
  }

  Future<void> getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      if (kDebugMode) {
        print(e);
      }
    }

    this.availableBiometrics = availableBiometrics;
  }

  Future<void> authenticate() async {
    bool authenticated = false;
    try {
      isAuthenticating = true;
      authorized = 'Authenticating';

      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );

      isAuthenticating = false;
    } on PlatformException catch (e) {
      if (kDebugMode) {}

      isAuthenticating = false;
      authorized = 'Error - ${e.message}';

      return;
    }

    authorized = authenticated ? 'Authorized' : 'Not Authorized';
  }

  Future<void> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      isAuthenticating = true;
      authorized = 'Authenticating';

      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      isAuthenticating = false;
      authorized = 'Authenticating';
    } on PlatformException catch (e) {
      if (kDebugMode) {}
      isAuthenticating = false;
      authorized = 'Error - ${e.message}';
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';

    authorized = message;
  }

  Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
    isAuthenticating = false;
  }
}
