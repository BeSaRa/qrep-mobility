import 'package:flutter/widgets.dart';

class StaggeredGridView extends StatefulWidget {
  final int itemsCount;
  final Widget Function(BuildContext context, int index) gridItemChildBuilder;
  final double rightSectionTopPadding;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  final List<Widget>? stackChildren;
  const StaggeredGridView({
    super.key,
    required this.itemsCount,
    required this.gridItemChildBuilder,
    required this.rightSectionTopPadding,
    this.crossAxisSpacing = 0.0,
    this.mainAxisSpacing = 0.0,
    this.stackChildren,
  });

  @override
  State<StaggeredGridView> createState() => _StaggeredGridViewState();
}

class _StaggeredGridViewState extends State<StaggeredGridView> {
  List<Widget> rightSectionItems = [];
  List<Widget> leftSectionItems = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // we are calling this method here to avoid this exception when using Directionality.of(context):
    // "dependOnInheritedWidgetOfExactType<Directionality>() or dependOnInheritedElement()
    // was called before _StaggeredGridViewState.initState() completed."
    distributeItems();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [...leftSectionItems],
          ),
        ),
        SizedBox(
          width: widget.crossAxisSpacing,
        ),
        Expanded(child: Column(children: [...rightSectionItems])),
      ],
    );
  }

  Future<void> distributeItems() async {
    List<Widget> mainList = List.generate(
        widget.itemsCount,
        (index) => Padding(
              padding: EdgeInsets.only(
                top: getTopPadding(index, widget.itemsCount),
                bottom: getBottomPadding(index, widget.itemsCount),
              ),
              child: widget.gridItemChildBuilder(context, index),
            ));

    for (var i = 0; i < mainList.length; i++) {
      if (i.isEven) {
        rightSectionItems.add(mainList[i]);
      } else {
        leftSectionItems.add(mainList[i]);
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
