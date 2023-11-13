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

extension DateTimeExtensions on DateTime {
  String toShowDateTime({String? local}) {
    final DateFormat formatter = DateFormat('d MMM yyyy', local);
    return formatter.format(this);
  }
}

extension NumberFormatting on num {
  String formatWithCommas() {
    return toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }

  String formatWithCommasToInt() {
    return toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}
