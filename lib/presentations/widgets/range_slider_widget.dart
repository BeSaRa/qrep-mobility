import 'package:flutter/material.dart';

class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget({super.key});

  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  double min = 1;

  double max = 100;

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      onChanged: (values) {
        setState(() {
          min = values.start;
          max = values.end;
        });
      },
      values: RangeValues(min, max),
      min: 1,
      max: 100,
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
        ? (isPressed ? Colors.grey : sliderTheme.thumbColor!)
        : sliderTheme.disabledThumbColor!; // Adjust colors accordingly
    paint.style = PaintingStyle.fill;

    // Paint the inner circle (thumb)
    canvas.drawCircle(center, thumbRadius, paint);
  }
}

class CustomRangeSliderTrackShape extends RangeSliderTrackShape {
  final double trackHeight;
  final Color betweenThumbsColor;

  CustomRangeSliderTrackShape({
    required this.trackHeight,
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
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(0, trackTop, trackWidth, trackHeight);
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
      trackRect.top,
      endThumbCenter.dx,
      trackRect.bottom,
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
