import 'package:flutter/material.dart';

class RangeSliderWidget extends StatefulWidget {
  final RangeValues rangeValues;
  final Function(RangeValues rangeValues) onChanged;
  final double min;
  final double max;
  const RangeSliderWidget(
      {super.key,
      required this.rangeValues,
      required this.onChanged,
      required this.min,
      required this.max});

  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  late double start;
  late double end;

  @override
  void initState() {
    super.initState();
    start = widget.rangeValues.start;
    end = widget.rangeValues.end;
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      onChanged: (values) {
        widget.onChanged(RangeValues(values.start, values.end));
        setState(() {
          start = values.start;
          end = values.end;
        });
      },
      values: RangeValues(start, end),
      min: widget.min,
      max: widget.max,
    );
  }
}

class CustomThumbShape extends RangeSliderThumbShape {
  final double thumbRadius;
  final double borderThickness;
  final Color borderColor;

  CustomThumbShape({
    required this.thumbRadius,
    required this.borderThickness,
    required this.borderColor,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius + borderThickness);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool isOnTop = false,
    TextDirection? textDirection,
    required SliderThemeData sliderTheme,
    Thumb thumb = Thumb.start,
    bool isPressed = false,
  }) {
    final Canvas canvas = context.canvas;

    final double radius = thumbRadius + borderThickness;
    final Paint paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill;

    // Paint the border
    canvas.drawCircle(center, radius, paint);

    paint.color = isEnabled
        ? sliderTheme.thumbColor!
        : sliderTheme.disabledThumbColor!; // Adjust colors accordingly
    paint.style = PaintingStyle.fill;

    // Paint the inner circle (thumb)
    canvas.drawCircle(center, thumbRadius, paint);
  }
}

class CustomRangeSliderTrackShape extends RangeSliderTrackShape {
  // rangeTrackHeight is the track between the thumbs
  final double rangeTrackHeight;
  // mainTrackHeight is the track that is behind the rangeTrackHeight
  final double mainTrackHeight;
  final Color betweenThumbsColor;

  CustomRangeSliderTrackShape({
    required this.rangeTrackHeight,
    required this.mainTrackHeight,
    required this.betweenThumbsColor,
  });

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackTop =
        offset.dy + (parentBox.size.height - mainTrackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(0, trackTop, trackWidth, mainTrackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset startThumbCenter,
    required Offset endThumbCenter,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    final Canvas canvas = context.canvas;
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    // Calculate the rect for the track between thumbs
    final Rect betweenThumbsRect = Rect.fromLTRB(
      startThumbCenter.dx,
      trackRect.top - rangeTrackHeight / 2,
      endThumbCenter.dx,
      trackRect.bottom + rangeTrackHeight / 2,
    );

    final Paint paint = Paint()
      ..color = sliderTheme.inactiveTrackColor ??
          Colors.grey // Color outside of thumbs
      ..style = PaintingStyle.fill;

    final Paint betweenThumbsPaint = Paint()
      ..color = betweenThumbsColor // Color between thumbs
      ..style = PaintingStyle.fill;

    canvas.drawRect(trackRect, paint);
    canvas.drawRect(betweenThumbsRect, betweenThumbsPaint);
  }
}
