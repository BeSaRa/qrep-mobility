import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/services.dart';

class NumberInputField extends StatefulWidget {
  final ValueNotifier<int> valueNotifier;
  final String label;
  final int min;
  final int max;

  const NumberInputField({
    super.key,
    required this.valueNotifier,
    required this.label,
    this.min = 1,
    this.max = 365,
  });

  @override
  State<NumberInputField> createState() => _NumberInputFieldState();
}

class _NumberInputFieldState extends State<NumberInputField> {
  final ValueNotifier<String?> errorNotifier = ValueNotifier(null);
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.valueNotifier.value.toString(),
    );
    _validateValue(widget.valueNotifier.value);
  }

  @override
  void didUpdateWidget(NumberInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.valueNotifier != oldWidget.valueNotifier) {
      _controller.text = widget.valueNotifier.value.toString();
    }
  }

  void _validateValue(int value) {
    if (value < widget.min || value > widget.max) {
    errorNotifier.value = tr('validation_days_range', 
      namedArgs: {
        'min': widget.min.toString(),
        'max': widget.max.toString()
      }
    );
  }else {
      errorNotifier.value = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? ColorManager.golden
                    : ColorManager.primaryBlue,
                fontSize: AppSizeSp.s11,
              ),
        ),
        SizedBox(height: AppSizeH.s10),
        ValueListenableBuilder<String?>(
          valueListenable: errorNotifier,
          builder: (context, error, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: AppSizeH.s36,
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(AppSizeR.s5),
                    border: Border.all(
                      width: AppSizeW.s1,
                      color: error != null
                          ? ColorManager.red
                          : Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _controller,
                          focusNode: _focusNode,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: error != null
                                    ? ColorManager.red
                                    : null,
                              ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppSizeW.s10,
                              vertical:  AppSizeH.s10,
                            ),
                            hintText: '0',
                            hintStyle: Theme.of(context)
                                .textTheme.labelSmall
                                ?.copyWith(
                                  color: ColorManager.greyCloud,
                                ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              final intValue = int.tryParse(value) ?? widget.min;
                              widget.valueNotifier.value = intValue;
                              _validateValue(intValue);
                            } else {
                              widget.valueNotifier.value = widget.min;
                              errorNotifier.value = null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (error != null)
                  Padding(
                    padding: EdgeInsets.only(top: AppSizeH.s4),
                    child: Text(
                      error,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: ColorManager.red,
                            fontSize: AppSizeSp.s10,
                          ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    errorNotifier.dispose();
    super.dispose();
  }
}