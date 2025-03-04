import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/theme_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ReraTextFaild extends StatelessWidget {
  final String hint;
  final String? errorMsg;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool readOnly;
  final TextEditingController? controller;
  final dynamic validator;
  final TextInputType? textInputType;
  // final List<TextInputFormatter>? inputFormatter;
  final bool? isBigFaild;
  final Function(String)? onChange;

  const ReraTextFaild({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.controller,
    this.validator,
    this.errorMsg,
    this.onChange,
    this.textInputType,
    // this.inputFormatter,
    this.isBigFaild,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorManager.grey,
      //to format the phone number
      // inputFormatters: [
      //   if (textInputType == TextInputType.number)
      //     FilteringTextInputFormatter.digitsOnly,
      // ],
      keyboardType: textInputType,
      style: TextStyle(
        fontFamily: FontConstants.fontFamily,
        color: ColorManager.textBlack,
        fontSize: AppSizeSp.s15,
        fontWeight: FontWeight.w500,
      ),
      onChanged: onChange,
      enabled: enabled,
      readOnly: readOnly,
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUnfocus,
      minLines: isBigFaild != null ? 4 : null,
      maxLines: isBigFaild != null ? null : 1,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontWeight:
              enabled || !readOnly ? FontWeight.normal : FontWeight.bold,
          fontSize:
              Theme.of(context).textTheme.bodySmall?.fontSize ?? AppSizeW.s14,
          color: enabled
              ? Theme.of(context).cardColor
              : Theme.of(context).primaryColor,
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: AppSizeW.s15, vertical: AppSizeH.s8),
        //  enabled
        //     ? Theme.of(context).inputDecorationTheme.hintStyle
        //     : Theme.of(context).textTheme.titleSmall,
        filled: true,
        fillColor: ColorManager.whiteSmoke,
        errorText: errorMsg,
        suffixIcon:
            Padding(padding: EdgeInsets.all(AppSizeW.s5), child: suffixIcon),
        // prefixIcon:
        //     Padding(padding: EdgeInsets.all(AppSizeW.s5), child: prefixIcon),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s15),
            borderSide:
                BorderSide(color: ColorManager.lightSilver, width: 0.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s15),
            borderSide:
                BorderSide(color: ColorManager.lightSilver, width: 0.5)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s15),
            borderSide:
                BorderSide(color: ColorManager.lightSilver, width: 0.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s15),
            borderSide:
                BorderSide(color: ColorManager.lightSilver, width: 0.5)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s15),
            borderSide: BorderSide(color: ColorManager.red, width: 0.5)),
      ),
    );
  }
}
