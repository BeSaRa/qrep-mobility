
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/features/training/widgets/training_widgets/custom_date_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ebla/presentations/resources/resources.dart';

class SessionDateField extends StatelessWidget {
  final ValueNotifier<DateTime?> selectedDateNotifier;
  final String label;

  const SessionDateField({
    super.key,
    required this.selectedDateNotifier,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? ColorManager.golden
                    : ColorManager.primaryBlue,
                fontSize: AppSizeSp.s11,
              ),
        ),
        SizedBox(height: AppSizeH.s10),
        GestureDetector(
          onTap: () async {
            await showDialog(
              context: context,
              builder: (context) => CustomDatePickerDialog(
                selectedDateNotifier: selectedDateNotifier,
              ),
            );
          },
          child: Container(
            height: AppSizeH.s36,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(AppSizeR.s5),
              border: Border.all(
                width: AppSizeW.s1,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizeW.s10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueListenableBuilder<DateTime?>(
                    valueListenable: selectedDateNotifier,
                    builder: (context, date, _) {
                      return Text(
                        date != null
                            ? DateFormat('yyyy-MM-dd').format(date)
                            : AppStrings().sessionDate,
                        style: Theme.of(context).textTheme.labelSmall,
                      );
                    },
                  ),
                  Icon(
                    Icons.calendar_today,
                    size: AppSizeW.s16,
                    color: ColorManager.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}