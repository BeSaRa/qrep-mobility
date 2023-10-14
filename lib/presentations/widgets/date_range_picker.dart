import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

void showDatePickerPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.65,
        widthFactor: 0.9,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(AppSizeR.s12)),
          child: SfDateRangePicker(
            selectionMode: DateRangePickerSelectionMode.range,
            minDate: DateTime(2019),
            maxDate: DateTime.now(),
            showActionButtons: true,
            confirmText: AppStrings().confirm,
            cancelText: AppStrings().cancel,
            onSubmit: (val) {
              PickerDateRange selection = val as PickerDateRange;
              if (selection.startDate != null && selection.endDate != null) {
                // todo: update the value in the lookup bloc then request all kpis with new value
              }
              context.pop(context);
            },
            onCancel: () {
              context.pop(context);
            },
          ),
        ),
      );
    },
  );
}
