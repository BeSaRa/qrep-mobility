import 'package:flutter/material.dart';

import '../../../resources/resources.dart';

class ReraTextFaild extends StatefulWidget {
  final String hint;
  final String? errorMsg;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool readOnly;
  final TextEditingController? controller;
  final dynamic validator;
  final TextInputType? textInputType;
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
    this.isBigFaild,
  });

  @override
  State<ReraTextFaild> createState() => _ReraTextFaildState();
}

class _ReraTextFaildState extends State<ReraTextFaild> {
  late TextEditingController _controller;
  bool _showClearIcon = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_handleTextChange);
  }

  void _handleTextChange() {
    setState(() {
      _showClearIcon = _controller.text.isNotEmpty;
    });
  }

  void _clearText() {
    _controller.clear();
    if (widget.onChange != null) {
      widget.onChange!('');
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      keyboardType: widget.textInputType,
      validator: widget.validator,
      onChanged: widget.onChange,
      cursorColor: ColorManager.grey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      style: TextStyle(
        fontFamily: FontConstants.fontFamily,
        color: Theme.of(context).brightness == Brightness.dark
            ? ColorManager.white
            : ColorManager.textBlack,
        fontSize: AppSizeSp.s15,
        fontWeight: FontWeight.w500,
      ),
      minLines: widget.isBigFaild != null ? 4 : null,
      maxLines: widget.isBigFaild != null ? null : 1,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontWeight: widget.enabled || !widget.readOnly
              ? FontWeight.normal
              : FontWeight.bold,
          fontSize:
              Theme.of(context).textTheme.bodySmall?.fontSize ?? AppSizeW.s14,
          color: Theme.of(context).brightness == Brightness.dark
              ? ColorManager.whiteSmoke
              : widget.enabled
                  ? Theme.of(context).cardColor
                  : Theme.of(context).primaryColor,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizeW.s15,
          vertical: AppSizeH.s8,
        ),
        filled: true,
        fillColor: Theme.of(context).brightness == Brightness.dark
            ? ColorManager.textFieldGrey
            : ColorManager.whiteSmoke,
        errorText: widget.errorMsg,
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: EdgeInsets.all(AppSizeW.s5),
                child: widget.prefixIcon,
              )
            : null,
        suffixIcon: Padding(
          padding: EdgeInsets.all(AppSizeW.s5),
          child: _showClearIcon
              ? GestureDetector(
                  onTap: _clearText,
                  child: const Icon(Icons.close, size: 20),
                )
              : widget.suffixIcon,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizeR.s15),
          borderSide: BorderSide(color: ColorManager.lightSilver, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizeR.s15),
          borderSide: BorderSide(color: ColorManager.lightSilver, width: 0.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizeR.s15),
          borderSide: BorderSide(color: ColorManager.lightSilver, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizeR.s15),
          borderSide: BorderSide(color: ColorManager.lightSilver, width: 0.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizeR.s15),
          borderSide: BorderSide(color: ColorManager.red, width: 0.5),
        ),
      ),
    );
  }
}
