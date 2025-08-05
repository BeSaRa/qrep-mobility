import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ExpandableSectionWidget extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<Widget>? items;
  final String? url;
  final bool isExpanded;
  final bool isLink;
  final int index;
  final VoidCallback? onTap;

  const ExpandableSectionWidget({
    Key? key,
    required this.title,
    required this.index,
    required this.icon,
    required this.isLink,
    this.items,
    this.url,
    this.isExpanded = false,
    this.onTap,
  }) : super(key: key);

  @override
  State<ExpandableSectionWidget> createState() =>
      _ExpandableSectionWidgetState();
}

class _ExpandableSectionWidgetState extends State<ExpandableSectionWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return widget.isLink && widget.url != null
        ? Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppSizeW.s16,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ColorManager.textFieldGrey
                  : ColorManager.white,
              borderRadius: BorderRadius.circular(AppSizeR.s10),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.primaryBlue.withValues(alpha: 0.3),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(AppSizeR.s8),
              child: Padding(
                padding: EdgeInsets.all(AppSizeW.s10),
                child: Row(
                  children: [
                    Icon(
                      widget.icon,
                      color: ColorManager.primaryBlue,
                      size: AppSizeSp.s20,
                    ),
                    SizedBox(width: AppSizeW.s5),
                    Text("${widget.title}: ",
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: ColorManager.primaryBlue,
                            )),
                    Flexible(
                      child: Text(widget.url!,
                          textAlign: TextAlign.right,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  )),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppSizeW.s16,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? ColorManager.textFieldGrey
                      : ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSizeR.s10),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.primaryBlue.withValues(alpha: 0.3),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    )
                  ],
                ),
                child: InkWell(
                  onTap: widget.onTap,
                  borderRadius: BorderRadius.circular(AppSizeR.s8),
                  child: Padding(
                    padding: EdgeInsets.all(AppSizeW.s10),
                    child: Row(
                      children: [
                        Icon(
                          widget.icon,
                          color: ColorManager.primaryBlue,
                          size: AppSizeSp.s20,
                        ),
                        SizedBox(width: AppSizeW.s5),
                        Expanded(
                          child: Text(widget.title,
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: ColorManager.primaryBlue,
                                  )),
                        ),
                        SizedBox(width: AppSizeW.s12),
                        Icon(
                          widget.isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: ColorManager.cloudyGrey,
                          size: AppSizeSp.s20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //2

              // if (isExpanded && items != null) ...[
              //   Padding(
              //     padding: EdgeInsets.symmetric(
              //         horizontal: AppSizeW.s25, vertical: AppSizeH.s5),
              //     child: Column(
              //       children: items!
              //           .map((item) => Padding(
              //                 padding:
              //                     EdgeInsets.symmetric(vertical: AppSizeH.s4),
              //                 child: Row(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Icon(
              //                       Icons.check,
              //                       color: ColorManager.primary,
              //                       size: AppSizeSp.s16,
              //                     ),
              //                     SizedBox(width: AppSizeW.s8),
              //                     Expanded(
              //                       child: Text(item,
              //                           textAlign: TextAlign.right,
              //                           style: Theme.of(context)
              //                               .textTheme
              //                               .bodySmall),
              //                     ),
              //                   ],
              //                 ),
              //               ))
              //           .toList(),
              //     ),
              //   ),
              // ],
              if (widget.items != null)
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: Alignment.topCenter,
                  child: widget.isExpanded
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizeW.s25, vertical: AppSizeH.s5),
                          child: widget.index == 3
                              ? Wrap(
                                  spacing: AppSizeW.s10,
                                  children: widget.items!,
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: widget.items!,
                                ),
                        )
                      : const SizedBox(),
                ),
            ],
          );
  }
}

class DocumentItemWidget extends StatelessWidget {
  final String fileName;
  final VoidCallback onView;
  final VoidCallback onDownload;

  const DocumentItemWidget({
    Key? key,
    required this.fileName,
    required this.onView,
    required this.onDownload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSizeH.s6),
      padding: EdgeInsets.all(AppSizeW.s10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: ColorManager.primaryBlue.withValues(alpha: 0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(AppSizeR.s10),
      ),
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onView,
            child: Container(
              padding: EdgeInsets.all(AppSizeW.s5),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(AppSizeR.s5),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.primaryBlue.withValues(alpha: 0.2),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  )
                ],
              ),
              child: Icon(Icons.remove_red_eye_outlined,
                  color: ColorManager.primary),
            ),
          ),
          SizedBox(width: AppSizeW.s10),
          Text(fileName,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
