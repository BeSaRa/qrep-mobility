import 'package:easy_localization/easy_localization.dart';

extension StringExtensions on String {
  bool passwordReg() {
    return !RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(this);
  }
}

extension DateTimeExtension on DateTime? {
  String toFormattedString() {
    return DateFormat('yyyy-MM-dd').format(this!);
  }
}
