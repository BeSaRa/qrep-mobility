import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../domain/models/cms_models/main_menu_models/main_menu_models.dart';
import '../resources/resources.dart';

class MessageNoteWidget extends StatefulWidget {
  final DataSourceMessageModel message;
  const MessageNoteWidget({
    super.key,
    required this.message,
  });

  @override
  State<MessageNoteWidget> createState() => _MessageNoteWidgetState();
}

class _MessageNoteWidgetState extends State<MessageNoteWidget> {
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isShow,
      replacement: SizedBox(height: AppSizeH.s15),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizeW.s20, vertical: AppSizeH.s10),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizeW.s12, vertical: AppSizeH.s5),
          decoration: BoxDecoration(
              color: ColorManager.lightBlue,
              border: Border.all(
                  width: AppSizeSp.s1, color: const Color(0xFFDBD9D9)),
              borderRadius: BorderRadius.circular(AppSizeR.s7)),
          child: Row(
            children: [
              Image(
                  image: const AssetImage(ImageAssets.dbNote),
                  width: AppSizeW.s29,
                  height: AppSizeH.s28),
              SizedBox(width: AppSizeW.s13),
              Expanded(
                child: Text(
                  context.locale == ARABIC_LOCAL
                      ? widget.message.arMessage
                      : widget.message.enMessage,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: ColorManager.golden),
                ),
              ),
              SizedBox(width: AppSizeW.s6),
              InkWell(
                onTap: () {
                  setState(() {
                    isShow = !isShow;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(AppSizeW.s8),
                  child: Icon(
                    Icons.close,
                    color: ColorManager.greyCloud,
                    size: AppSizeH.s12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
