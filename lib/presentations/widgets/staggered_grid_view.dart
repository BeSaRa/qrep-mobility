import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:ebla/presentations/widgets/staggered_grid_item_widget.dart';
import 'package:flutter/widgets.dart';

class CustomStaggeredGridView extends StatefulWidget {
  final int itemsCount;
  final Widget Function(BuildContext context, int index) gridItemChildBuilder;
  final double rightSectionTopPadding;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  const CustomStaggeredGridView({
    super.key,
    required this.itemsCount,
    required this.gridItemChildBuilder,
    required this.rightSectionTopPadding,
    this.crossAxisSpacing = 0.0,
    this.mainAxisSpacing = 0.0,
  });

  @override
  State<CustomStaggeredGridView> createState() =>
      _CustomStaggeredGridViewState();
}

class _CustomStaggeredGridViewState extends State<CustomStaggeredGridView> {
  List<Widget> rightSectionItems = [];
  List<Widget> leftSectionItems = [];

  @override
  void initState() {
    super.initState();
    distribute();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [...leftSectionItems],
            ),
            SizedBox(
              width: widget.crossAxisSpacing,
            ),
            Column(children: [...rightSectionItems]),
          ],
        ),
      ),
    );
  }

  Future<void> distribute() async {
    List<Widget> mainList = List.generate(
        widget.itemsCount,
        (index) => Padding(
              padding: EdgeInsets.only(
                top: getTopPadding(index, widget.itemsCount),
                bottom: getBottomPadding(index, widget.itemsCount),
              ),
              child: StaggeredGridItemWidget(
                boxShadow: BoxShadow(
                    color: ColorManager.black.withOpacity(0.06),
                    blurRadius: AppSizeR.s11,
                    spreadRadius: AppSizeR.s2,
                    offset: Offset(AppSizeW.s1, AppSizeH.s1)),
                hasLinearGradient: true,
                child: widget.gridItemChildBuilder(context, index),
              ),
            ));

    for (var i = 0; i < mainList.length; i++) {
      if (i.isEven) {
        leftSectionItems.add(mainList[i]);
      } else {
        rightSectionItems.add(mainList[i]);
      }
    }
  }

  double getTopPadding(int index, int itemsCount) {
    double topPadding = 0.0;
    // first item should not have top padding
    if (index != 0) {
      // first item in the right section should only have rightSectionTopPadding
      if (index == 1) {
        topPadding = widget.rightSectionTopPadding;
      } else {
        topPadding = widget.mainAxisSpacing / 2;
      }
    } else {
      topPadding = 0.0;
    }
    return topPadding;
  }

  double getBottomPadding(int index, int itemsCount) {
    double bottomPadding = 0.0;

    // last and second to last items should not have bottom padding
    if (index == (itemsCount - 1) || index == (itemsCount - 2)) {
      bottomPadding = 0.0;
    } else {
      bottomPadding = widget.mainAxisSpacing / 2;
    }
    return bottomPadding;
  }
}
