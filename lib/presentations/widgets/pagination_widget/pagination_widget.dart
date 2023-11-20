import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';

class FlutterCustomPagination extends StatelessWidget {
  const FlutterCustomPagination({
    super.key,
    required this.currentPage,
    required this.limitPerPage,
    required this.totalDataCount,
    required this.onPreviousPage,
    this.onBackToFirstPage,
    required this.onNextPage,
    this.onGoToLastPage,
    this.backgroundColor,
    this.textStyle,
    this.previousPageIcon = Icons.keyboard_arrow_left,
    this.nextPageIcon = Icons.keyboard_arrow_right,
    this.backToFirstPageIcon = Icons.first_page,
    this.goToLastPageIcon = Icons.last_page,
  })  : assert(currentPage >= 0, 'currentPage must be greater than 0'),
        assert(limitPerPage > 0, 'limitPerPage must be greater than 0'),
        assert(totalDataCount >= 0,
            'totalDataCount must be greater than or equal to 0');
  final int currentPage;
  final int limitPerPage;
  final int totalDataCount;
  final Function(int) onPreviousPage;

  final Function(int)? onBackToFirstPage;
  final Function(int) onNextPage;
  final Function(int)? onGoToLastPage;

  final Color? backgroundColor;

  final TextStyle? textStyle;
  final IconData? previousPageIcon;

  final IconData? nextPageIcon;

  final IconData? backToFirstPageIcon;
  final IconData? goToLastPageIcon;

  @override
  Widget build(BuildContext context) {
    double fontSize = textStyle?.fontSize ?? 14;
    double iconRatio = 1.5;
    double iconSize = fontSize * iconRatio;
    int lastPage = (totalDataCount / limitPerPage).ceil() <= 0
        ? 1
        : (totalDataCount / limitPerPage).ceil();
    assert(currentPage <= lastPage,
        'currentPage must be less than or equal to the last page number');

    bool hasPrevPage = currentPage > 0;
    bool hasNextPage = currentPage < lastPage - 1;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizeW.s12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // direction: Axis.horizontal,
        // alignment: WrapAlignment.spaceEvenly,
        // runAlignment: WrapAlignment.spaceEvenly,
        // crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Tooltip(
            message: AppStrings().firstPage,
            child: IconButton(
              onPressed: hasPrevPage
                  ? () => (onBackToFirstPage != null
                      ? onBackToFirstPage!(0)
                      : onPreviousPage(0))
                  : null,
              iconSize: AppSizeSp.s18,
              splashRadius: iconSize + 4,
              icon: Icon(backToFirstPageIcon ?? Icons.first_page,
                  color: hasPrevPage
                      ? textStyle?.color
                      : textStyle?.color?.withOpacity(0.5),
                  size: AppSizeSp.s18),
            ),
          ),
          Tooltip(
            message: AppStrings().previousPage,
            child: IconButton(
              onPressed:
                  hasPrevPage ? () => onPreviousPage(currentPage - 1) : null,
              iconSize: AppSizeSp.s18,
              splashRadius: iconSize + 4,
              icon: Icon(previousPageIcon ?? Icons.keyboard_arrow_left,
                  color: hasPrevPage
                      ? textStyle?.color
                      : textStyle?.color?.withOpacity(0.5),
                  size: AppSizeSp.s18),
            ),
          ),
          SizedBox(width: textStyle?.fontSize ?? 14),
          Text(
            '${AppStrings().page} ${currentPage + 1}  ${AppStrings().of} $lastPage',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(width: textStyle?.fontSize ?? 14),
          Tooltip(
            message: AppStrings().nextPage,
            child: IconButton(
              onPressed: hasNextPage ? () => onNextPage(currentPage + 1) : null,
              iconSize: AppSizeSp.s18,
              splashRadius: iconSize + 4,
              icon: Icon(nextPageIcon ?? Icons.keyboard_arrow_right,
                  color: hasNextPage
                      ? textStyle?.color
                      : textStyle?.color?.withOpacity(0.5),
                  size: AppSizeSp.s18),
            ),
          ),
          Tooltip(
            message: AppStrings().lastPage,
            child: IconButton(
              onPressed: hasNextPage
                  ? () => (onGoToLastPage != null
                      ? onGoToLastPage!(lastPage)
                      : onNextPage(lastPage))
                  : null,
              iconSize: AppSizeSp.s18,
              splashRadius: iconSize + 4,
              icon: Icon(goToLastPageIcon ?? Icons.last_page,
                  color: hasNextPage
                      ? textStyle?.color
                      : textStyle?.color?.withOpacity(0.5),
                  size: AppSizeSp.s18),
            ),
          ),
        ],
      ),
    );
  }
}
