import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class SearchTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  const SearchTextFieldWidget({
    super.key,
    required this.controller,
  });

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {
        showInkWell = widget.controller.text.isNotEmpty;
      });
    });
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
        decoration: InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: AppSizeW.s12),
            fillColor: ColorManager.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizeR.s25),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizeR.s25),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizeR.s25),
                borderSide: BorderSide.none),
            hintStyle: Theme.of(context).textTheme.labelSmall,
            hintText: 'الدوحة',
            suffixIcon: Visibility(
              visible: showInkWell,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    widget.controller.clear();
                  });
                },
                child: Icon(
                  Icons.close,
                  size: AppSizeSp.s13,
                  color: ColorManager.greyCloud,
                ),
              ),
            )),
      ),
    );
  }
}
