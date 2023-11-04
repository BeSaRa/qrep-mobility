import 'package:flutter/material.dart';

import '../resources/resources.dart';

class TextFilterWidget extends StatelessWidget {
  final TextEditingController controller;
  const TextFilterWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizeH.s38,
      child: TextField(
        expands: true,
        maxLines: null,
        minLines: null,
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: 4,
        style: Theme.of(context).textTheme.labelSmall,
        cursorColor: ColorManager.darkGrey,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.symmetric(horizontal: AppSizeW.s12),
          hintText: '0000',
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
        ),
      ),
    );
  }
}
