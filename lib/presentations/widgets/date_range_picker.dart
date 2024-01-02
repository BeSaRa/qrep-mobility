import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

//todo this still need work
Future<PickerDateRange?>? showDatePickerPopup(
    BuildContext context, PickerDateRange? initital) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.65,
        widthFactor: 0.9,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(AppSizeR.s12)),
          child: SfDateRangePicker(
            selectionMode: DateRangePickerSelectionMode.range,
            initialSelectedRange: initital,
            minDate: DateTime(2019),
            maxDate: DateTime.now(),
            showActionButtons: true,
            confirmText: AppStrings().confirm,
            cancelText: AppStrings().cancel,
            onSubmit: (val) {
              // print('val is $val');
              PickerDateRange? selection = val as PickerDateRange?;
              if (selection?.startDate != null && selection?.endDate != null) {
                // print('selection $selection');
                // context.pop(context);
                Navigator.of(context).pop(selection);
                // todo: update the value in the lookup bloc then request all kpis with new value
              } else {
                Navigator.of(context).pop();
              }
              // Navigator.of(context).pop();
              // context.pop(context);
            },
            onCancel: () {
              if (initital != null) {
                Navigator.of(context).pop(initital);
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      );
    },
  );
}
