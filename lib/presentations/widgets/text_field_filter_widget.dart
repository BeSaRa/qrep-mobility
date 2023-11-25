import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/resources.dart';

class TextFilterWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  const TextFilterWidget({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.autovalidateMode,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizeH.s38,
      child: TextFormField(
        expands: true,
        maxLines: null,
        minLines: null,
        autovalidateMode: autovalidateMode,
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.labelSmall,
        cursorColor: ColorManager.darkGrey,
        validator: validator,
        decoration: InputDecoration(
            errorStyle: const TextStyle(
                color: Colors.transparent, fontSize: 0, height: 0),
            counterText: '',
            contentPadding: EdgeInsets.symmetric(horizontal: AppSizeW.s12),
            hintText: hintText ?? '0000',
            hintStyle: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: ColorManager.darkGrey.withOpacity(0.5)),
            filled: true,
            fillColor: ColorManager.whiteSmoke,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: ColorManager.silver),
              borderRadius: BorderRadius.circular(AppSizeR.s5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: ColorManager.silver),
              borderRadius: BorderRadius.circular(AppSizeR.s5),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: ColorManager.silver),
              borderRadius: BorderRadius.circular(AppSizeR.s5),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: ColorManager.red),
              borderRadius: BorderRadius.circular(AppSizeR.s5),
            )),
      ),
    );
  }
}
