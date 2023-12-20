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
        cursorColor: ColorManager.textFieldGrey,
        validator: validator,
        decoration: InputDecoration(
            errorStyle: const TextStyle(
                color: Colors.transparent, fontSize: 0, height: 0),
            counterText: '',
            contentPadding: EdgeInsets.symmetric(horizontal: AppSizeW.s12),
            hintText: hintText ?? '0000',
            hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
            filled: true,
            fillColor: Theme.of(context).canvasColor,
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
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: ColorManager.red),
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

class EblaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const EblaAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.transparent],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: Image.asset(
          ImageAssets.appbarBg,
          // height: 400,

          fit: BoxFit.fill,
        ),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.golden,
          )),
      title: FittedBox(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, AppSizeH.s80);
}
