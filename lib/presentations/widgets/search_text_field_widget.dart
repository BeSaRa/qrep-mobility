import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class SearchTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final Function(String) onChange;

  const SearchTextFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.onChange,
  });

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  @override
  void initState() {
    super.initState();
  }

  bool showInkWell = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizeH.s40,
      child: TextField(
        style: Theme.of(context).textTheme.labelSmall,
        cursorColor: ColorManager.darkGrey,
        controller: widget.controller,
        onChanged: widget.onChange,
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: AppSizeW.s12),
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s15),
          ),
          hintStyle: Theme.of(context).textTheme.labelSmall,
          hintText: widget.hint,
        ),
      ),
    );
  }
}
