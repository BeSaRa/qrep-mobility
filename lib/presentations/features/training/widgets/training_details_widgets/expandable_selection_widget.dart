import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
class ExpandableSectionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String>? items;
  final String? url;
  final bool isExpanded;
  final bool isLink;
  final VoidCallback? onTap;

  const ExpandableSectionWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.isLink,
    this.items,
    this.url,
    this.isExpanded = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLink && url != null
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
              onTap: onTap,
              borderRadius: BorderRadius.circular(AppSizeR.s8),
              child: Padding(
                padding: EdgeInsets.all(AppSizeW.s10),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: ColorManager.primaryBlue,
                      size: AppSizeSp.s20,
                    ),
                    SizedBox(width: AppSizeW.s5),
                    Text("$title: ",
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: ColorManager.primaryBlue,
                            )),
                    Text(url!,
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            )),
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
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(AppSizeR.s8),
                  child: Padding(
                    padding: EdgeInsets.all(AppSizeW.s10),
                    child: Row(
                      children: [
                        Icon(
                          icon,
                          color: ColorManager.primaryBlue,
                          size: AppSizeSp.s20,
                        ),
                        SizedBox(width: AppSizeW.s5),
                        Expanded(
                          child: Text(title,
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
                          isExpanded
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

              if (isExpanded && items != null) ...[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizeW.s25, vertical: AppSizeH.s5),
                  child: Column(
                    children: items!
                        .map((item) => Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: AppSizeH.s4),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: ColorManager.primary,
                                    size: AppSizeSp.s16,
                                  ),
                                  SizedBox(width: AppSizeW.s8),
                                  Expanded(
                                    child: Text(item,
                                        textAlign: TextAlign.right,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ],
          );
  }
}
