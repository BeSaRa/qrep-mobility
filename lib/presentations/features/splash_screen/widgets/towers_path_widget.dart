import 'dart:ui' as ui;

import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../resources/routes_manager.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
// size: ui.Size(430, 265),
// painter: RPSCustomPainter(),
// )

class StepByStepPainter extends CustomPainter {
  final List<Path> paths;
  final List<Color> colors;
  final int visibleCount;

  StepByStepPainter({
    required this.paths,
    required this.colors,
    required this.visibleCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < visibleCount && i < paths.length; i++) {
      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = colors[i];
      canvas.drawPath(paths[i], paint);
    }
  }

  @override
  bool shouldRepaint(covariant StepByStepPainter old) {
    return old.visibleCount != visibleCount || old.colors != colors;
  }
}

class PathDrawingAnimation extends StatefulWidget {
  final List<Path> allPaths;
  const PathDrawingAnimation({Key? key, required this.allPaths})
      : super(key: key);

  @override
  _PathDrawingAnimationState createState() => _PathDrawingAnimationState();
}

class _PathDrawingAnimationState extends State<PathDrawingAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<int> _pathIndexAnim;
  late final List<Color> _pathColors;

  @override
  void initState() {
    super.initState();
    // 1. Build your base colors from Theme
    final baseColor = ColorManager.primary;
    _pathColors = List.generate(
      widget.allPaths.length,
      (_) => baseColor.withValues(alpha: 0.6),
    );

    // 2. Controller for stepping through each path
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.allPaths.length * 30),
      vsync: this,
    );

    // 3. Integer animation from 0→N
    _pathIndexAnim = StepTween(begin: 0, end: widget.allPaths.length)
        .animate(_controller)
      ..addListener(() => setState(() {}));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // ✅ Animation finished
        Future.delayed(const Duration(milliseconds: 2000)).then((value) async {
          await initHomeModule();
          context.goNamed(RoutesNames.home);
        });
      }
    });
    // 4. Start it (you can delay until after your other splash steps)
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(430, 265),
      painter: StepByStepPainter(
        paths: widget.allPaths,
        colors: _pathColors,
        visibleCount: _pathIndexAnim.value,
      ),
    );
  }
}

List<Path> buildAllPaths() {
  final allPaths = List<Path>.generate(365, (_) => Path());

  allPaths[0].moveTo(325.47, 122.56);
  allPaths[0].lineTo(321.48, 122.56);
  allPaths[0].lineTo(321.48, 101.4);
  allPaths[0].cubicTo(321.48, 101.16, 321.19, 100.64, 320.87, 100.64);
  allPaths[0].lineTo(318.83, 100.64);
  allPaths[0].lineTo(318.83, 91.57);
  allPaths[0].cubicTo(318.89, 91.57, 318.83, 91.05, 318.83, 91.05);
  allPaths[0].cubicTo(318.74, 91.05, 318.6, 91.05, 318.6, 90.8);
  allPaths[0].lineTo(306.89, 77.44);
  allPaths[0].lineTo(306.89, 72.41);
  allPaths[0].cubicTo(306.89, 72.15, 306.63, 71.78, 306.34, 71.78);
  allPaths[0].lineTo(305.85, 71.78);
  allPaths[0].lineTo(305.85, 66.87);
  allPaths[0].cubicTo(305.85, 66.55, 305.56, 66.24, 305.26, 66.24);
  allPaths[0].cubicTo(305, 66.24, 304.64, 66.55, 304.64, 66.87);
  allPaths[0].lineTo(304.64, 71.78);
  allPaths[0].lineTo(304.28, 71.78);
  allPaths[0].cubicTo(303.93, 71.78, 303.67, 72.15, 303.67, 72.41);
  allPaths[0].lineTo(303.67, 77.44);
  allPaths[0].lineTo(291.87, 90.8);
  allPaths[0].lineTo(291.8, 91.05);
  allPaths[0].cubicTo(291.73, 91.33, 291.73, 91.57, 291.73, 91.57);
  allPaths[0].lineTo(291.73, 100.64);
  allPaths[0].lineTo(289.69, 100.64);
  allPaths[0].cubicTo(289.4, 100.64, 289.04, 101.16, 289.04, 101.4);
  allPaths[0].lineTo(289.04, 122.56);
  allPaths[0].lineTo(285.11, 122.56);
  allPaths[0].cubicTo(284.82, 122.56, 284.56, 122.82, 284.56, 123.07);
  allPaths[0].lineTo(284.56, 235.01);
  allPaths[0].cubicTo(284.56, 235.5, 284.82, 235.76, 285.11, 235.76);
  allPaths[0].lineTo(325.46, 235.76);
  allPaths[0].cubicTo(325.69, 235.76, 325.98, 235.5, 325.98, 235.01);
  allPaths[0].lineTo(325.98, 123.07);
  allPaths[0].cubicTo(325.98, 122.83, 325.69, 122.56, 325.46, 122.56);
  allPaths[0].lineTo(325.47, 122.56);
  allPaths[0].close();

  // Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
  // paint_0_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(allPaths[0], paint_0_fill);

  allPaths[1].moveTo(323, 237.13);
  allPaths[1].lineTo(320.93, 175.9);
  allPaths[1].lineTo(325.09, 175.8);
  allPaths[1].lineTo(323, 237.13);
  allPaths[1].close();

  // Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
  // paint_1_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_1, paint_1_fill);

  allPaths[2].moveTo(308.59, 236.43);
  allPaths[2].lineTo(306.51, 175.91);
  allPaths[2].lineTo(310.68, 175.8);
  allPaths[2].lineTo(308.59, 236.43);
  allPaths[2].close();

  // Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
  // paint_2_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_2, paint_2_fill);

  allPaths[3].moveTo(315.8, 237.17);
  allPaths[3].lineTo(313.73, 175.91);
  allPaths[3].lineTo(317.89, 175.8);
  allPaths[3].lineTo(315.8, 237.17);
  allPaths[3].close();

  // Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
  // paint_3_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_3, paint_3_fill);

  allPaths[4].moveTo(290.11, 235.73);
  allPaths[4].lineTo(288.04, 175.92);
  allPaths[4].lineTo(292.19, 175.8);
  allPaths[4].lineTo(290.11, 235.73);
  allPaths[4].close();

  // Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
  // paint_4_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_4, paint_4_fill);

  allPaths[5].moveTo(284.61, 235.1);
  allPaths[5].lineTo(282.54, 175.92);
  allPaths[5].lineTo(286.7, 175.8);
  allPaths[5].lineTo(284.61, 235.1);
  allPaths[5].close();

  // Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
  // paint_5_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_5, paint_5_fill);

  allPaths[6].moveTo(295.93, 235.94);
  allPaths[6].lineTo(293.85, 175.91);
  allPaths[6].lineTo(298.01, 175.8);
  allPaths[6].lineTo(295.93, 235.94);
  allPaths[6].close();

  // Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
  // paint_6_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_6, paint_6_fill);

  allPaths[7].moveTo(302.08, 235.72);
  allPaths[7].lineTo(300, 175.91);
  allPaths[7].lineTo(304.16, 175.8);
  allPaths[7].lineTo(302.08, 235.72);
  allPaths[7].close();

  // Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
  // paint_7_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_7, paint_7_fill);

  // Path allPaths[8] = Path();
  allPaths[8].moveTo(296.04, 148.68);
  allPaths[8].lineTo(296.84, 59.39);
  allPaths[8].lineTo(295.25, 58.62);
  allPaths[8].lineTo(296.04, 148.68);
  allPaths[8].close();

  // Paint paint_8_fill = Paint()..style = PaintingStyle.fill;
  // paint_8_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(allPaths[8], paint_8_fill);

  // Path path_9 = Path();
  allPaths[9].moveTo(293.05, 150.15);
  allPaths[9].lineTo(293.84, 57.93);
  allPaths[9].lineTo(292.25, 57.15);
  allPaths[9].lineTo(293.05, 150.15);
  allPaths[9].close();

  // Paint paint_9_fill = Paint()..style = PaintingStyle.fill;
  // paint_9_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_9, paint_9_fill);

  allPaths[10].moveTo(290.29, 150.15);
  allPaths[10].lineTo(291.08, 57.93);
  allPaths[10].lineTo(289.49, 57.15);
  allPaths[10].lineTo(290.29, 150.15);
  allPaths[10].close();

  // Paint paint_10_fill = Paint()..style = PaintingStyle.fill;
  // paint_10_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_10, paint_10_fill);

  allPaths[11].moveTo(287.34, 159.61);
  allPaths[11].lineTo(288.13, 67.38);
  allPaths[11].lineTo(286.54, 66.61);
  allPaths[11].lineTo(287.34, 159.61);
  allPaths[11].close();

  // Paint paint_11_fill = Paint()..style = PaintingStyle.fill;
  // paint_11_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_11, paint_11_fill);

  allPaths[12].moveTo(284.68, 162.41);
  allPaths[12].lineTo(285.47, 70.19);
  allPaths[12].lineTo(283.88, 69.41);
  allPaths[12].lineTo(284.68, 162.41);
  allPaths[12].close();

  // Paint paint_12_fill = Paint()..style = PaintingStyle.fill;
  // paint_12_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_12, paint_12_fill);

  allPaths[13].moveTo(301.5, 146);
  allPaths[13].lineTo(302.29, 62.06);
  allPaths[13].lineTo(300.7, 61.28);
  allPaths[13].lineTo(301.5, 146);
  allPaths[13].close();

  // Paint paint_13_fill = Paint()..style = PaintingStyle.fill;
  // paint_13_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_13, paint_13_fill);

  // Path allPaths[14] = Path();
  allPaths[14].moveTo(298.86, 147.3);
  allPaths[14].lineTo(299.65, 60.76);
  allPaths[14].lineTo(298.06, 59.99);
  allPaths[14].lineTo(298.86, 147.3);
  allPaths[14].close();

  // Paint paint_14_fill = Paint()..style = PaintingStyle.fill;
  // paint_14_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_14, paint_14_fill);

  allPaths[15].moveTo(308.57, 142.53);
  allPaths[15].lineTo(309.36, 65.51);
  allPaths[15].lineTo(307.77, 64.73);
  allPaths[15].lineTo(308.57, 142.53);
  allPaths[15].close();

  // Paint paint_15_fill = Paint()..style = PaintingStyle.fill;
  // paint_15_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_15, paint_15_fill);

  allPaths[16].moveTo(310.67, 141.5);
  allPaths[16].lineTo(311.46, 66.53);
  allPaths[16].lineTo(309.87, 65.76);
  allPaths[16].lineTo(310.67, 141.5);
  allPaths[16].close();

  // Paint paint_16_fill = Paint()..style = PaintingStyle.fill;
  // paint_16_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_16, paint_16_fill);

  allPaths[17].moveTo(306.34, 143.62);
  allPaths[17].lineTo(307.14, 64.42);
  allPaths[17].lineTo(305.54, 63.65);
  allPaths[17].lineTo(306.34, 143.62);
  allPaths[17].close();

  // Paint paint_17_fill = Paint()..style = PaintingStyle.fill;
  // paint_17_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_17, paint_17_fill);

  allPaths[18].moveTo(303.99, 144.78);
  allPaths[18].lineTo(304.79, 63.27);
  allPaths[18].lineTo(303.19, 62.49);
  allPaths[18].lineTo(303.99, 144.78);
  allPaths[18].close();

  // Paint paint_18_fill = Paint()..style = PaintingStyle.fill;
  // paint_18_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_18, paint_18_fill);

  allPaths[19].moveTo(312.85, 151.39);
  allPaths[19].lineTo(313.64, 67.45);
  allPaths[19].lineTo(312.05, 66.67);
  allPaths[19].lineTo(312.85, 151.39);
  allPaths[19].close();

  // Paint paint_19_fill = Paint()..style = PaintingStyle.fill;
  // paint_19_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_19, paint_19_fill);

  allPaths[20].moveTo(319.92, 147.92);
  allPaths[20].lineTo(320.71, 70.9);
  allPaths[20].lineTo(319.12, 70.12);
  allPaths[20].lineTo(319.92, 147.92);
  allPaths[20].close();

  // Paint paint_20_fill = Paint()..style = PaintingStyle.fill;
  // paint_20_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_20, paint_20_fill);

  allPaths[21].moveTo(322.02, 146.89);
  allPaths[21].lineTo(322.81, 71.93);
  allPaths[21].lineTo(321.22, 71.15);
  allPaths[21].lineTo(322.02, 146.89);
  allPaths[21].close();

  // Paint paint_21_fill = Paint()..style = PaintingStyle.fill;
  // paint_21_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_21, paint_21_fill);

  allPaths[22].moveTo(324.02, 148.44);
  allPaths[22].lineTo(324.81, 73.4801);
  allPaths[22].lineTo(323.22, 72.7001);
  allPaths[22].lineTo(324.02, 148.44);
  allPaths[22].close();

  // Paint paint_22_fill = Paint()..style = PaintingStyle.fill;
  // paint_22_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_22, paint_22_fill);

  allPaths[23].moveTo(317.69, 149.02);
  allPaths[23].lineTo(318.49, 69.81);
  allPaths[23].lineTo(316.9, 69.04);
  allPaths[23].lineTo(317.69, 149.02);
  allPaths[23].close();

  // Paint paint_23_fill = Paint()..style = PaintingStyle.fill;
  // paint_23_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_23, paint_23_fill);

  allPaths[24].moveTo(315.34, 150.17);
  allPaths[24].lineTo(316.14, 68.67);
  allPaths[24].lineTo(314.54, 67.89);
  allPaths[24].lineTo(315.34, 150.17);
  allPaths[24].close();

  // Paint paint_24_fill = Paint()..style = PaintingStyle.fill;
  // paint_24_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_24, paint_24_fill);

  allPaths[25].moveTo(297.97, 129.44);
  allPaths[25].lineTo(298.7, 195.09);
  allPaths[25].lineTo(299.44, 129.06);
  allPaths[25].lineTo(297.97, 129.44);
  allPaths[25].close();

  // Paint paint_25_fill = Paint()..style = PaintingStyle.fill;
  // paint_25_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(allPaths[25], paint_25_fill);

  allPaths[26].moveTo(302.38, 128.3);
  allPaths[26].lineTo(303.11, 196.17);
  allPaths[26].lineTo(303.85, 127.92);
  allPaths[26].lineTo(302.38, 128.3);
  allPaths[26].close();

  // Paint paint_26_fill = Paint()..style = PaintingStyle.fill;
  // paint_26_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_26, paint_26_fill);

  allPaths[27].moveTo(289.96, 131.52);
  allPaths[27].lineTo(290.69, 193.12);
  allPaths[27].lineTo(291.42, 131.14);
  allPaths[27].lineTo(289.96, 131.52);
  allPaths[27].close();

  // Paint paint_27_fill = Paint()..style = PaintingStyle.fill;
  // paint_27_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_27, paint_27_fill);

  allPaths[28].moveTo(286.15, 132.85);
  allPaths[28].lineTo(286.88, 194.45);
  allPaths[28].lineTo(287.61, 132.47);
  allPaths[28].lineTo(286.15, 132.85);
  allPaths[28].close();

  // Paint paint_28_fill = Paint()..style = PaintingStyle.fill;
  // paint_28_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_28, paint_28_fill);

  allPaths[29].moveTo(293.83, 130.51);
  allPaths[29].lineTo(294.57, 194.07);
  allPaths[29].lineTo(295.3, 130.13);
  allPaths[29].lineTo(293.83, 130.51);
  allPaths[29].close();

  // Paint paint_29_fill = Paint()..style = PaintingStyle.fill;
  // paint_29_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_29, paint_29_fill);

  allPaths[30].moveTo(312.16, 125.76);
  allPaths[30].lineTo(312.9, 198.58);
  allPaths[30].lineTo(313.63, 125.38);
  allPaths[30].lineTo(312.16, 125.76);
  allPaths[30].close();

  // Paint paint_30_fill = Paint()..style = PaintingStyle.fill;
  // paint_30_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_30, paint_30_fill);

  allPaths[31].moveTo(307.1, 127.07);
  allPaths[31].lineTo(307.83, 197.34);
  allPaths[31].lineTo(308.57, 126.69);
  allPaths[31].lineTo(307.1, 127.07);
  allPaths[31].close();

  // Paint paint_31_fill = Paint()..style = PaintingStyle.fill;
  // paint_31_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_31, paint_31_fill);

  allPaths[32].moveTo(323.48, 122.82);
  allPaths[32].lineTo(324.21, 201.37);
  allPaths[32].lineTo(324.94, 122.44);
  allPaths[32].lineTo(323.48, 122.82);
  allPaths[32].close();

  // Paint paint_32_fill = Paint()..style = PaintingStyle.fill;
  // paint_32_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_32, paint_32_fill);

  allPaths[33].moveTo(317.61, 124.34);
  allPaths[33].lineTo(318.34, 199.92);
  allPaths[33].lineTo(319.08, 123.97);
  allPaths[33].lineTo(317.61, 124.34);
  allPaths[33].close();

  // Paint paint_33_fill = Paint()..style = PaintingStyle.fill;
  // paint_33_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_33, paint_33_fill);

  allPaths[34].moveTo(399.26, 166.75);
  allPaths[34].lineTo(399.76, 136);
  allPaths[34].lineTo(398.99, 135.86);
  allPaths[34].lineTo(399.26, 166.75);
  allPaths[34].close();

  // Paint paint_34_fill = Paint()..style = PaintingStyle.fill;
  // paint_34_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_34, paint_34_fill);

  allPaths[35].moveTo(396.18, 167.41);
  allPaths[35].lineTo(396.68, 135.45);
  allPaths[35].lineTo(395.91, 135.31);
  allPaths[35].lineTo(396.18, 167.41);
  allPaths[35].close();

  // Paint paint_35_fill = Paint()..style = PaintingStyle.fill;
  // paint_35_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_35, paint_35_fill);

  allPaths[36].moveTo(402.12, 166.14);
  allPaths[36].lineTo(402.61, 136.51);
  allPaths[36].lineTo(401.85, 136.37);
  allPaths[36].lineTo(402.12, 166.14);
  allPaths[36].close();

  // Paint paint_36_fill = Paint()..style = PaintingStyle.fill;
  // paint_36_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_36, paint_36_fill);

  allPaths[37].moveTo(407.27, 165.04);
  allPaths[37].lineTo(407.75, 137.42);
  allPaths[37].lineTo(406.98, 137.28);
  allPaths[37].lineTo(407.27, 165.04);
  allPaths[37].close();

  // Paint paint_37_fill = Paint()..style = PaintingStyle.fill;
  // paint_37_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_37, paint_37_fill);

  allPaths[38].moveTo(404.78, 165.57);
  allPaths[38].lineTo(405.27, 136.98);
  allPaths[38].lineTo(404.5, 136.84);
  allPaths[38].lineTo(404.78, 165.57);
  allPaths[38].close();

  // Paint paint_38_fill = Paint()..style = PaintingStyle.fill;
  // paint_38_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_38, paint_38_fill);

  allPaths[39].moveTo(337.2, 126.32);
  allPaths[39].lineTo(337.73, 220.86);
  allPaths[39].lineTo(338.26, 125.77);
  allPaths[39].lineTo(337.2, 126.32);
  allPaths[39].close();

  // Paint paint_39_fill = Paint()..style = PaintingStyle.fill;
  // paint_39_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_39, paint_39_fill);

  allPaths[40].moveTo(340.39, 124.67);
  allPaths[40].lineTo(340.92, 222.42);
  allPaths[40].lineTo(341.45, 124.13);
  allPaths[40].lineTo(340.39, 124.67);
  allPaths[40].close();

  // Paint paint_40_fill = Paint()..style = PaintingStyle.fill;
  // paint_40_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_40, paint_40_fill);

  allPaths[41].moveTo(331.4, 129.31);
  allPaths[41].lineTo(331.92, 218.02);
  allPaths[41].lineTo(332.46, 128.77);
  allPaths[41].lineTo(331.4, 129.31);
  allPaths[41].close();

  // Paint paint_41_fill = Paint()..style = PaintingStyle.fill;
  // paint_41_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_41, paint_41_fill);

  allPaths[42].moveTo(334.2, 127.87);
  allPaths[42].lineTo(334.73, 219.39);
  allPaths[42].lineTo(335.26, 127.32);
  allPaths[42].lineTo(334.2, 127.87);
  allPaths[42].close();

  // Paint paint_42_fill = Paint()..style = PaintingStyle.fill;
  // paint_42_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_42, paint_42_fill);

  allPaths[43].moveTo(347.47, 121.02);
  allPaths[43].lineTo(348.01, 225.89);
  allPaths[43].lineTo(348.54, 120.47);
  allPaths[43].lineTo(347.47, 121.02);
  allPaths[43].close();

  // Paint paint_43_fill = Paint()..style = PaintingStyle.fill;
  // paint_43_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_43, paint_43_fill);

  allPaths[44].moveTo(343.81, 122.91);
  allPaths[44].lineTo(344.34, 224.09);
  allPaths[44].lineTo(344.87, 122.36);
  allPaths[44].lineTo(343.81, 122.91);
  allPaths[44].close();

  // Paint paint_44_fill = Paint()..style = PaintingStyle.fill;
  // paint_44_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_44, paint_44_fill);

  allPaths[45].moveTo(355.67, 116.79);
  allPaths[45].lineTo(356.19, 229.9);
  allPaths[45].lineTo(356.73, 116.24);
  allPaths[45].lineTo(355.67, 116.79);
  allPaths[45].close();

  // Paint paint_45_fill = Paint()..style = PaintingStyle.fill;
  // paint_45_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_45, paint_45_fill);

  allPaths[46].moveTo(351.42, 118.98);
  allPaths[46].lineTo(351.95, 227.81);
  allPaths[46].lineTo(352.48, 118.44);
  allPaths[46].lineTo(351.42, 118.98);
  allPaths[46].close();

  // Paint paint_46_fill = Paint()..style = PaintingStyle.fill;
  // paint_46_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_46, paint_46_fill);

  allPaths[47].moveTo(69.18, 235.61);
  allPaths[47].lineTo(69.61, 205.94);
  allPaths[47].lineTo(68.75, 205.8);
  allPaths[47].lineTo(69.18, 235.61);
  allPaths[47].close();

  // Paint paint_47_fill = Paint()..style = PaintingStyle.fill;
  // paint_47_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_47, paint_47_fill);

  allPaths[48].moveTo(69.18, 235.61);
  allPaths[48].lineTo(69.61, 205.94);
  allPaths[48].lineTo(68.75, 205.8);
  allPaths[48].lineTo(69.18, 235.61);
  allPaths[48].close();

  // Paint paint_48_fill = Paint()..style = PaintingStyle.fill;
  // paint_48_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_48, paint_48_fill);

  allPaths[49].moveTo(69.61, 205.8);
  allPaths[49].lineTo(68.75, 205.8);
  allPaths[49].lineTo(68.75, 235.61);
  allPaths[49].lineTo(69.61, 235.61);
  allPaths[49].lineTo(69.61, 205.8);
  allPaths[49].close();

  // Paint paint_49_fill = Paint()..style = PaintingStyle.fill;
  // paint_49_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_49, paint_49_fill);

  allPaths[50].moveTo(69.61, 205.8);
  allPaths[50].lineTo(68.75, 205.8);
  allPaths[50].lineTo(68.75, 235.61);
  allPaths[50].lineTo(69.61, 235.61);
  allPaths[50].lineTo(69.61, 205.8);
  allPaths[50].close();

  // Paint paint_50_fill = Paint()..style = PaintingStyle.fill;
  // paint_50_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_50, paint_50_fill);

  allPaths[51].moveTo(69.61, 205.8);
  allPaths[51].lineTo(68.75, 205.8);
  allPaths[51].lineTo(68.75, 235.61);
  allPaths[51].lineTo(69.61, 235.61);
  allPaths[51].lineTo(69.61, 205.8);
  allPaths[51].close();

  // Paint paint_51_fill = Paint()..style = PaintingStyle.fill;
  // paint_51_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_51, paint_51_fill);

  allPaths[52].moveTo(69.61, 205.8);
  allPaths[52].lineTo(68.75, 205.8);
  allPaths[52].lineTo(68.75, 235.61);
  allPaths[52].lineTo(69.61, 235.61);
  allPaths[52].lineTo(69.61, 205.8);
  allPaths[52].close();

  // Paint paint_52_fill = Paint()..style = PaintingStyle.fill;
  // paint_52_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_52, paint_52_fill);

  allPaths[53].moveTo(69.61, 205.8);
  allPaths[53].lineTo(68.75, 205.8);
  allPaths[53].lineTo(68.75, 235.61);
  allPaths[53].lineTo(69.61, 235.61);
  allPaths[53].lineTo(69.61, 205.8);
  allPaths[53].close();

  // Paint paint_53_fill = Paint()..style = PaintingStyle.fill;
  // paint_53_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_53, paint_53_fill);

  allPaths[54].moveTo(65.7498, 236.26);
  allPaths[54].lineTo(66.1698, 205.42);
  allPaths[54].lineTo(65.3198, 205.29);
  allPaths[54].lineTo(65.7498, 236.26);
  allPaths[54].close();

  // Paint paint_54_fill = Paint()..style = PaintingStyle.fill;
  // paint_54_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_54, paint_54_fill);

  allPaths[55].moveTo(65.7498, 236.26);
  allPaths[55].lineTo(66.1698, 205.42);
  allPaths[55].lineTo(65.3198, 205.29);
  allPaths[55].lineTo(65.7498, 236.26);
  allPaths[55].close();
  //
  // Paint paint_55_fill = Paint()..style = PaintingStyle.fill;
  // paint_55_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_55, paint_55_fill);

  allPaths[56].moveTo(66.1798, 205.29);
  allPaths[56].lineTo(65.3198, 205.29);
  allPaths[56].lineTo(65.3198, 236.26);
  allPaths[56].lineTo(66.1798, 236.26);
  allPaths[56].lineTo(66.1798, 205.29);
  allPaths[56].close();

  // Paint paint_56_fill = Paint()..style = PaintingStyle.fill;
  // paint_56_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_56, paint_56_fill);

  allPaths[57].moveTo(66.1798, 205.29);
  allPaths[57].lineTo(65.3198, 205.29);
  allPaths[57].lineTo(65.3198, 236.26);
  allPaths[57].lineTo(66.1798, 236.26);
  allPaths[57].lineTo(66.1798, 205.29);
  allPaths[57].close();

  // Paint paint_57_fill = Paint()..style = PaintingStyle.fill;
  // paint_57_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_57, paint_57_fill);

  allPaths[58].moveTo(66.1798, 205.29);
  allPaths[58].lineTo(65.3198, 205.29);
  allPaths[58].lineTo(65.3198, 236.26);
  allPaths[58].lineTo(66.1798, 236.26);
  allPaths[58].lineTo(66.1798, 205.29);
  allPaths[58].close();

  // Paint paint_58_fill = Paint()..style = PaintingStyle.fill;
  // paint_58_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_58, paint_58_fill);

  allPaths[59].moveTo(66.1798, 205.29);
  allPaths[59].lineTo(65.3198, 205.29);
  allPaths[59].lineTo(65.3198, 236.26);
  allPaths[59].lineTo(66.1798, 236.26);
  allPaths[59].lineTo(66.1798, 205.29);
  allPaths[59].close();

  // Paint paint_59_fill = Paint()..style = PaintingStyle.fill;
  // paint_59_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_59, paint_59_fill);

  allPaths[60].moveTo(66.1798, 205.29);
  allPaths[60].lineTo(65.3198, 205.29);
  allPaths[60].lineTo(65.3198, 236.26);
  allPaths[60].lineTo(66.1798, 236.26);
  allPaths[60].lineTo(66.1798, 205.29);
  allPaths[60].close();

  // Paint paint_60_fill = Paint()..style = PaintingStyle.fill;
  // paint_60_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_60, paint_60_fill);

  allPaths[61].moveTo(72.3597, 235.01);
  allPaths[61].lineTo(72.7897, 206.42);
  allPaths[61].lineTo(71.9297, 206.29);
  allPaths[61].lineTo(72.3597, 235.01);
  allPaths[61].close();

  // Paint paint_61_fill = Paint()..style = PaintingStyle.fill;
  // paint_61_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_61, paint_61_fill);

  allPaths[62].moveTo(72.3597, 235.01);
  allPaths[62].lineTo(72.7897, 206.42);
  allPaths[62].lineTo(71.9297, 206.29);
  allPaths[62].lineTo(72.3597, 235.01);
  allPaths[62].close();

  // Paint paint_62_fill = Paint()..style = PaintingStyle.fill;
  // paint_62_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_62, paint_62_fill);

  allPaths[63].moveTo(72.7897, 206.29);
  allPaths[63].lineTo(71.9297, 206.29);
  allPaths[63].lineTo(71.9297, 235.02);
  allPaths[63].lineTo(72.7897, 235.02);
  allPaths[63].lineTo(72.7897, 206.29);
  allPaths[63].close();

  // Paint paint_63_fill = Paint()..style = PaintingStyle.fill;
  // paint_63_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_63, paint_63_fill);

  allPaths[64].moveTo(72.7897, 206.29);
  allPaths[64].lineTo(71.9297, 206.29);
  allPaths[64].lineTo(71.9297, 235.02);
  allPaths[64].lineTo(72.7897, 235.02);
  allPaths[64].lineTo(72.7897, 206.29);
  allPaths[64].close();

  // Paint paint_64_fill = Paint()..style = PaintingStyle.fill;
  // paint_64_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_64, paint_64_fill);

  allPaths[65].moveTo(72.7897, 206.29);
  allPaths[65].lineTo(71.9297, 206.29);
  allPaths[65].lineTo(71.9297, 235.02);
  allPaths[65].lineTo(72.7897, 235.02);
  allPaths[65].lineTo(72.7897, 206.29);
  allPaths[65].close();

  // Paint paint_65_fill = Paint()..style = PaintingStyle.fill;
  // paint_65_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_65, paint_65_fill);

  allPaths[66].moveTo(72.7897, 206.29);
  allPaths[66].lineTo(71.9297, 206.29);
  allPaths[66].lineTo(71.9297, 235.02);
  allPaths[66].lineTo(72.7897, 235.02);
  allPaths[66].lineTo(72.7897, 206.29);
  allPaths[66].close();

  // Paint paint_66_fill = Paint()..style = PaintingStyle.fill;
  // paint_66_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_66, paint_66_fill);

  allPaths[67].moveTo(72.7897, 206.29);
  allPaths[67].lineTo(71.9297, 206.29);
  allPaths[67].lineTo(71.9297, 235.02);
  allPaths[67].lineTo(72.7897, 235.02);
  allPaths[67].lineTo(72.7897, 206.29);
  allPaths[67].close();

  // Paint paint_67_fill = Paint()..style = PaintingStyle.fill;
  // paint_67_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_67, paint_67_fill);

  allPaths[68].moveTo(78.0799, 233.94);
  allPaths[68].lineTo(78.5099, 207.28);
  allPaths[68].lineTo(77.6499, 207.15);
  allPaths[68].lineTo(78.0799, 233.94);
  allPaths[68].close();

  // Paint paint_68_fill = Paint()..style = PaintingStyle.fill;
  // paint_68_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_68, paint_68_fill);

  allPaths[69].moveTo(78.0799, 233.94);
  allPaths[69].lineTo(78.5099, 207.28);
  allPaths[69].lineTo(77.6499, 207.15);
  allPaths[69].lineTo(78.0799, 233.94);
  allPaths[69].close();

  // Paint paint_69_fill = Paint()..style = PaintingStyle.fill;
  // paint_69_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_69, paint_69_fill);

  allPaths[70].moveTo(78.5099, 207.15);
  allPaths[70].lineTo(77.6499, 207.15);
  allPaths[70].lineTo(77.6499, 233.93);
  allPaths[70].lineTo(78.5099, 233.93);
  allPaths[70].lineTo(78.5099, 207.15);
  allPaths[70].close();

  // Paint paint_70_fill = Paint()..style = PaintingStyle.fill;
  // paint_70_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_70, paint_70_fill);

  allPaths[71].moveTo(78.5099, 207.15);
  allPaths[71].lineTo(77.6499, 207.15);
  allPaths[71].lineTo(77.6499, 233.93);
  allPaths[71].lineTo(78.5099, 233.93);
  allPaths[71].lineTo(78.5099, 207.15);
  allPaths[71].close();

  // Paint paint_71_fill = Paint()..style = PaintingStyle.fill;
  // paint_71_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_71, paint_71_fill);

  allPaths[72].moveTo(78.5099, 207.15);
  allPaths[72].lineTo(77.6499, 207.15);
  allPaths[72].lineTo(77.6499, 233.93);
  allPaths[72].lineTo(78.5099, 233.93);
  allPaths[72].lineTo(78.5099, 207.15);
  allPaths[72].close();

  // Paint paint_72_fill = Paint()..style = PaintingStyle.fill;
  // paint_72_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_72, paint_72_fill);

  allPaths[73].moveTo(78.5099, 207.15);
  allPaths[73].lineTo(77.6499, 207.15);
  allPaths[73].lineTo(77.6499, 233.93);
  allPaths[73].lineTo(78.5099, 233.93);
  allPaths[73].lineTo(78.5099, 207.15);
  allPaths[73].close();

  // Paint paint_73_fill = Paint()..style = PaintingStyle.fill;
  // paint_73_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_73, paint_73_fill);

  allPaths[74].moveTo(78.5099, 207.15);
  allPaths[74].lineTo(77.6499, 207.15);
  allPaths[74].lineTo(77.6499, 233.93);
  allPaths[74].lineTo(78.5099, 233.93);
  allPaths[74].lineTo(78.5099, 207.15);
  allPaths[74].close();

  // Paint paint_74_fill = Paint()..style = PaintingStyle.fill;
  // paint_74_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_74, paint_74_fill);

  allPaths[75].moveTo(75.3196, 234.46);
  allPaths[75].lineTo(75.7496, 206.86);
  allPaths[75].lineTo(74.8896, 206.73);
  allPaths[75].lineTo(75.3196, 234.46);
  allPaths[75].close();

  // Paint paint_75_fill = Paint()..style = PaintingStyle.fill;
  // paint_75_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_75, paint_75_fill);

  allPaths[76].moveTo(75.3196, 234.46);
  allPaths[76].lineTo(75.7496, 206.86);
  allPaths[76].lineTo(74.8896, 206.73);
  allPaths[76].lineTo(75.3196, 234.46);
  allPaths[76].close();

  // Paint paint_76_fill = Paint()..style = PaintingStyle.fill;
  // paint_76_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_76, paint_76_fill);

  allPaths[77].moveTo(75.7496, 206.73);
  allPaths[77].lineTo(74.8896, 206.73);
  allPaths[77].lineTo(74.8896, 234.45);
  allPaths[77].lineTo(75.7496, 234.45);
  allPaths[77].lineTo(75.7496, 206.73);
  allPaths[77].close();

  // Paint paint_77_fill = Paint()..style = PaintingStyle.fill;
  // paint_77_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_77, paint_77_fill);

  allPaths[78].moveTo(75.7496, 206.73);
  allPaths[78].lineTo(74.8896, 206.73);
  allPaths[78].lineTo(74.8896, 234.45);
  allPaths[78].lineTo(75.7496, 234.45);
  allPaths[78].lineTo(75.7496, 206.73);
  allPaths[78].close();
  //
  // Paint paint_78_fill = Paint()..style = PaintingStyle.fill;
  // paint_78_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_78, paint_78_fill);

  allPaths[79].moveTo(75.7496, 206.73);
  allPaths[79].lineTo(74.8896, 206.73);
  allPaths[79].lineTo(74.8896, 234.45);
  allPaths[79].lineTo(75.7496, 234.45);
  allPaths[79].lineTo(75.7496, 206.73);
  allPaths[79].close();

  // Paint paint_79_fill = Paint()..style = PaintingStyle.fill;
  // paint_79_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_79, paint_79_fill);

  allPaths[80].moveTo(75.7496, 206.73);
  allPaths[80].lineTo(74.8896, 206.73);
  allPaths[80].lineTo(74.8896, 234.45);
  allPaths[80].lineTo(75.7496, 234.45);
  allPaths[80].lineTo(75.7496, 206.73);
  allPaths[80].close();

  // Paint paint_80_fill = Paint()..style = PaintingStyle.fill;
  // paint_80_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_80, paint_80_fill);

  allPaths[81].moveTo(75.7496, 206.73);
  allPaths[81].lineTo(74.8896, 206.73);
  allPaths[81].lineTo(74.8896, 234.45);
  allPaths[81].lineTo(75.7496, 234.45);
  allPaths[81].lineTo(75.7496, 206.73);
  allPaths[81].close();

  // Paint paint_81_fill = Paint()..style = PaintingStyle.fill;
  // paint_81_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_81, paint_81_fill);

  allPaths[82].moveTo(227.51, 234.35);
  allPaths[82].lineTo(227.9, 216.81);
  allPaths[82].lineTo(227.24, 216.73);
  allPaths[82].lineTo(227.51, 234.35);
  allPaths[82].close();

  // Paint paint_82_fill = Paint()..style = PaintingStyle.fill;
  // paint_82_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_82, paint_82_fill);

  allPaths[83].moveTo(227.51, 234.35);
  allPaths[83].lineTo(227.9, 216.81);
  allPaths[83].lineTo(227.24, 216.73);
  allPaths[83].lineTo(227.51, 234.35);
  allPaths[83].close();

  // Paint paint_83_fill = Paint()..style = PaintingStyle.fill;
  // paint_83_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_83, paint_83_fill);

  allPaths[84].moveTo(227.289, 216.75);
  allPaths[84].lineTo(227.225, 234.37);
  allPaths[84].lineTo(227.885, 234.372);
  allPaths[84].lineTo(227.949, 216.752);
  allPaths[84].lineTo(227.289, 216.75);
  allPaths[84].close();

  // Paint paint_84_fill = Paint()..style = PaintingStyle.fill;
  // paint_84_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_84, paint_84_fill);

  allPaths[85].moveTo(227.289, 216.75);
  allPaths[85].lineTo(227.225, 234.37);
  allPaths[85].lineTo(227.885, 234.372);
  allPaths[85].lineTo(227.949, 216.752);
  allPaths[85].lineTo(227.289, 216.75);
  allPaths[85].close();

  // Paint paint_85_fill = Paint()..style = PaintingStyle.fill;
  // paint_85_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_85, paint_85_fill);

  allPaths[86].moveTo(227.289, 216.75);
  allPaths[86].lineTo(227.225, 234.37);
  allPaths[86].lineTo(227.885, 234.372);
  allPaths[86].lineTo(227.949, 216.752);
  allPaths[86].lineTo(227.289, 216.75);
  allPaths[86].close();

  // Paint paint_86_fill = Paint()..style = PaintingStyle.fill;
  // paint_86_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_86, paint_86_fill);

  allPaths[87].moveTo(227.289, 216.75);
  allPaths[87].lineTo(227.225, 234.37);
  allPaths[87].lineTo(227.885, 234.372);
  allPaths[87].lineTo(227.949, 216.752);
  allPaths[87].lineTo(227.289, 216.75);
  allPaths[87].close();

  // Paint paint_87_fill = Paint()..style = PaintingStyle.fill;
  // paint_87_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_87, paint_87_fill);

  allPaths[88].moveTo(227.289, 216.75);
  allPaths[88].lineTo(227.225, 234.37);
  allPaths[88].lineTo(227.885, 234.372);
  allPaths[88].lineTo(227.949, 216.752);
  allPaths[88].lineTo(227.289, 216.75);
  allPaths[88].close();

  // Paint paint_88_fill = Paint()..style = PaintingStyle.fill;
  // paint_88_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_88, paint_88_fill);

  allPaths[89].moveTo(224.87, 234.72);
  allPaths[89].lineTo(225.27, 216.49);
  allPaths[89].lineTo(224.61, 216.42);
  allPaths[89].lineTo(224.87, 234.72);
  allPaths[89].close();

  // Paint paint_89_fill = Paint()..style = PaintingStyle.fill;
  // paint_89_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_89, paint_89_fill);

  allPaths[90].moveTo(224.87, 234.72);
  allPaths[90].lineTo(225.27, 216.49);
  allPaths[90].lineTo(224.61, 216.42);
  allPaths[90].lineTo(224.87, 234.72);
  allPaths[90].close();

  // Paint paint_90_fill = Paint()..style = PaintingStyle.fill;
  // paint_90_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_90, paint_90_fill);

  allPaths[91].moveTo(224.651, 216.43);
  allPaths[91].lineTo(224.584, 234.74);
  allPaths[91].lineTo(225.244, 234.742);
  allPaths[91].lineTo(225.311, 216.432);
  allPaths[91].lineTo(224.651, 216.43);
  allPaths[91].close();

  // Paint paint_91_fill = Paint()..style = PaintingStyle.fill;
  // paint_91_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_91, paint_91_fill);

  allPaths[92].moveTo(224.651, 216.43);
  allPaths[92].lineTo(224.584, 234.74);
  allPaths[92].lineTo(225.244, 234.742);
  allPaths[92].lineTo(225.311, 216.432);
  allPaths[92].lineTo(224.651, 216.43);
  allPaths[92].close();

  // Paint paint_92_fill = Paint()..style = PaintingStyle.fill;
  // paint_92_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_92, paint_92_fill);

  allPaths[93].moveTo(224.651, 216.43);
  allPaths[93].lineTo(224.584, 234.74);
  allPaths[93].lineTo(225.244, 234.742);
  allPaths[93].lineTo(225.311, 216.432);
  allPaths[93].lineTo(224.651, 216.43);
  allPaths[93].close();

  // Paint paint_93_fill = Paint()..style = PaintingStyle.fill;
  // paint_93_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_93, paint_93_fill);

  allPaths[94].moveTo(224.651, 216.43);
  allPaths[94].lineTo(224.584, 234.74);
  allPaths[94].lineTo(225.244, 234.742);
  allPaths[94].lineTo(225.311, 216.432);
  allPaths[94].lineTo(224.651, 216.43);
  allPaths[94].close();

  // Paint paint_94_fill = Paint()..style = PaintingStyle.fill;
  // paint_94_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_94, paint_94_fill);

  allPaths[95].moveTo(224.651, 216.43);
  allPaths[95].lineTo(224.584, 234.74);
  allPaths[95].lineTo(225.244, 234.742);
  allPaths[95].lineTo(225.311, 216.432);
  allPaths[95].lineTo(224.651, 216.43);
  allPaths[95].close();

  // Paint paint_95_fill = Paint()..style = PaintingStyle.fill;
  // paint_95_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_95, paint_95_fill);

  allPaths[96].moveTo(229.96, 234);
  allPaths[96].lineTo(230.34, 217.1);
  allPaths[96].lineTo(229.69, 217.03);
  allPaths[96].lineTo(229.96, 234);
  allPaths[96].close();

  // Paint paint_96_fill = Paint()..style = PaintingStyle.fill;
  // paint_96_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(allPaths[96], paint_96_fill);

  allPaths[97].moveTo(229.96, 234);
  allPaths[97].lineTo(230.34, 217.1);
  allPaths[97].lineTo(229.69, 217.03);
  allPaths[97].lineTo(229.96, 234);
  allPaths[97].close();

  // Paint paint_97_fill = Paint()..style = PaintingStyle.fill;
  // paint_97_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_97, paint_97_fill);

  allPaths[98].moveTo(229.737, 217.039);
  allPaths[98].lineTo(229.675, 234.019);
  allPaths[98].lineTo(230.335, 234.022);
  allPaths[98].lineTo(230.397, 217.042);
  allPaths[98].lineTo(229.737, 217.039);
  allPaths[98].close();
  //
  // Paint paint_98_fill = Paint()..style = PaintingStyle.fill;
  // paint_98_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_98, paint_98_fill);

  allPaths[99].moveTo(229.737, 217.039);
  allPaths[99].lineTo(229.675, 234.019);
  allPaths[99].lineTo(230.335, 234.022);
  allPaths[99].lineTo(230.397, 217.042);
  allPaths[99].lineTo(229.737, 217.039);
  allPaths[99].close();

  // Paint paint_99_fill = Paint()..style = PaintingStyle.fill;
  // paint_99_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_99, paint_99_fill);

  allPaths[100].moveTo(229.737, 217.039);
  allPaths[100].lineTo(229.675, 234.019);
  allPaths[100].lineTo(230.335, 234.022);
  allPaths[100].lineTo(230.397, 217.042);
  allPaths[100].lineTo(229.737, 217.039);
  allPaths[100].close();

  // Paint paint_100_fill = Paint()..style = PaintingStyle.fill;
  // paint_100_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_100, paint_100_fill);

  allPaths[101].moveTo(229.737, 217.039);
  allPaths[101].lineTo(229.675, 234.019);
  allPaths[101].lineTo(230.335, 234.022);
  allPaths[101].lineTo(230.397, 217.042);
  allPaths[101].lineTo(229.737, 217.039);
  allPaths[101].close();

  // Paint paint_101_fill = Paint()..style = PaintingStyle.fill;
  // paint_101_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_101, paint_101_fill);

  allPaths[102].moveTo(229.737, 217.039);
  allPaths[102].lineTo(229.675, 234.019);
  allPaths[102].lineTo(230.335, 234.022);
  allPaths[102].lineTo(230.397, 217.042);
  allPaths[102].lineTo(229.737, 217.039);
  allPaths[102].close();

  // Paint paint_102_fill = Paint()..style = PaintingStyle.fill;
  // paint_102_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_102, paint_102_fill);

  allPaths[103].moveTo(234.35, 233.38);
  allPaths[103].lineTo(234.74, 217.63);
  allPaths[103].lineTo(234.08, 217.55);
  allPaths[103].lineTo(234.35, 233.38);
  allPaths[103].close();

  // Paint paint_103_fill = Paint()..style = PaintingStyle.fill;
  // paint_103_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_103, paint_103_fill);

  allPaths[104].moveTo(234.35, 233.38);
  allPaths[104].lineTo(234.74, 217.63);
  allPaths[104].lineTo(234.08, 217.55);
  allPaths[104].lineTo(234.35, 233.38);
  allPaths[104].close();

  // Paint paint_104_fill = Paint()..style = PaintingStyle.fill;
  // paint_104_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_104, paint_104_fill);

  allPaths[105].moveTo(234.121, 217.569);
  allPaths[105].lineTo(234.063, 233.399);
  allPaths[105].lineTo(234.723, 233.402);
  allPaths[105].lineTo(234.781, 217.572);
  allPaths[105].lineTo(234.121, 217.569);
  allPaths[105].close();

  // Paint paint_105_fill = Paint()..style = PaintingStyle.fill;
  // paint_105_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_105, paint_105_fill);

  allPaths[106].moveTo(234.121, 217.569);
  allPaths[106].lineTo(234.063, 233.399);
  allPaths[106].lineTo(234.723, 233.402);
  allPaths[106].lineTo(234.781, 217.572);
  allPaths[106].lineTo(234.121, 217.569);
  allPaths[106].close();

  // Paint paint_106_fill = Paint()..style = PaintingStyle.fill;
  // paint_106_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_106, paint_106_fill);

  allPaths[107].moveTo(234.121, 217.569);
  allPaths[107].lineTo(234.063, 233.399);
  allPaths[107].lineTo(234.723, 233.402);
  allPaths[107].lineTo(234.781, 217.572);
  allPaths[107].lineTo(234.121, 217.569);
  allPaths[107].close();

  // Paint paint_107_fill = Paint()..style = PaintingStyle.fill;
  // paint_107_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_107, paint_107_fill);

  allPaths[108].moveTo(234.121, 217.569);
  allPaths[108].lineTo(234.063, 233.399);
  allPaths[108].lineTo(234.723, 233.402);
  allPaths[108].lineTo(234.781, 217.572);
  allPaths[108].lineTo(234.121, 217.569);
  allPaths[108].close();

  // Paint paint_108_fill = Paint()..style = PaintingStyle.fill;
  // paint_108_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_108, paint_108_fill);

  allPaths[109].moveTo(234.121, 217.569);
  allPaths[109].lineTo(234.063, 233.399);
  allPaths[109].lineTo(234.723, 233.402);
  allPaths[109].lineTo(234.781, 217.572);
  allPaths[109].lineTo(234.121, 217.569);
  allPaths[109].close();

  // Paint paint_109_fill = Paint()..style = PaintingStyle.fill;
  // paint_109_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_109, paint_109_fill);

  allPaths[110].moveTo(232.23, 233.68);
  allPaths[110].lineTo(232.62, 217.38);
  allPaths[110].lineTo(231.96, 217.3);
  allPaths[110].lineTo(232.23, 233.68);
  allPaths[110].close();
  //
  // Paint paint_110_fill = Paint()..style = PaintingStyle.fill;
  // paint_110_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_110, paint_110_fill);

  allPaths[111].moveTo(232.23, 233.68);
  allPaths[111].lineTo(232.62, 217.38);
  allPaths[111].lineTo(231.96, 217.3);
  allPaths[111].lineTo(232.23, 233.68);
  allPaths[111].close();

  // Paint paint_111_fill = Paint()..style = PaintingStyle.fill;
  // paint_111_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_111, paint_111_fill);

  allPaths[112].moveTo(232.004, 217.319);
  allPaths[112].lineTo(231.944, 233.699);
  allPaths[112].lineTo(232.604, 233.702);
  allPaths[112].lineTo(232.664, 217.322);
  allPaths[112].lineTo(232.004, 217.319);
  allPaths[112].close();

  // Paint paint_112_fill = Paint()..style = PaintingStyle.fill;
  // paint_112_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_112, paint_112_fill);

  allPaths[113].moveTo(232.004, 217.319);
  allPaths[113].lineTo(231.944, 233.699);
  allPaths[113].lineTo(232.604, 233.702);
  allPaths[113].lineTo(232.664, 217.322);
  allPaths[113].lineTo(232.004, 217.319);
  allPaths[113].close();

  // Paint paint_113_fill = Paint()..style = PaintingStyle.fill;
  // paint_113_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_113, paint_113_fill);

  allPaths[114].moveTo(232.004, 217.319);
  allPaths[114].lineTo(231.944, 233.699);
  allPaths[114].lineTo(232.604, 233.702);
  allPaths[114].lineTo(232.664, 217.322);
  allPaths[114].lineTo(232.004, 217.319);
  allPaths[114].close();

  // Paint paint_114_fill = Paint()..style = PaintingStyle.fill;
  // paint_114_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_114, paint_114_fill);

  allPaths[115].moveTo(232.004, 217.319);
  allPaths[115].lineTo(231.944, 233.699);
  allPaths[115].lineTo(232.604, 233.702);
  allPaths[115].lineTo(232.664, 217.322);
  allPaths[115].lineTo(232.004, 217.319);
  allPaths[115].close();

  // Paint paint_115_fill = Paint()..style = PaintingStyle.fill;
  // paint_115_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_115, paint_115_fill);

  allPaths[116].moveTo(232.004, 217.319);
  allPaths[116].lineTo(231.944, 233.699);
  allPaths[116].lineTo(232.604, 233.702);
  allPaths[116].lineTo(232.664, 217.322);
  allPaths[116].lineTo(232.004, 217.319);
  allPaths[116].close();

  // Paint paint_116_fill = Paint()..style = PaintingStyle.fill;
  // paint_116_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_116, paint_116_fill);

  allPaths[117].moveTo(429.011, 164.34);
  allPaths[117].lineTo(429.631, 203.04);
  allPaths[117].lineTo(430.541, 164.35);
  allPaths[117].lineTo(429.011, 164.34);
  allPaths[117].close();

  // Paint paint_117_fill = Paint()..style = PaintingStyle.fill;
  // paint_117_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_117, paint_117_fill);

  allPaths[118].moveTo(418.21, 165.27);
  allPaths[118].lineTo(418.84, 199.22);
  allPaths[118].lineTo(419.73, 165.14);
  allPaths[118].lineTo(418.21, 165.27);
  allPaths[118].close();

  // Paint paint_118_fill = Paint()..style = PaintingStyle.fill;
  // paint_118_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_118, paint_118_fill);

  allPaths[119].moveTo(415.15, 165.53);
  allPaths[119].lineTo(415.79, 198.14);
  allPaths[119].lineTo(416.67, 165.4);
  allPaths[119].lineTo(415.15, 165.53);
  allPaths[119].close();

  // Paint paint_119_fill = Paint()..style = PaintingStyle.fill;
  // paint_119_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_119, paint_119_fill);

  allPaths[120].moveTo(421.521, 164.99);
  allPaths[120].lineTo(422.151, 200.39);
  allPaths[120].lineTo(423.04, 164.85);
  allPaths[120].lineTo(421.521, 164.99);
  allPaths[120].close();

  // Paint paint_120_fill = Paint()..style = PaintingStyle.fill;
  // paint_120_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_120, paint_120_fill);

  allPaths[121].moveTo(425.101, 164.68);
  allPaths[121].lineTo(425.731, 201.66);
  allPaths[121].lineTo(426.631, 164.55);
  allPaths[121].lineTo(425.101, 164.68);
  allPaths[121].close();

  // Paint paint_121_fill = Paint()..style = PaintingStyle.fill;
  // paint_121_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_121, paint_121_fill);

  allPaths[122].moveTo(274.29, 131.27);
  allPaths[122].lineTo(274.4, 131.27);
  allPaths[122].lineTo(274.43, 131.02);
  allPaths[122].lineTo(274.45, 131.02);
  allPaths[122].lineTo(274.45, 130.9);
  allPaths[122].lineTo(277.55, 107.18);
  allPaths[122].lineTo(277.39, 107.18);
  allPaths[122].cubicTo(277.34, 107.05, 274.18, 106.44, 274.18, 106.44);
  allPaths[122].lineTo(274.18, 90.74);
  allPaths[122].cubicTo(274.24, 90.66, 274.26, 90.57, 274.3, 90.48);
  allPaths[122].lineTo(277.55, 66.38);
  allPaths[122].lineTo(277.39, 66.38);
  allPaths[122].cubicTo(277.34, 66.25, 277.28, 66.12, 277.19, 66.01);
  allPaths[122].cubicTo(276.98, 65.77, 274.18, 65.64, 274.18, 65.64);
  allPaths[122].lineTo(274.18, 38.87);
  allPaths[122].lineTo(274.06, 38.87);
  allPaths[122].cubicTo(273.91, 38.45, 262.41, 38.13, 262.41, 38.13);
  allPaths[122].cubicTo(261.99, 38.13, 261.59, 38.38, 261.42, 38.77);
  allPaths[122].lineTo(253.49, 56.06);
  allPaths[122].lineTo(245.07, 38.74);
  allPaths[122].cubicTo(244.94, 38.49, 232.36, 38.62, 232.36, 39.22);
  allPaths[122].lineTo(232.36, 65.63);
  allPaths[122].cubicTo(232.36, 65.63, 229.38, 65.77, 229.18, 66.01);
  allPaths[122].cubicTo(228.97, 66.25, 228.88, 66.56, 228.92, 66.87);
  allPaths[122].cubicTo(228.92, 66.87, 232.15, 90.78, 232.37, 90.95);
  allPaths[122].lineTo(232.37, 106.42);
  allPaths[122].cubicTo(232.37, 106.42, 228.88, 107.34, 228.92, 107.66);
  allPaths[122].lineTo(231.98, 131.04);
  allPaths[122].cubicTo(232.01, 131.32, 232.15, 131.57, 232.37, 131.75);
  allPaths[122].lineTo(232.37, 145.12);
  allPaths[122].cubicTo(232.37, 145.12, 228.88, 146.04, 228.92, 146.35);
  allPaths[122].lineTo(231.98, 169.73);
  allPaths[122].cubicTo(232.01, 170.01, 232.15, 170.26, 232.37, 170.44);
  allPaths[122].lineTo(232.37, 233.74);
  allPaths[122].cubicTo(232.37, 234.34, 232.86, 234.84, 233.46, 234.84);
  allPaths[122].lineTo(273.06, 234.84);
  allPaths[122].cubicTo(273.54, 234.84, 273.93, 234.53, 274.08, 234.1);
  allPaths[122].lineTo(274.2, 234.1);
  allPaths[122].lineTo(274.2, 170.21);
  allPaths[122].cubicTo(274.26, 170.13, 274.28, 170.04, 274.31, 169.95);
  allPaths[122].lineTo(274.42, 169.95);
  allPaths[122].lineTo(277.57, 145.85);
  allPaths[122].lineTo(277.41, 145.85);
  allPaths[122].cubicTo(277.37, 145.72, 277.3, 145.59, 277.21, 145.48);
  allPaths[122].cubicTo(277, 145.24, 274.2, 145.11, 274.2, 145.11);
  allPaths[122].lineTo(274.2, 131.51);
  allPaths[122].cubicTo(274.26, 131.43, 274.29, 131.34, 274.32, 131.25);
  allPaths[122].lineTo(274.29, 131.27);
  allPaths[122].close();

  // Paint paint_122_fill = Paint()..style = PaintingStyle.fill;
  // paint_122_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_122, paint_122_fill);

  allPaths[123].moveTo(272.5, 243.57);
  allPaths[123].cubicTo(272.18, 172.68, 271.87, 101.82, 271.55, 30.98);
  allPaths[123].cubicTo(272.19, 31.01, 272.82, 31.15, 273.44, 31.39);
  allPaths[123].cubicTo(273.12, 102.08, 272.81, 172.81, 272.49, 243.57);
  allPaths[123].lineTo(272.5, 243.57);
  allPaths[123].close();

  // Paint paint_123_fill = Paint()..style = PaintingStyle.fill;
  // paint_123_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_123, paint_123_fill);

  allPaths[124].moveTo(276.01, 252.36);
  allPaths[124].cubicTo(275.71, 178.97, 275.4, 105.6, 275.1, 32.25);
  allPaths[124].cubicTo(275.72, 32.67, 276.33, 33.2, 276.93, 33.82);
  allPaths[124].cubicTo(276.63, 106.64, 276.32, 179.49, 276.02, 252.36);
  allPaths[124].lineTo(276.01, 252.36);
  allPaths[124].close();

  // Paint paint_124_fill = Paint()..style = PaintingStyle.fill;
  // paint_124_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_124, paint_124_fill);

  allPaths[125].moveTo(265.89, 236.89);
  allPaths[125].cubicTo(265.57, 170.57, 265.24, 100.52, 264.92, 34.2699);
  allPaths[125].cubicTo(265.57, 33.5999, 266.22, 33.0199, 266.87, 32.5499);
  allPaths[125].cubicTo(266.54, 99.3899, 266.22, 170, 265.89, 236.89);
  allPaths[125].close();

  // Paint paint_125_fill = Paint()..style = PaintingStyle.fill;
  // paint_125_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_125, paint_125_fill);

  allPaths[126].moveTo(269.12, 237.29);
  allPaths[126].cubicTo(268.8, 168.75, 268.48, 100.25, 268.16, 31.77);
  allPaths[126].cubicTo(268.81, 31.44, 269.45, 31.22, 270.09, 31.09);
  allPaths[126].cubicTo(269.77, 99.81, 269.45, 168.54, 269.12, 237.29);
  allPaths[126].close();

  // Paint paint_126_fill = Paint()..style = PaintingStyle.fill;
  // paint_126_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_126, paint_126_fill);

  allPaths[127].moveTo(257.34, 235.36);
  allPaths[127].cubicTo(257.03, 174.96, 256.72, 109.58, 256.41, 49.2399);
  allPaths[127].cubicTo(257.03, 47.6599, 257.65, 46.1799, 258.28, 44.8199);
  allPaths[127].cubicTo(257.97, 106.64, 257.65, 173.49, 257.33, 235.37);
  allPaths[127].lineTo(257.34, 235.36);
  allPaths[127].close();

  // Paint paint_127_fill = Paint()..style = PaintingStyle.fill;
  // paint_127_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_127, paint_127_fill);

  allPaths[128].moveTo(254.89, 236.88);
  allPaths[128].cubicTo(254.59, 178.25, 254.29, 114.64, 253.99, 56.0399);
  allPaths[128].cubicTo(254.59, 54.1899, 255.2, 52.4399, 255.81, 50.7999);
  allPaths[128].cubicTo(255.5, 111.13, 255.19, 176.49, 254.89, 236.87);
  allPaths[128].lineTo(254.89, 236.88);
  allPaths[128].close();

  // Paint paint_128_fill = Paint()..style = PaintingStyle.fill;
  // paint_128_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_128, paint_128_fill);

  allPaths[129].moveTo(259.99, 234.93);
  allPaths[129].cubicTo(259.67, 172.67, 259.36, 105.44, 259.04, 43.22);
  allPaths[129].cubicTo(259.67, 41.93, 260.31, 40.74, 260.96, 39.65);
  allPaths[129].cubicTo(260.64, 103.05, 260.32, 171.48, 260, 234.93);
  allPaths[129].lineTo(259.99, 234.93);
  allPaths[129].close();
  //
  // Paint paint_129_fill = Paint()..style = PaintingStyle.fill;
  // paint_129_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_129, paint_129_fill);

  allPaths[130].moveTo(262.85, 230.77);
  allPaths[130].cubicTo(262.53, 166.55, 262.21, 102.34, 261.88, 38.16);
  allPaths[130].cubicTo(262.52, 37.17, 263.17, 36.28, 263.82, 35.49);
  allPaths[130].cubicTo(263.5, 100.57, 263.17, 165.66, 262.85, 230.77);
  allPaths[130].close();

  // Paint paint_130_fill = Paint()..style = PaintingStyle.fill;
  // paint_130_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_130, paint_130_fill);

  allPaths[131].moveTo(251.53, 0);
  allPaths[131].lineTo(252.38, 234.91);
  allPaths[131].lineTo(253.23, 0);
  allPaths[131].lineTo(251.53, 0);
  allPaths[131].close();

  // Paint paint_131_fill = Paint()..style = PaintingStyle.fill;
  // paint_131_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_131, paint_131_fill);

  allPaths[132].moveTo(239.59, 5.94003);
  allPaths[132].lineTo(240.43, 237.09);
  allPaths[132].lineTo(241.28, 5.03003);
  allPaths[132].lineTo(239.59, 5.94003);
  allPaths[132].close();

  // Paint paint_132_fill = Paint()..style = PaintingStyle.fill;
  // paint_132_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_132, paint_132_fill);

  allPaths[133].moveTo(236.21, 7.61994);
  allPaths[133].lineTo(237.05, 233.08);
  allPaths[133].lineTo(237.89, 6.68994);
  allPaths[133].lineTo(236.21, 7.61994);
  allPaths[133].close();
  //
  // Paint paint_133_fill = Paint()..style = PaintingStyle.fill;
  // paint_133_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_133, paint_133_fill);

  allPaths[134].moveTo(243.25, 4.06998);
  allPaths[134].lineTo(244.09, 233.98);
  allPaths[134].lineTo(244.94, 3.22998);
  allPaths[134].lineTo(243.25, 4.06998);
  allPaths[134].close();

  // Paint paint_134_fill = Paint()..style = PaintingStyle.fill;
  // paint_134_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_134, paint_134_fill);

  allPaths[135].moveTo(247.22, 2.12004);
  allPaths[135].lineTo(248.06, 236.6);
  allPaths[135].lineTo(248.91, 1.29004);
  allPaths[135].lineTo(247.22, 2.12004);
  allPaths[135].close();

  // Paint paint_135_fill = Paint()..style = PaintingStyle.fill;
  // paint_135_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_135, paint_135_fill);

  allPaths[136].moveTo(228.57, 12.7699);
  allPaths[136].lineTo(229.42, 227.69);
  allPaths[136].lineTo(230.26, 11.9399);
  allPaths[136].lineTo(228.57, 12.7699);
  allPaths[136].close();

  // Paint paint_136_fill = Paint()..style = PaintingStyle.fill;
  // paint_136_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_136, paint_136_fill);

  allPaths[137].moveTo(232.54, 10.82);
  allPaths[137].lineTo(233.38, 235.31);
  allPaths[137].lineTo(234.23, 10);
  allPaths[137].lineTo(232.54, 10.82);
  allPaths[137].close();

  // Paint paint_137_fill = Paint()..style = PaintingStyle.fill;
  // paint_137_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_137, paint_137_fill);

  allPaths[138].moveTo(122.97, 216.66);
  allPaths[138].lineTo(123.74, 234.66);
  allPaths[138].lineTo(124.64, 216.59);
  allPaths[138].lineTo(122.97, 216.66);
  allPaths[138].close();

  // Paint paint_138_fill = Paint()..style = PaintingStyle.fill;
  // paint_138_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_138, paint_138_fill);

  allPaths[139].moveTo(122.97, 216.66);
  allPaths[139].lineTo(123.74, 234.66);
  allPaths[139].lineTo(124.64, 216.59);
  allPaths[139].lineTo(122.97, 216.66);
  allPaths[139].close();

  // Paint paint_139_fill = Paint()..style = PaintingStyle.fill;
  // paint_139_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_139, paint_139_fill);

  allPaths[140].moveTo(123.01, 216.607);
  allPaths[140].lineTo(122.944, 234.677);
  allPaths[140].lineTo(124.614, 234.683);
  allPaths[140].lineTo(124.68, 216.613);
  allPaths[140].lineTo(123.01, 216.607);
  allPaths[140].close();

  // Paint paint_140_fill = Paint()..style = PaintingStyle.fill;
  // paint_140_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_140, paint_140_fill);

  allPaths[141].moveTo(123.01, 216.607);
  allPaths[141].lineTo(122.944, 234.677);
  allPaths[141].lineTo(124.614, 234.683);
  allPaths[141].lineTo(124.68, 216.613);
  allPaths[141].lineTo(123.01, 216.607);
  allPaths[141].close();

  // Paint paint_141_fill = Paint()..style = PaintingStyle.fill;
  // paint_141_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_141, paint_141_fill);

  allPaths[142].moveTo(123.01, 216.607);
  allPaths[142].lineTo(122.944, 234.677);
  allPaths[142].lineTo(124.614, 234.683);
  allPaths[142].lineTo(124.68, 216.613);
  allPaths[142].lineTo(123.01, 216.607);
  allPaths[142].close();

  // Paint paint_142_fill = Paint()..style = PaintingStyle.fill;
  // paint_142_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_142, paint_142_fill);

  allPaths[143].moveTo(123.01, 216.607);
  allPaths[143].lineTo(122.944, 234.677);
  allPaths[143].lineTo(124.614, 234.683);
  allPaths[143].lineTo(124.68, 216.613);
  allPaths[143].lineTo(123.01, 216.607);
  allPaths[143].close();

  // Paint paint_143_fill = Paint()..style = PaintingStyle.fill;
  // paint_143_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_143, paint_143_fill);

  allPaths[144].moveTo(123.01, 216.607);
  allPaths[144].lineTo(122.944, 234.677);
  allPaths[144].lineTo(124.614, 234.683);
  allPaths[144].lineTo(124.68, 216.613);
  allPaths[144].lineTo(123.01, 216.607);
  allPaths[144].close();

  // Paint paint_144_fill = Paint()..style = PaintingStyle.fill;
  // paint_144_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_144, paint_144_fill);

  allPaths[145].moveTo(119.62, 216.79);
  allPaths[145].lineTo(120.39, 234.08);
  allPaths[145].lineTo(121.29, 216.73);
  allPaths[145].lineTo(119.62, 216.79);
  allPaths[145].close();

  // Paint paint_145_fill = Paint()..style = PaintingStyle.fill;
  // paint_145_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_145, paint_145_fill);

  allPaths[146].moveTo(119.62, 216.79);
  allPaths[146].lineTo(120.39, 234.08);
  allPaths[146].lineTo(121.29, 216.73);
  allPaths[146].lineTo(119.62, 216.79);
  allPaths[146].close();

  // Paint paint_146_fill = Paint()..style = PaintingStyle.fill;
  // paint_146_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_146, paint_146_fill);

  allPaths[147].moveTo(119.656, 216.737);
  allPaths[147].lineTo(119.593, 234.096);
  allPaths[147].lineTo(121.253, 234.103);
  allPaths[147].lineTo(121.316, 216.743);
  allPaths[147].lineTo(119.656, 216.737);
  allPaths[147].close();

  // Paint paint_147_fill = Paint()..style = PaintingStyle.fill;
  // paint_147_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_147, paint_147_fill);

  allPaths[148].moveTo(119.656, 216.737);
  allPaths[148].lineTo(119.593, 234.096);
  allPaths[148].lineTo(121.253, 234.103);
  allPaths[148].lineTo(121.316, 216.743);
  allPaths[148].lineTo(119.656, 216.737);
  allPaths[148].close();

  // Paint paint_148_fill = Paint()..style = PaintingStyle.fill;
  // paint_148_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_148, paint_148_fill);

  allPaths[149].moveTo(119.656, 216.747);
  allPaths[149].lineTo(119.593, 234.106);
  allPaths[149].lineTo(121.253, 234.113);
  allPaths[149].lineTo(121.316, 216.753);
  allPaths[149].lineTo(119.656, 216.747);
  allPaths[149].close();

  // Paint paint_149_fill = Paint()..style = PaintingStyle.fill;
  // paint_149_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_149, paint_149_fill);

  allPaths[150].moveTo(119.656, 216.747);
  allPaths[150].lineTo(119.593, 234.106);
  allPaths[150].lineTo(121.253, 234.113);
  allPaths[150].lineTo(121.316, 216.753);
  allPaths[150].lineTo(119.656, 216.747);
  allPaths[150].close();
  //
  // Paint paint_150_fill = Paint()..style = PaintingStyle.fill;
  // paint_150_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_150, paint_150_fill);

  allPaths[151].moveTo(119.656, 216.747);
  allPaths[151].lineTo(119.593, 234.106);
  allPaths[151].lineTo(121.253, 234.113);
  allPaths[151].lineTo(121.316, 216.753);
  allPaths[151].lineTo(119.656, 216.747);
  allPaths[151].close();
  //
  // Paint paint_151_fill = Paint()..style = PaintingStyle.fill;
  // paint_151_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_151, paint_151_fill);

  allPaths[152].moveTo(126.59, 216.52);
  allPaths[152].lineTo(127.36, 235.29);
  allPaths[152].lineTo(128.26, 216.45);
  allPaths[152].lineTo(126.59, 216.52);
  allPaths[152].close();

  // Paint paint_152_fill = Paint()..style = PaintingStyle.fill;
  // paint_152_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_152, paint_152_fill);

  allPaths[153].moveTo(126.59, 216.52);
  allPaths[153].lineTo(127.36, 235.29);
  allPaths[153].lineTo(128.26, 216.45);
  allPaths[153].lineTo(126.59, 216.52);
  allPaths[153].close();

  // Paint paint_153_fill = Paint()..style = PaintingStyle.fill;
  // paint_153_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_153, paint_153_fill);

  allPaths[154].moveTo(126.625, 216.458);
  allPaths[154].lineTo(126.556, 235.308);
  allPaths[154].lineTo(128.226, 235.314);
  allPaths[154].lineTo(128.295, 216.464);
  allPaths[154].lineTo(126.625, 216.458);
  allPaths[154].close();

  // Paint paint_154_fill = Paint()..style = PaintingStyle.fill;
  // paint_154_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_154, paint_154_fill);

  allPaths[155].moveTo(126.625, 216.458);
  allPaths[155].lineTo(126.556, 235.308);
  allPaths[155].lineTo(128.226, 235.314);
  allPaths[155].lineTo(128.295, 216.464);
  allPaths[155].lineTo(126.625, 216.458);
  allPaths[155].close();
  //
  // Paint paint_155_fill = Paint()..style = PaintingStyle.fill;
  // paint_155_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_155, paint_155_fill);

  allPaths[156].moveTo(126.625, 216.458);
  allPaths[156].lineTo(126.556, 235.308);
  allPaths[156].lineTo(128.226, 235.314);
  allPaths[156].lineTo(128.295, 216.464);
  allPaths[156].lineTo(126.625, 216.458);
  allPaths[156].close();

  // Paint paint_156_fill = Paint()..style = PaintingStyle.fill;
  // paint_156_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_156, paint_156_fill);

  allPaths[157].moveTo(126.625, 216.458);
  allPaths[157].lineTo(126.556, 235.308);
  allPaths[157].lineTo(128.226, 235.314);
  allPaths[157].lineTo(128.295, 216.464);
  allPaths[157].lineTo(126.625, 216.458);
  allPaths[157].close();

  // Paint paint_157_fill = Paint()..style = PaintingStyle.fill;
  // paint_157_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_157, paint_157_fill);

  allPaths[158].moveTo(126.625, 216.458);
  allPaths[158].lineTo(126.556, 235.308);
  allPaths[158].lineTo(128.226, 235.314);
  allPaths[158].lineTo(128.295, 216.464);
  allPaths[158].lineTo(126.625, 216.458);
  allPaths[158].close();

  // Paint paint_158_fill = Paint()..style = PaintingStyle.fill;
  // paint_158_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_158, paint_158_fill);

  allPaths[159].moveTo(363.37, 123.02);
  allPaths[159].lineTo(363.88, 153.2);
  allPaths[159].lineTo(364.39, 122.91);
  allPaths[159].lineTo(363.37, 123.02);
  allPaths[159].close();

  // Paint paint_159_fill = Paint()..style = PaintingStyle.fill;
  // paint_159_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_159, paint_159_fill);

  allPaths[160].moveTo(363.37, 123.02);
  allPaths[160].lineTo(363.88, 153.2);
  allPaths[160].lineTo(364.39, 122.91);
  allPaths[160].lineTo(363.37, 123.02);
  allPaths[160].close();

  // Paint paint_160_fill = Paint()..style = PaintingStyle.fill;
  // paint_160_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_160, paint_160_fill);

  allPaths[161].moveTo(364.39, 122.91);
  allPaths[161].lineTo(363.37, 122.91);
  allPaths[161].lineTo(363.37, 153.21);
  allPaths[161].lineTo(364.39, 153.21);
  allPaths[161].lineTo(364.39, 122.91);
  allPaths[161].close();

  // Paint paint_161_fill = Paint()..style = PaintingStyle.fill;
  // paint_161_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_161, paint_161_fill);

  allPaths[162].moveTo(364.39, 122.91);
  allPaths[162].lineTo(363.37, 122.91);
  allPaths[162].lineTo(363.37, 153.21);
  allPaths[162].lineTo(364.39, 153.21);
  allPaths[162].lineTo(364.39, 122.91);
  allPaths[162].close();

  // Paint paint_162_fill = Paint()..style = PaintingStyle.fill;
  // paint_162_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_162, paint_162_fill);

  allPaths[163].moveTo(364.39, 122.91);
  allPaths[163].lineTo(363.37, 122.91);
  allPaths[163].lineTo(363.37, 153.21);
  allPaths[163].lineTo(364.39, 153.21);
  allPaths[163].lineTo(364.39, 122.91);
  allPaths[163].close();

  // Paint paint_163_fill = Paint()..style = PaintingStyle.fill;
  // paint_163_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_163, paint_163_fill);

  allPaths[164].moveTo(364.39, 122.91);
  allPaths[164].lineTo(363.37, 122.91);
  allPaths[164].lineTo(363.37, 153.21);
  allPaths[164].lineTo(364.39, 153.21);
  allPaths[164].lineTo(364.39, 122.91);
  allPaths[164].close();

  // Paint paint_164_fill = Paint()..style = PaintingStyle.fill;
  // paint_164_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_164, paint_164_fill);

  allPaths[165].moveTo(364.39, 122.91);
  allPaths[165].lineTo(363.37, 122.91);
  allPaths[165].lineTo(363.37, 153.21);
  allPaths[165].lineTo(364.39, 153.21);
  allPaths[165].lineTo(364.39, 122.91);
  allPaths[165].close();

  // Paint paint_165_fill = Paint()..style = PaintingStyle.fill;
  // paint_165_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_165, paint_165_fill);

  allPaths[166].moveTo(177.31, 204.93);
  allPaths[166].lineTo(177.82, 235.11);
  allPaths[166].lineTo(178.33, 204.82);
  allPaths[166].lineTo(177.31, 204.93);
  allPaths[166].close();

  // Paint paint_166_fill = Paint()..style = PaintingStyle.fill;
  // paint_166_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_166, paint_166_fill);

  allPaths[167].moveTo(177.31, 204.93);
  allPaths[167].lineTo(177.82, 235.11);
  allPaths[167].lineTo(178.33, 204.82);
  allPaths[167].lineTo(177.31, 204.93);
  allPaths[167].close();

  // Paint paint_167_fill = Paint()..style = PaintingStyle.fill;
  // paint_167_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_167, paint_167_fill);

  allPaths[168].moveTo(178.33, 204.82);
  allPaths[168].lineTo(177.31, 204.82);
  allPaths[168].lineTo(177.31, 235.12);
  allPaths[168].lineTo(178.33, 235.12);
  allPaths[168].lineTo(178.33, 204.82);
  allPaths[168].close();

  // Paint paint_168_fill = Paint()..style = PaintingStyle.fill;
  // paint_168_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_168, paint_168_fill);

  allPaths[169].moveTo(178.33, 204.82);
  allPaths[169].lineTo(177.31, 204.82);
  allPaths[169].lineTo(177.31, 235.12);
  allPaths[169].lineTo(178.33, 235.12);
  allPaths[169].lineTo(178.33, 204.82);
  allPaths[169].close();

  // Paint paint_169_fill = Paint()..style = PaintingStyle.fill;
  // paint_169_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_169, paint_169_fill);

  allPaths[170].moveTo(178.33, 204.82);
  allPaths[170].lineTo(177.31, 204.82);
  allPaths[170].lineTo(177.31, 235.12);
  allPaths[170].lineTo(178.33, 235.12);
  allPaths[170].lineTo(178.33, 204.82);
  allPaths[170].close();

  // Paint paint_170_fill = Paint()..style = PaintingStyle.fill;
  // paint_170_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_170, paint_170_fill);

  allPaths[171].moveTo(178.33, 204.82);
  allPaths[171].lineTo(177.31, 204.82);
  allPaths[171].lineTo(177.31, 235.12);
  allPaths[171].lineTo(178.33, 235.12);
  allPaths[171].lineTo(178.33, 204.82);
  allPaths[171].close();

  // Paint paint_171_fill = Paint()..style = PaintingStyle.fill;
  // paint_171_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_171, paint_171_fill);

  allPaths[172].moveTo(178.33, 204.82);
  allPaths[172].lineTo(177.31, 204.82);
  allPaths[172].lineTo(177.31, 235.12);
  allPaths[172].lineTo(178.33, 235.12);
  allPaths[172].lineTo(178.33, 204.82);
  allPaths[172].close();

  // Paint paint_172_fill = Paint()..style = PaintingStyle.fill;
  // paint_172_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_172, paint_172_fill);

  allPaths[173].moveTo(277.72, 204.4);
  allPaths[173].lineTo(278.22, 234.59);
  allPaths[173].lineTo(278.74, 204.29);
  allPaths[173].lineTo(277.72, 204.4);
  allPaths[173].close();

  // Paint paint_173_fill = Paint()..style = PaintingStyle.fill;
  // paint_173_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_173, paint_173_fill);

  allPaths[174].moveTo(277.72, 204.4);
  allPaths[174].lineTo(278.22, 234.59);
  allPaths[174].lineTo(278.74, 204.29);
  allPaths[174].lineTo(277.72, 204.4);
  allPaths[174].close();

  // Paint paint_174_fill = Paint()..style = PaintingStyle.fill;
  // paint_174_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_174, paint_174_fill);

  allPaths[175].moveTo(278.74, 204.29);
  allPaths[175].lineTo(277.72, 204.29);
  allPaths[175].lineTo(277.72, 234.59);
  allPaths[175].lineTo(278.74, 234.59);
  allPaths[175].lineTo(278.74, 204.29);
  allPaths[175].close();

  // Paint paint_175_fill = Paint()..style = PaintingStyle.fill;
  // paint_175_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_175, paint_175_fill);

  allPaths[176].moveTo(278.74, 204.29);
  allPaths[176].lineTo(277.72, 204.29);
  allPaths[176].lineTo(277.72, 234.59);
  allPaths[176].lineTo(278.74, 234.59);
  allPaths[176].lineTo(278.74, 204.29);
  allPaths[176].close();

  // Paint paint_176_fill = Paint()..style = PaintingStyle.fill;
  // paint_176_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_176, paint_176_fill);

  allPaths[177].moveTo(278.74, 204.29);
  allPaths[177].lineTo(277.72, 204.29);
  allPaths[177].lineTo(277.72, 234.59);
  allPaths[177].lineTo(278.74, 234.59);
  allPaths[177].lineTo(278.74, 204.29);
  allPaths[177].close();

  // Paint paint_177_fill = Paint()..style = PaintingStyle.fill;
  // paint_177_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_177, paint_177_fill);

  allPaths[178].moveTo(278.74, 204.29);
  allPaths[178].lineTo(277.72, 204.29);
  allPaths[178].lineTo(277.72, 234.59);
  allPaths[178].lineTo(278.74, 234.59);
  allPaths[178].lineTo(278.74, 204.29);
  allPaths[178].close();

  // Paint paint_178_fill = Paint()..style = PaintingStyle.fill;
  // paint_178_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_178, paint_178_fill);

  allPaths[179].moveTo(278.74, 204.29);
  allPaths[179].lineTo(277.72, 204.29);
  allPaths[179].lineTo(277.72, 234.59);
  allPaths[179].lineTo(278.74, 234.59);
  allPaths[179].lineTo(278.74, 204.29);
  allPaths[179].close();

  // Paint paint_179_fill = Paint()..style = PaintingStyle.fill;
  // paint_179_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_179, paint_179_fill);

  allPaths[180].moveTo(451.08, 224.2);
  allPaths[180].cubicTo(451.11, 224.1, 451.1, 224.01, 451.08, 223.91);
  allPaths[180].lineTo(451.19, 223.91);
  allPaths[180].lineTo(451.08, 223.82);
  allPaths[180].cubicTo(451.04, 223.67, 450.96, 223.54, 450.83, 223.43);
  allPaths[180].lineTo(434.33, 210.08);
  allPaths[180].lineTo(434.3, 209.95);
  allPaths[180].lineTo(434.1, 209.9);
  allPaths[180].lineTo(426.07, 203.4);
  allPaths[180].lineTo(426.01, 203.08);
  allPaths[180].lineTo(425.46, 202.91);
  allPaths[180].lineTo(410.76, 191.01);
  allPaths[180].lineTo(410.76, 190.99);
  allPaths[180].lineTo(410.72, 190.97);
  allPaths[180].lineTo(406.42, 187.49);
  allPaths[180].cubicTo(406.29, 187.39, 406.13, 187.33, 405.95, 187.33);
  allPaths[180].lineTo(390.43, 187.33);
  allPaths[180].cubicTo(390.33, 187.33, 390.23, 187.35, 390.15, 187.39);
  allPaths[180].cubicTo(389.89, 187.5, 389.7, 187.76, 389.7, 188.07);
  allPaths[180].lineTo(389.7, 190.14);
  allPaths[180].lineTo(385.18, 190.14);
  allPaths[180].lineTo(385.18, 186.01);
  allPaths[180].lineTo(392.27, 186.01);
  allPaths[180].cubicTo(392.52, 186.01, 392.75, 185.88, 392.88, 185.68);
  allPaths[180].lineTo(394.81, 182.76);
  allPaths[180].cubicTo(394.9, 182.7, 394.99, 182.63, 395.05, 182.54);
  allPaths[180].lineTo(396.61, 180.14);
  allPaths[180].cubicTo(396.61, 180.14, 396.64, 180.04, 396.66, 179.98);
  allPaths[180].lineTo(400.45, 174.27);
  allPaths[180].cubicTo(400.6, 174.04, 400.62, 173.75, 400.49, 173.52);
  allPaths[180].cubicTo(400.44, 173.43, 400.37, 173.38, 400.3, 173.32);
  allPaths[180].lineTo(400.38, 173.19);
  allPaths[180].lineTo(400.06, 173.19);
  allPaths[180].cubicTo(399.99, 173.17, 399.92, 173.13, 399.84, 173.13);
  allPaths[180].lineTo(350.27, 173.13);
  allPaths[180].cubicTo(350.19, 173.13, 350.12, 173.17, 350.04, 173.19);
  allPaths[180].lineTo(349.75, 173.19);
  allPaths[180].lineTo(349.82, 173.3);
  allPaths[180].cubicTo(349.74, 173.36, 349.67, 173.42, 349.62, 173.51);
  allPaths[180].cubicTo(349.49, 173.74, 349.5, 174.03, 349.64, 174.25);
  allPaths[180].lineTo(356.68, 185.67);
  allPaths[180].cubicTo(356.82, 185.89, 357.05, 186.02, 357.31, 186.02);
  allPaths[180].lineTo(361.4, 186.02);
  allPaths[180].lineTo(361.4, 190.15);
  allPaths[180].lineTo(359.53, 190.15);
  allPaths[180].cubicTo(359.36, 190.15, 359.2, 190.21, 359.05, 190.33);
  allPaths[180].lineTo(355.1, 193.71);
  allPaths[180].lineTo(353.19, 194.76);
  allPaths[180].lineTo(353.88, 194.76);
  allPaths[180].lineTo(353.86, 194.78);
  allPaths[180].lineTo(353.19, 195.15);
  allPaths[180].lineTo(353.43, 195.15);
  allPaths[180].lineTo(353.08, 195.45);
  allPaths[180].lineTo(353.03, 195.48);
  allPaths[180].lineTo(332.13, 213.39);
  allPaths[180].lineTo(331.96, 213.35);
  allPaths[180].lineTo(331.9, 213.58);
  allPaths[180].lineTo(320.43, 223.4);
  allPaths[180].cubicTo(320.31, 223.51, 320.24, 223.65, 320.2, 223.8);
  allPaths[180].lineTo(320.13, 223.86);
  allPaths[180].lineTo(320.2, 223.86);
  allPaths[180].cubicTo(320.19, 223.96, 320.19, 224.07, 320.22, 224.17);
  allPaths[180].lineTo(320.13, 224.25);
  allPaths[180].lineTo(320.25, 224.25);
  allPaths[180].cubicTo(320.37, 224.51, 320.63, 224.7, 320.91, 224.7);
  allPaths[180].lineTo(328.91, 224.7);
  allPaths[180].lineTo(328.91, 232.69);
  allPaths[180].cubicTo(328.91, 233.1, 329.24, 233.43, 329.65, 233.43);
  allPaths[180].lineTo(432.18, 233.43);
  allPaths[180].cubicTo(432.58, 233.43, 432.91, 233.1, 432.91, 232.69);
  allPaths[180].lineTo(432.91, 224.76);
  allPaths[180].lineTo(450.36, 224.76);
  allPaths[180].cubicTo(450.65, 224.76, 450.9, 224.58, 451.02, 224.31);
  allPaths[180].lineTo(451.18, 224.31);
  allPaths[180].lineTo(451.06, 224.21);
  allPaths[180].lineTo(451.08, 224.2);
  allPaths[180].close();

  // Paint paint_180_fill = Paint()..style = PaintingStyle.fill;
  // paint_180_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_180, paint_180_fill);

  allPaths[181].moveTo(404.96, 238.02);
  allPaths[181].lineTo(405.91, 175.12);
  allPaths[181].lineTo(404.01, 174.57);
  allPaths[181].lineTo(404.96, 238.02);
  allPaths[181].close();

  // Paint paint_181_fill = Paint()..style = PaintingStyle.fill;
  // paint_181_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_181, paint_181_fill);

  allPaths[182].moveTo(401.38, 239.06);
  allPaths[182].lineTo(402.33, 174.08);
  allPaths[182].lineTo(400.43, 173.54);
  allPaths[182].lineTo(401.38, 239.06);
  allPaths[182].close();

  // Paint paint_182_fill = Paint()..style = PaintingStyle.fill;
  // paint_182_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_182, paint_182_fill);

  allPaths[183].moveTo(411.479, 236.13);
  allPaths[183].lineTo(412.43, 176.99);
  allPaths[183].lineTo(410.52, 176.44);
  allPaths[183].lineTo(411.479, 236.13);
  allPaths[183].close();

  // Paint paint_183_fill = Paint()..style = PaintingStyle.fill;
  // paint_183_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_183, paint_183_fill);

  allPaths[184].moveTo(408.32, 237.05);
  allPaths[184].lineTo(409.27, 176.08);
  allPaths[184].lineTo(407.37, 175.53);
  allPaths[184].lineTo(408.32, 237.05);
  allPaths[184].close();

  // Paint paint_184_fill = Paint()..style = PaintingStyle.fill;
  // paint_184_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_184, paint_184_fill);

  allPaths[185].moveTo(419.93, 233.69);
  allPaths[185].lineTo(420.87, 179.42);
  allPaths[185].lineTo(418.97, 178.88);
  allPaths[185].lineTo(419.93, 233.69);
  allPaths[185].close();

  // Paint paint_185_fill = Paint()..style = PaintingStyle.fill;
  // paint_185_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_185, paint_185_fill);

  allPaths[186].moveTo(422.439, 232.96);
  allPaths[186].lineTo(423.389, 180.15);
  allPaths[186].lineTo(421.489, 179.6);
  allPaths[186].lineTo(422.439, 232.96);
  allPaths[186].close();

  // Paint paint_186_fill = Paint()..style = PaintingStyle.fill;
  // paint_186_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_186, paint_186_fill);

  allPaths[187].moveTo(417.27, 234.46);
  allPaths[187].lineTo(418.22, 178.66);
  allPaths[187].lineTo(416.31, 178.11);
  allPaths[187].lineTo(417.27, 234.46);
  allPaths[187].close();

  // Paint paint_187_fill = Paint()..style = PaintingStyle.fill;
  // paint_187_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_187, paint_187_fill);

  allPaths[188].moveTo(414.46, 235.27);
  allPaths[188].lineTo(415.41, 177.85);
  allPaths[188].lineTo(413.5, 177.3);
  allPaths[188].lineTo(414.46, 235.27);
  allPaths[188].close();

  // Paint paint_188_fill = Paint()..style = PaintingStyle.fill;
  // paint_188_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_188, paint_188_fill);

  allPaths[189].moveTo(428.2, 232.44);
  allPaths[189].lineTo(429.05, 192.04);
  allPaths[189].lineTo(427.34, 191.71);
  allPaths[189].lineTo(428.2, 232.44);
  allPaths[189].close();

  // Paint paint_189_fill = Paint()..style = PaintingStyle.fill;
  // paint_189_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_189, paint_189_fill);

  allPaths[190].moveTo(425, 233.07);
  allPaths[190].lineTo(425.84, 191.41);
  allPaths[190].lineTo(424.14, 191.08);
  allPaths[190].lineTo(425, 233.07);
  allPaths[190].close();

  // Paint paint_190_fill = Paint()..style = PaintingStyle.fill;
  // paint_190_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_190, paint_190_fill);

  allPaths[191].moveTo(352.37, 193.43);
  allPaths[191].lineTo(353.14, 157.68);
  allPaths[191].lineTo(351.6, 157.37);
  allPaths[191].lineTo(352.37, 193.43);
  allPaths[191].close();

  // Paint paint_191_fill = Paint()..style = PaintingStyle.fill;
  // paint_191_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_191, paint_191_fill);

  allPaths[192].moveTo(349.49, 194.02);
  allPaths[192].lineTo(350.25, 157.09);
  allPaths[192].lineTo(348.72, 156.78);
  allPaths[192].lineTo(349.49, 194.02);
  allPaths[192].close();

  // Paint paint_192_fill = Paint()..style = PaintingStyle.fill;
  // paint_192_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_192, paint_192_fill);

  allPaths[193].moveTo(357.62, 192.36);
  allPaths[193].lineTo(358.38, 158.75);
  allPaths[193].lineTo(356.85, 158.43);
  allPaths[193].lineTo(357.62, 192.36);
  allPaths[193].close();

  // Paint paint_193_fill = Paint()..style = PaintingStyle.fill;
  // paint_193_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_193, paint_193_fill);

  allPaths[194].moveTo(355.08, 192.88);
  allPaths[194].lineTo(355.84, 158.23);
  allPaths[194].lineTo(354.31, 157.92);
  allPaths[194].lineTo(355.08, 192.88);
  allPaths[194].close();

  // Paint paint_194_fill = Paint()..style = PaintingStyle.fill;
  // paint_194_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_194, paint_194_fill);

  allPaths[195].moveTo(364.42, 190.97);
  allPaths[195].lineTo(365.18, 160.13);
  allPaths[195].lineTo(363.65, 159.82);
  allPaths[195].lineTo(364.42, 190.97);
  allPaths[195].close();

  // Paint paint_195_fill = Paint()..style = PaintingStyle.fill;
  // paint_195_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_195, paint_195_fill);

  allPaths[196].moveTo(366.44, 190.56);
  allPaths[196].lineTo(367.2, 160.54);
  allPaths[196].lineTo(365.67, 160.23);
  allPaths[196].lineTo(366.44, 190.56);
  allPaths[196].close();

  // Paint paint_196_fill = Paint()..style = PaintingStyle.fill;
  // paint_196_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_196, paint_196_fill);

  allPaths[197].moveTo(362.28, 191.41);
  allPaths[197].lineTo(363.04, 159.69);
  allPaths[197].lineTo(361.51, 159.38);
  allPaths[197].lineTo(362.28, 191.41);
  allPaths[197].close();

  // Paint paint_197_fill = Paint()..style = PaintingStyle.fill;
  // paint_197_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_197, paint_197_fill);

  allPaths[198].moveTo(360.01, 191.87);
  allPaths[198].lineTo(360.78, 159.23);
  allPaths[198].lineTo(359.25, 158.92);
  allPaths[198].lineTo(360.01, 191.87);
  allPaths[198].close();

  // Paint paint_198_fill = Paint()..style = PaintingStyle.fill;
  // paint_198_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_198, paint_198_fill);

  allPaths[199].moveTo(373.47, 162.43);
  allPaths[199].lineTo(374.36, 234.11);
  allPaths[199].lineTo(375.25, 162.11);
  allPaths[199].lineTo(373.47, 162.43);
  allPaths[199].close();

  // Paint paint_199_fill = Paint()..style = PaintingStyle.fill;
  // paint_199_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_199, paint_199_fill);

  allPaths[200].moveTo(368.6, 163.29);
  allPaths[200].lineTo(369.49, 235.07);
  allPaths[200].lineTo(370.39, 162.97);
  allPaths[200].lineTo(368.6, 163.29);
  allPaths[200].close();

  // Paint paint_200_fill = Paint()..style = PaintingStyle.fill;
  // paint_200_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_200, paint_200_fill);

  allPaths[201].moveTo(370.97, 162.87);
  allPaths[201].lineTo(371.86, 233.96);
  allPaths[201].lineTo(372.76, 162.55);
  allPaths[201].lineTo(370.97, 162.87);
  allPaths[201].close();

  // Paint paint_201_fill = Paint()..style = PaintingStyle.fill;
  // paint_201_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_201, paint_201_fill);

  allPaths[202].moveTo(376.109, 161.96);
  allPaths[202].lineTo(376.999, 233.16);
  allPaths[202].lineTo(377.899, 161.64);
  allPaths[202].lineTo(376.109, 161.96);
  allPaths[202].close();

  // Paint paint_202_fill = Paint()..style = PaintingStyle.fill;
  // paint_202_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_202, paint_202_fill);

  allPaths[203].moveTo(381.88, 160.94);
  allPaths[203].lineTo(382.78, 233.86);
  allPaths[203].lineTo(383.67, 160.62);
  allPaths[203].lineTo(381.88, 160.94);
  allPaths[203].close();

  // Paint paint_203_fill = Paint()..style = PaintingStyle.fill;
  // paint_203_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_203, paint_203_fill);

  allPaths[204].moveTo(378.91, 161.47);
  allPaths[204].lineTo(379.8, 234.64);
  allPaths[204].lineTo(380.7, 161.15);
  allPaths[204].lineTo(378.91, 161.47);
  allPaths[204].close();

  // Paint paint_204_fill = Paint()..style = PaintingStyle.fill;
  // paint_204_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_204, paint_204_fill);

  allPaths[205].moveTo(388.41, 159.78);
  allPaths[205].lineTo(389.3, 233.78);
  allPaths[205].lineTo(390.2, 159.47);
  allPaths[205].lineTo(388.41, 159.78);
  allPaths[205].close();

  // Paint paint_205_fill = Paint()..style = PaintingStyle.fill;
  // paint_205_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_205, paint_205_fill);

  allPaths[206].moveTo(385.04, 160.38);
  allPaths[206].lineTo(385.93, 232);
  allPaths[206].lineTo(386.83, 160.07);
  allPaths[206].lineTo(385.04, 160.38);
  allPaths[206].close();

  // Paint paint_206_fill = Paint()..style = PaintingStyle.fill;
  // paint_206_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_206, paint_206_fill);

  allPaths[207].moveTo(391.64, 159.09);
  allPaths[207].lineTo(392.54, 233.18);
  allPaths[207].lineTo(393.44, 158.77);
  allPaths[207].lineTo(391.64, 159.09);
  allPaths[207].close();

  // Paint paint_207_fill = Paint()..style = PaintingStyle.fill;
  // paint_207_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_207, paint_207_fill);

  allPaths[208].moveTo(398.169, 157.93);
  allPaths[208].lineTo(399.069, 235.46);
  allPaths[208].lineTo(399.959, 157.62);
  allPaths[208].lineTo(398.169, 157.93);
  allPaths[208].close();

  // Paint paint_208_fill = Paint()..style = PaintingStyle.fill;
  // paint_208_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_208, paint_208_fill);

  allPaths[209].moveTo(394.8, 158.53);
  allPaths[209].lineTo(395.7, 232.5);
  allPaths[209].lineTo(396.6, 158.22);
  allPaths[209].lineTo(394.8, 158.53);
  allPaths[209].close();

  // Paint paint_209_fill = Paint()..style = PaintingStyle.fill;
  // paint_209_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_209, paint_209_fill);

  allPaths[210].moveTo(345.21, 189.26);
  allPaths[210].lineTo(346.29, 236.58);
  allPaths[210].lineTo(347.38, 189.26);
  allPaths[210].lineTo(345.21, 189.26);
  allPaths[210].close();

  // Paint paint_210_fill = Paint()..style = PaintingStyle.fill;
  // paint_210_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_210, paint_210_fill);

  allPaths[211].moveTo(329.9, 190.44);
  allPaths[211].lineTo(330.98, 231.96);
  allPaths[211].lineTo(332.06, 190.27);
  allPaths[211].lineTo(329.9, 190.44);
  allPaths[211].close();

  // Paint paint_211_fill = Paint()..style = PaintingStyle.fill;
  // paint_211_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_211, paint_211_fill);

  allPaths[212].moveTo(325.57, 190.77);
  allPaths[212].lineTo(326.65, 230.65);
  allPaths[212].lineTo(327.73, 190.61);
  allPaths[212].lineTo(325.57, 190.77);
  allPaths[212].close();

  // Paint paint_212_fill = Paint()..style = PaintingStyle.fill;
  // paint_212_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_212, paint_212_fill);

  allPaths[213].moveTo(334.59, 190.08);
  allPaths[213].lineTo(335.67, 233.37);
  allPaths[213].lineTo(336.76, 189.91);
  allPaths[213].lineTo(334.59, 190.08);
  allPaths[213].close();

  // Paint paint_213_fill = Paint()..style = PaintingStyle.fill;
  // paint_213_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_213, paint_213_fill);

  allPaths[214].moveTo(339.67, 189.69);
  allPaths[214].lineTo(340.76, 234.91);
  allPaths[214].lineTo(341.84, 189.52);
  allPaths[214].lineTo(339.67, 189.69);
  allPaths[214].close();

  // Paint paint_214_fill = Paint()..style = PaintingStyle.fill;
  // paint_214_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_214, paint_214_fill);

  allPaths[215].moveTo(361.6, 236.42);
  allPaths[215].lineTo(362.68, 190.44);
  allPaths[215].lineTo(360.04, 190.88);
  allPaths[215].lineTo(361.6, 236.42);
  allPaths[215].close();

  // Paint paint_215_fill = Paint()..style = PaintingStyle.fill;
  // paint_215_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_215, paint_215_fill);

  allPaths[216].moveTo(365.93, 235.11);
  allPaths[216].lineTo(367.01, 189.33);
  allPaths[216].lineTo(364.85, 190.05);
  allPaths[216].lineTo(365.93, 235.11);
  allPaths[216].close();

  // Paint paint_216_fill = Paint()..style = PaintingStyle.fill;
  // paint_216_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_216, paint_216_fill);

  allPaths[217].moveTo(356.91, 237.84);
  allPaths[217].lineTo(357.99, 191.62);
  allPaths[217].lineTo(355.82, 192.04);
  allPaths[217].lineTo(356.91, 237.84);
  allPaths[217].close();

  // Paint paint_217_fill = Paint()..style = PaintingStyle.fill;
  // paint_217_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_217, paint_217_fill);

  allPaths[218].moveTo(351.83, 234.91);
  allPaths[218].lineTo(353.08, 192.58);
  allPaths[218].lineTo(350.95, 192.88);
  allPaths[218].lineTo(351.83, 234.91);
  allPaths[218].close();

  // Paint paint_218_fill = Paint()..style = PaintingStyle.fill;
  // paint_218_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_218, paint_218_fill);

  allPaths[219].moveTo(101.84, 94.74);
  allPaths[219].cubicTo(100.99, 92.64, 98.9598, 88.04, 98.9598, 88.04);
  allPaths[219].lineTo(104.61, 88.19);
  allPaths[219].lineTo(122.97, 118.91);
  allPaths[219].lineTo(119.87, 233.96);
  allPaths[219].lineTo(77.0598, 233.44);
  allPaths[219].lineTo(77.9598, 160.44);
  allPaths[219].lineTo(75.2998, 131.42);
  allPaths[219].lineTo(85.7398, 129.46);
  allPaths[219].lineTo(85.7398, 135.42);
  allPaths[219].lineTo(88.1298, 135.42);
  allPaths[219].lineTo(88.1298, 115.43);
  allPaths[219].lineTo(86.5498, 115.43);
  allPaths[219].lineTo(86.5498, 112.37);
  allPaths[219].lineTo(92.3698, 112.37);
  allPaths[219].lineTo(92.3698, 111.31);
  allPaths[219].cubicTo(86.7798, 110.8, 82.7398, 109.32, 82.7398, 107.58);
  allPaths[219].cubicTo(82.7398, 106.8, 83.5498, 106.07, 84.9598, 105.46);
  allPaths[219].lineTo(84.9598, 104.1);
  allPaths[219].lineTo(83.4598, 104.1);
  allPaths[219].lineTo(83.4598, 102.31);
  allPaths[219].cubicTo(82.8798, 101.99, 82.5598, 101.64, 82.5598, 101.28);
  allPaths[219].cubicTo(82.5598, 99.98, 86.6898, 98.87, 92.3698, 98.51);
  allPaths[219].lineTo(92.3698, 94.74);
  allPaths[219].lineTo(101.84, 94.74);
  allPaths[219].close();
  //
  // Paint paint_219_fill = Paint()..style = PaintingStyle.fill;
  // paint_219_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_219, paint_219_fill);

  allPaths[220].moveTo(99.4499, 135.1);
  allPaths[220].lineTo(100.07, 81.69);
  allPaths[220].lineTo(98.8398, 81.29);
  allPaths[220].lineTo(99.4499, 135.1);
  allPaths[220].close();

  // Paint paint_220_fill = Paint()..style = PaintingStyle.fill;
  // paint_220_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_220, paint_220_fill);

  allPaths[221].moveTo(97.14, 135.1);
  allPaths[221].lineTo(97.75, 80.93);
  allPaths[221].lineTo(96.52, 80.53);
  allPaths[221].lineTo(97.14, 135.1);
  allPaths[221].close();

  // Paint paint_221_fill = Paint()..style = PaintingStyle.fill;
  // paint_221_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_221, paint_221_fill);

  allPaths[222].moveTo(95.0096, 135.1);
  allPaths[222].lineTo(95.6196, 80.93);
  allPaths[222].lineTo(94.3896, 80.53);
  allPaths[222].lineTo(95.0096, 135.1);
  allPaths[222].close();

  // Paint paint_222_fill = Paint()..style = PaintingStyle.fill;
  // paint_222_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_222, paint_222_fill);

  allPaths[223].moveTo(92.7299, 135.1);
  allPaths[223].lineTo(93.3399, 80.3299);
  allPaths[223].lineTo(92.1099, 79.9299);
  allPaths[223].lineTo(92.7299, 135.1);
  allPaths[223].close();

  // Paint paint_223_fill = Paint()..style = PaintingStyle.fill;
  // paint_223_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_223, paint_223_fill);

  allPaths[224].moveTo(90.6698, 135.1);
  allPaths[224].lineTo(91.2798, 80.2099);
  allPaths[224].lineTo(90.0498, 79.8099);
  allPaths[224].lineTo(90.6698, 135.1);
  allPaths[224].close();

  // Paint paint_224_fill = Paint()..style = PaintingStyle.fill;
  // paint_224_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_224, paint_224_fill);

  allPaths[225].moveTo(88.64, 133.53);
  allPaths[225].lineTo(89.25, 79.36);
  allPaths[225].lineTo(88.02, 78.96);
  allPaths[225].lineTo(88.64, 133.53);
  allPaths[225].close();

  // Paint paint_225_fill = Paint()..style = PaintingStyle.fill;
  // paint_225_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_225, paint_225_fill);

  allPaths[226].moveTo(86.5096, 133.53);
  allPaths[226].lineTo(87.1196, 79.36);
  allPaths[226].lineTo(85.8896, 78.96);
  allPaths[226].lineTo(86.5096, 133.53);
  allPaths[226].close();
  //
  // Paint paint_226_fill = Paint()..style = PaintingStyle.fill;
  // paint_226_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_226, paint_226_fill);

  allPaths[227].moveTo(84.2299, 133.53);
  allPaths[227].lineTo(84.8399, 78.76);
  allPaths[227].lineTo(83.6099, 78.36);
  allPaths[227].lineTo(84.2299, 133.53);
  allPaths[227].close();

  // Paint paint_227_fill = Paint()..style = PaintingStyle.fill;
  // paint_227_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_227, paint_227_fill);

  allPaths[228].moveTo(82.1698, 133.53);
  allPaths[228].lineTo(82.7798, 78.64);
  allPaths[228].lineTo(81.5498, 78.24);
  allPaths[228].lineTo(82.1698, 133.53);
  allPaths[228].close();

  // Paint paint_228_fill = Paint()..style = PaintingStyle.fill;
  // paint_228_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_228, paint_228_fill);

  allPaths[229].moveTo(103.67, 135.1);
  allPaths[229].lineTo(104.28, 83.07);
  allPaths[229].lineTo(103.05, 82.67);
  allPaths[229].lineTo(103.67, 135.1);
  allPaths[229].close();

  // Paint paint_229_fill = Paint()..style = PaintingStyle.fill;
  // paint_229_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_229, paint_229_fill);

  allPaths[230].moveTo(101.63, 135.1);
  allPaths[230].lineTo(102.24, 82.4);
  allPaths[230].lineTo(101.01, 82);
  allPaths[230].lineTo(101.63, 135.1);
  allPaths[230].close();

  // Paint paint_230_fill = Paint()..style = PaintingStyle.fill;
  // paint_230_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_230, paint_230_fill);

  allPaths[231].moveTo(109.13, 135.1);
  allPaths[231].lineTo(109.74, 84.86);
  allPaths[231].lineTo(108.52, 84.46);
  allPaths[231].lineTo(109.13, 135.1);
  allPaths[231].close();

  // Paint paint_231_fill = Paint()..style = PaintingStyle.fill;
  // paint_231_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_231, paint_231_fill);

  allPaths[232].moveTo(110.76, 135.1);
  allPaths[232].lineTo(111.37, 85.39);
  allPaths[232].lineTo(110.14, 84.99);
  allPaths[232].lineTo(110.76, 135.1);
  allPaths[232].close();

  // Paint paint_232_fill = Paint()..style = PaintingStyle.fill;
  // paint_232_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_232, paint_232_fill);

  allPaths[233].moveTo(107.41, 135.1);
  allPaths[233].lineTo(108.03, 84.3);
  allPaths[233].lineTo(106.8, 83.89);
  allPaths[233].lineTo(107.41, 135.1);
  allPaths[233].close();

  // Paint paint_233_fill = Paint()..style = PaintingStyle.fill;
  // paint_233_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_233, paint_233_fill);

  allPaths[234].moveTo(105.6, 135.1);
  allPaths[234].lineTo(106.21, 83.7);
  allPaths[234].lineTo(104.98, 83.3);
  allPaths[234].lineTo(105.6, 135.1);
  allPaths[234].close();

  // Paint paint_234_fill = Paint()..style = PaintingStyle.fill;
  // paint_234_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_234, paint_234_fill);

  allPaths[235].moveTo(112.44, 135.1);
  allPaths[235].lineTo(113.06, 85.87);
  allPaths[235].lineTo(111.82, 85.46);
  allPaths[235].lineTo(112.44, 135.1);
  allPaths[235].close();

  // Paint paint_235_fill = Paint()..style = PaintingStyle.fill;
  // paint_235_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_235, paint_235_fill);

  allPaths[236].moveTo(117.9, 135.1);
  allPaths[236].lineTo(118.52, 87.65);
  allPaths[236].lineTo(117.29, 87.25);
  allPaths[236].lineTo(117.9, 135.1);
  allPaths[236].close();

  // Paint paint_236_fill = Paint()..style = PaintingStyle.fill;
  // paint_236_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(allPaths[236], paint_236_fill);

  allPaths[237].moveTo(119.53, 135.1);
  allPaths[237].lineTo(120.14, 88.19);
  allPaths[237].lineTo(118.91, 87.78);
  allPaths[237].lineTo(119.53, 135.1);
  allPaths[237].close();

  // Paint paint_237_fill = Paint()..style = PaintingStyle.fill;
  // paint_237_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_237, paint_237_fill);

  allPaths[238].moveTo(121.07, 135.1);
  allPaths[238].lineTo(121.68, 88.99);
  allPaths[238].lineTo(120.46, 88.59);
  allPaths[238].lineTo(121.07, 135.1);
  allPaths[238].close();

  // Paint paint_238_fill = Paint()..style = PaintingStyle.fill;
  // paint_238_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_238, paint_238_fill);

  allPaths[239].moveTo(122.79, 135.49);
  allPaths[239].lineTo(123.41, 89.38);
  allPaths[239].lineTo(122.18, 88.98);
  allPaths[239].lineTo(122.79, 135.49);
  allPaths[239].close();

  // Paint paint_239_fill = Paint()..style = PaintingStyle.fill;
  // paint_239_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_239, paint_239_fill);

  allPaths[240].moveTo(116.18, 135.1);
  allPaths[240].lineTo(116.8, 87.0899);
  allPaths[240].lineTo(115.57, 86.6899);
  allPaths[240].lineTo(116.18, 135.1);
  allPaths[240].close();

  // Paint paint_240_fill = Paint()..style = PaintingStyle.fill;
  // paint_240_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_240, paint_240_fill);

  allPaths[241].moveTo(114.37, 135.1);
  allPaths[241].lineTo(114.98, 86.5);
  allPaths[241].lineTo(113.75, 86.09);
  allPaths[241].lineTo(114.37, 135.1);
  allPaths[241].close();

  // Paint paint_241_fill = Paint()..style = PaintingStyle.fill;
  // paint_241_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_241, paint_241_fill);

  allPaths[242].moveTo(121.34, 129.51);
  allPaths[242].lineTo(122.07, 236.19);
  allPaths[242].lineTo(122.79, 129.51);
  allPaths[242].lineTo(121.34, 129.51);
  allPaths[242].close();

  // Paint paint_242_fill = Paint()..style = PaintingStyle.fill;
  // paint_242_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_242, paint_242_fill);

  allPaths[243].moveTo(111.12, 129.51);
  allPaths[243].lineTo(111.84, 234.34);
  allPaths[243].lineTo(112.56, 129.51);
  allPaths[243].lineTo(111.12, 129.51);
  allPaths[243].close();

  // Paint paint_243_fill = Paint()..style = PaintingStyle.fill;
  // paint_243_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_243, paint_243_fill);

  allPaths[244].moveTo(108.22, 129.51);
  allPaths[244].lineTo(108.94, 235.36);
  allPaths[244].lineTo(109.66, 129.51);
  allPaths[244].lineTo(108.22, 129.51);
  allPaths[244].close();

  // Paint paint_244_fill = Paint()..style = PaintingStyle.fill;
  // paint_244_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_244, paint_244_fill);

  allPaths[245].moveTo(114.25, 129.51);
  allPaths[245].lineTo(114.97, 234.88);
  allPaths[245].lineTo(115.7, 129.51);
  allPaths[245].lineTo(114.25, 129.51);
  allPaths[245].close();

  // Paint paint_245_fill = Paint()..style = PaintingStyle.fill;
  // paint_245_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_245, paint_245_fill);

  allPaths[246].moveTo(117.649, 129.51);
  allPaths[246].lineTo(118.369, 232.42);
  allPaths[246].lineTo(119.099, 129.51);
  allPaths[246].lineTo(117.649, 129.51);
  allPaths[246].close();

  // Paint paint_246_fill = Paint()..style = PaintingStyle.fill;
  // paint_246_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_246, paint_246_fill);

  allPaths[247].moveTo(98.5596, 129.51);
  allPaths[247].lineTo(99.2796, 234.46);
  allPaths[247].lineTo(99.9996, 129.51);
  allPaths[247].lineTo(98.5596, 129.51);
  allPaths[247].close();

  // Paint paint_247_fill = Paint()..style = PaintingStyle.fill;
  // paint_247_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_247, paint_247_fill);

  allPaths[248].moveTo(95.6597, 129.51);
  allPaths[248].lineTo(96.3797, 233.88);
  allPaths[248].lineTo(97.0997, 129.51);
  allPaths[248].lineTo(95.6597, 129.51);
  allPaths[248].close();

  // Paint paint_248_fill = Paint()..style = PaintingStyle.fill;
  // paint_248_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_248, paint_248_fill);

  allPaths[249].moveTo(101.689, 129.51);
  allPaths[249].lineTo(102.409, 232.91);
  allPaths[249].lineTo(103.139, 129.51);
  allPaths[249].lineTo(101.689, 129.51);
  allPaths[249].close();

  // Paint paint_249_fill = Paint()..style = PaintingStyle.fill;
  // paint_249_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_249, paint_249_fill);

  allPaths[250].moveTo(105.09, 129.51);
  allPaths[250].lineTo(105.81, 236.37);
  allPaths[250].lineTo(106.53, 129.51);
  allPaths[250].lineTo(105.09, 129.51);
  allPaths[250].close();

  // Paint paint_250_fill = Paint()..style = PaintingStyle.fill;
  // paint_250_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_250, paint_250_fill);

  allPaths[251].moveTo(92.29, 129.51);
  allPaths[251].lineTo(93.01, 236.19);
  allPaths[251].lineTo(93.74, 129.51);
  allPaths[251].lineTo(92.29, 129.51);
  allPaths[251].close();

  // Paint paint_251_fill = Paint()..style = PaintingStyle.fill;
  // paint_251_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_251, paint_251_fill);

  allPaths[252].moveTo(82.0601, 129.51);
  allPaths[252].lineTo(82.7801, 234.34);
  allPaths[252].lineTo(83.5101, 129.51);
  allPaths[252].lineTo(82.0601, 129.51);
  allPaths[252].close();

  // Paint paint_252_fill = Paint()..style = PaintingStyle.fill;
  // paint_252_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_252, paint_252_fill);

  allPaths[253].moveTo(79.1699, 129.51);
  allPaths[253].lineTo(79.8899, 235.36);
  allPaths[253].lineTo(80.6099, 129.51);
  allPaths[253].lineTo(79.1699, 129.51);
  allPaths[253].close();

  // Paint paint_253_fill = Paint()..style = PaintingStyle.fill;
  // paint_253_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_253, paint_253_fill);

  allPaths[254].moveTo(85.1997, 129.51);
  allPaths[254].lineTo(85.9197, 234.88);
  allPaths[254].lineTo(86.6397, 129.51);
  allPaths[254].lineTo(85.1997, 129.51);
  allPaths[254].close();

  // Paint paint_254_fill = Paint()..style = PaintingStyle.fill;
  // paint_254_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_254, paint_254_fill);

  allPaths[255].moveTo(88.5898, 129.51);
  allPaths[255].lineTo(89.3098, 232.42);
  allPaths[255].lineTo(90.0399, 129.51);
  allPaths[255].lineTo(88.5898, 129.51);
  allPaths[255].close();

  // Paint paint_255_fill = Paint()..style = PaintingStyle.fill;
  // paint_255_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_255, paint_255_fill);

  allPaths[256].moveTo(76.0298, 129.51);
  allPaths[256].lineTo(76.7498, 236.37);
  allPaths[256].lineTo(77.4798, 129.51);
  allPaths[256].lineTo(76.0298, 129.51);
  allPaths[256].close();

  // Paint paint_256_fill = Paint()..style = PaintingStyle.fill;
  // paint_256_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_256, paint_256_fill);

  allPaths[257].moveTo(46.1799, 215.56);
  allPaths[257].lineTo(25.2499, 215.56);
  allPaths[257].lineTo(25.2499, 198.34);
  allPaths[257].lineTo(11.6299, 198.34);
  allPaths[257].lineTo(11.6299, 183.44);
  allPaths[257].lineTo(-15.7401, 183.44);
  allPaths[257].lineTo(-15.7401, 198.34);
  allPaths[257].lineTo(-29.9601, 198.34);
  allPaths[257].lineTo(-29.9601, 215.56);
  allPaths[257].lineTo(-75.1001, 215.56);
  allPaths[257].lineTo(-75.1001, 233.57);
  allPaths[257].lineTo(59.0699, 233.57);
  allPaths[257].lineTo(59.3899, 217.86);
  allPaths[257].lineTo(46.1799, 215.56);
  allPaths[257].close();
  //
  // Paint paint_257_fill = Paint()..style = PaintingStyle.fill;
  // paint_257_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_257, paint_257_fill);

  allPaths[258].moveTo(-0.149902, 178.59);
  allPaths[258].lineTo(0.830078, 227.69);
  allPaths[258].lineTo(1.8201, 178.38);
  allPaths[258].lineTo(-0.149902, 178.59);
  allPaths[258].close();

  // Paint paint_258_fill = Paint()..style = PaintingStyle.fill;
  // paint_258_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_258, paint_258_fill);

  allPaths[259].moveTo(3.40039, 178.13);
  allPaths[259].lineTo(4.39041, 227.29);
  allPaths[259].lineTo(5.37039, 177.92);
  allPaths[259].lineTo(3.40039, 178.13);
  allPaths[259].close();

  // Paint paint_259_fill = Paint()..style = PaintingStyle.fill;
  // paint_259_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_259, paint_259_fill);

  allPaths[260].moveTo(10.5703, 177.36);
  allPaths[260].lineTo(11.5603, 228.8);
  allPaths[260].lineTo(12.5403, 177.15);
  allPaths[260].lineTo(10.5703, 177.36);
  allPaths[260].close();

  // Paint paint_260_fill = Paint()..style = PaintingStyle.fill;
  // paint_260_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_260, paint_260_fill);

  allPaths[261].moveTo(6.88037, 177.76);
  allPaths[261].lineTo(7.86035, 226.84);
  allPaths[261].lineTo(8.85037, 177.55);
  allPaths[261].lineTo(6.88037, 177.76);
  allPaths[261].close();

  // Paint paint_261_fill = Paint()..style = PaintingStyle.fill;
  // paint_261_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_261, paint_261_fill);

  allPaths[262].moveTo(-0.0996094, 215.36);
  allPaths[262].lineTo(0.92041, 239.81);
  allPaths[262].lineTo(1.95041, 215.36);
  allPaths[262].lineTo(-0.0996094, 215.36);
  allPaths[262].close();

  // Paint paint_262_fill = Paint()..style = PaintingStyle.fill;
  // paint_262_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_262, paint_262_fill);

  allPaths[263].moveTo(7.38037, 215.36);
  allPaths[263].lineTo(8.40036, 240.55);
  allPaths[263].lineTo(9.43036, 215.36);
  allPaths[263].lineTo(7.38037, 215.36);
  allPaths[263].close();

  // Paint paint_263_fill = Paint()..style = PaintingStyle.fill;
  // paint_263_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_263, paint_263_fill);

  allPaths[264].moveTo(3.52002, 215.36);
  allPaths[264].lineTo(4.54004, 239.59);
  allPaths[264].lineTo(5.57004, 215.36);
  allPaths[264].lineTo(3.52002, 215.36);
  allPaths[264].close();

  // Paint paint_264_fill = Paint()..style = PaintingStyle.fill;
  // paint_264_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_264, paint_264_fill);

  allPaths[265].moveTo(17.1099, 187.65);
  allPaths[265].lineTo(18.0899, 247.08);
  allPaths[265].lineTo(19.0699, 187.38);
  allPaths[265].lineTo(17.1099, 187.65);
  allPaths[265].close();

  // Paint paint_265_fill = Paint()..style = PaintingStyle.fill;
  // paint_265_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_265, paint_265_fill);

  allPaths[266].moveTo(11.77, 188.36);
  allPaths[266].lineTo(12.74, 247.87);
  allPaths[266].lineTo(13.73, 188.1);
  allPaths[266].lineTo(11.77, 188.36);
  allPaths[266].close();

  // Paint paint_266_fill = Paint()..style = PaintingStyle.fill;
  // paint_266_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_266, paint_266_fill);

  allPaths[267].moveTo(14.3599, 188.01);
  allPaths[267].lineTo(15.3399, 246.95);
  allPaths[267].lineTo(16.3299, 187.75);
  allPaths[267].lineTo(14.3599, 188.01);
  allPaths[267].close();

  // Paint paint_267_fill = Paint()..style = PaintingStyle.fill;
  // paint_267_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_267, paint_267_fill);

  allPaths[268].moveTo(20.0103, 187.26);
  allPaths[268].lineTo(20.9902, 246.29);
  allPaths[268].lineTo(21.9803, 187);
  allPaths[268].lineTo(20.0103, 187.26);
  allPaths[268].close();

  // Paint paint_268_fill = Paint()..style = PaintingStyle.fill;
  // paint_268_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_268, paint_268_fill);

  allPaths[269].moveTo(26.3599, 186.41);
  allPaths[269].lineTo(27.3399, 246.86);
  allPaths[269].lineTo(28.3299, 186.15);
  allPaths[269].lineTo(26.3599, 186.41);
  allPaths[269].close();

  // Paint paint_269_fill = Paint()..style = PaintingStyle.fill;
  // paint_269_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_269, paint_269_fill);

  allPaths[270].moveTo(23.0898, 186.85);
  allPaths[270].lineTo(24.0699, 247.51);
  allPaths[270].lineTo(25.0598, 186.59);
  allPaths[270].lineTo(23.0898, 186.85);
  allPaths[270].close();

  // Paint paint_270_fill = Paint()..style = PaintingStyle.fill;
  // paint_270_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_270, paint_270_fill);

  allPaths[271].moveTo(33.5303, 185.46);
  allPaths[271].lineTo(34.5103, 246.8);
  allPaths[271].lineTo(35.5003, 185.19);
  allPaths[271].lineTo(33.5303, 185.46);
  allPaths[271].close();

  // Paint paint_271_fill = Paint()..style = PaintingStyle.fill;
  // paint_271_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_271, paint_271_fill);

  allPaths[272].moveTo(29.8301, 185.95);
  allPaths[272].lineTo(30.8101, 245.32);
  allPaths[272].lineTo(31.8001, 185.69);
  allPaths[272].lineTo(29.8301, 185.95);
  allPaths[272].close();

  // Paint paint_272_fill = Paint()..style = PaintingStyle.fill;
  // paint_272_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_272, paint_272_fill);

  allPaths[273].moveTo(37.0801, 184.88);
  allPaths[273].lineTo(38.0701, 246.31);
  allPaths[273].lineTo(39.0501, 184.62);
  allPaths[273].lineTo(37.0801, 184.88);
  allPaths[273].close();

  // Paint paint_273_fill = Paint()..style = PaintingStyle.fill;
  // paint_273_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_273, paint_273_fill);

  allPaths[274].moveTo(44.2603, 183.92);
  allPaths[274].lineTo(45.2402, 248.19);
  allPaths[274].lineTo(46.2303, 183.66);
  allPaths[274].lineTo(44.2603, 183.92);
  allPaths[274].close();

  // Paint paint_274_fill = Paint()..style = PaintingStyle.fill;
  // paint_274_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_274, paint_274_fill);

  allPaths[275].moveTo(40.5601, 184.42);
  allPaths[275].lineTo(41.5401, 245.74);
  allPaths[275].lineTo(42.5301, 184.15);
  allPaths[275].lineTo(40.5601, 184.42);
  allPaths[275].close();

  // Paint paint_275_fill = Paint()..style = PaintingStyle.fill;
  // paint_275_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_275, paint_275_fill);

  allPaths[276].moveTo(128.56, 81.22);
  allPaths[276].cubicTo(129.53, 80.87, 132.45, 79.89, 132.45, 79.89);
  allPaths[276].cubicTo(133.71, 79.49, 140.05, 77.85, 141.43, 77.58);
  allPaths[276].lineTo(142.48, 77.39);
  allPaths[276].cubicTo(143.96, 77.13, 150.72, 76.51, 152.1, 76.49);
  allPaths[276].lineTo(153.18, 76.49);
  allPaths[276].cubicTo(154.56, 76.5, 155.95, 76.57, 157.34, 76.68);
  allPaths[276].lineTo(158.41, 76.78);
  allPaths[276].cubicTo(169.63, 78.33, 175.75, 80.86, 176.72, 81.21);
  allPaths[276].cubicTo(165.45, 128.54, 167.5, 180.45, 176.72, 234.82);
  allPaths[276].lineTo(128.56, 234.82);
  allPaths[276].cubicTo(137.78, 180.45, 139.83, 128.54, 128.56, 81.21);
  allPaths[276].lineTo(128.56, 81.22);
  allPaths[276].close();

  // Paint paint_276_fill = Paint()..style = PaintingStyle.fill;
  // paint_276_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_276, paint_276_fill);

  allPaths[277].moveTo(162.51, 45.95);
  allPaths[277].lineTo(103.83, 128.85);
  allPaths[277].lineTo(164.53, 46.86);
  allPaths[277].lineTo(162.51, 45.95);
  allPaths[277].close();

  // Paint paint_277_fill = Paint()..style = PaintingStyle.fill;
  // paint_277_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_277, paint_277_fill);

  allPaths[278].moveTo(157, 43.47);
  allPaths[278].lineTo(98.25, 126.48);
  allPaths[278].lineTo(159.03, 44.38);
  allPaths[278].lineTo(157, 43.47);
  allPaths[278].close();

  // Paint paint_278_fill = Paint()..style = PaintingStyle.fill;
  // paint_278_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_278, paint_278_fill);

  allPaths[279].moveTo(159.68, 44.6699);
  allPaths[279].lineTo(101.49, 126.9);
  allPaths[279].lineTo(161.7, 45.5899);
  allPaths[279].lineTo(159.68, 44.6699);
  allPaths[279].close();

  // Paint paint_279_fill = Paint()..style = PaintingStyle.fill;
  // paint_279_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_279, paint_279_fill);

  allPaths[280].moveTo(165.5, 47.2999);
  allPaths[280].lineTo(107.22, 129.64);
  allPaths[280].lineTo(167.52, 48.2099);
  allPaths[280].lineTo(165.5, 47.2999);
  allPaths[280].close();

  // Paint paint_280_fill = Paint()..style = PaintingStyle.fill;
  // paint_280_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_280, paint_280_fill);

  allPaths[281].moveTo(172.03, 50.24);
  allPaths[281].lineTo(112.33, 134.56);
  allPaths[281].lineTo(174.06, 51.16);
  allPaths[281].lineTo(172.03, 50.24);
  allPaths[281].close();

  // Paint paint_281_fill = Paint()..style = PaintingStyle.fill;
  // paint_281_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_281, paint_281_fill);

  allPaths[282].moveTo(168.66, 48.73);
  allPaths[282].lineTo(108.75, 133.34);
  allPaths[282].lineTo(170.69, 49.64);
  allPaths[282].lineTo(168.66, 48.73);
  allPaths[282].close();

  // Paint paint_282_fill = Paint()..style = PaintingStyle.fill;
  // paint_282_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_282, paint_282_fill);

  allPaths[283].moveTo(179.41, 53.5699);
  allPaths[283].lineTo(118.82, 139.13);
  allPaths[283].lineTo(181.44, 54.4899);
  allPaths[283].lineTo(179.41, 53.5699);
  allPaths[283].close();

  // Paint paint_283_fill = Paint()..style = PaintingStyle.fill;
  // paint_283_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_283, paint_283_fill);

  allPaths[284].moveTo(175.6, 51.86);
  allPaths[284].lineTo(116.98, 134.68);
  allPaths[284].lineTo(177.63, 52.77);
  allPaths[284].lineTo(175.6, 51.86);
  allPaths[284].close();
  //
  // Paint paint_284_fill = Paint()..style = PaintingStyle.fill;
  // paint_284_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_284, paint_284_fill);

  allPaths[285].moveTo(183.18, 55.08);
  allPaths[285].lineTo(122.5, 140.75);
  allPaths[285].lineTo(185.21, 55.99);
  allPaths[285].lineTo(183.18, 55.08);
  allPaths[285].close();

  // Paint paint_285_fill = Paint()..style = PaintingStyle.fill;
  // paint_285_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_285, paint_285_fill);

  allPaths[286].moveTo(190.56, 58.4099);
  allPaths[286].lineTo(127.04, 148.01);
  allPaths[286].lineTo(192.59, 59.3199);
  allPaths[286].lineTo(190.56, 58.4099);
  allPaths[286].close();

  // Paint paint_286_fill = Paint()..style = PaintingStyle.fill;
  // paint_286_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_286, paint_286_fill);

  allPaths[287].moveTo(186.75, 56.6899);
  allPaths[287].lineTo(126.18, 142.21);
  allPaths[287].lineTo(188.78, 57.6099);
  allPaths[287].lineTo(186.75, 56.6899);
  allPaths[287].close();

  // Paint paint_287_fill = Paint()..style = PaintingStyle.fill;
  // paint_287_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_287, paint_287_fill);

  allPaths[288].moveTo(179.41, 88.76);
  allPaths[288].lineTo(102.42, 196.95);
  allPaths[288].lineTo(181.51, 89.56);
  allPaths[288].lineTo(179.41, 88.76);
  allPaths[288].close();

  // Paint paint_288_fill = Paint()..style = PaintingStyle.fill;
  // paint_288_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_288, paint_288_fill);

  allPaths[289].moveTo(173.68, 86.59);
  allPaths[289].lineTo(96.5898, 194.91);
  allPaths[289].lineTo(175.78, 87.38);
  allPaths[289].lineTo(173.68, 86.59);
  allPaths[289].close();

  // Paint paint_289_fill = Paint()..style = PaintingStyle.fill;
  // paint_289_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_289, paint_289_fill);

  allPaths[290].moveTo(176.47, 87.64);
  allPaths[290].lineTo(100.12, 194.95);
  allPaths[290].lineTo(178.57, 88.44);
  allPaths[290].lineTo(176.47, 87.64);
  allPaths[290].close();

  // Paint paint_290_fill = Paint()..style = PaintingStyle.fill;
  // paint_290_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_290, paint_290_fill);

  allPaths[291].moveTo(182.52, 89.9399);
  allPaths[291].lineTo(106.06, 197.4);
  allPaths[291].lineTo(184.62, 90.7399);
  allPaths[291].lineTo(182.52, 89.9399);
  allPaths[291].close();

  // Paint paint_291_fill = Paint()..style = PaintingStyle.fill;
  // paint_291_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_291, paint_291_fill);

  allPaths[292].moveTo(189.31, 92.53);
  allPaths[292].lineTo(110.99, 202.57);
  allPaths[292].lineTo(191.42, 93.33);
  allPaths[292].lineTo(189.31, 92.53);
  allPaths[292].close();

  // Paint paint_292_fill = Paint()..style = PaintingStyle.fill;
  // paint_292_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_292, paint_292_fill);

  allPaths[293].moveTo(185.81, 91.2);
  allPaths[293].lineTo(107.21, 201.62);
  allPaths[293].lineTo(187.92, 92);
  allPaths[293].lineTo(185.81, 91.2);
  allPaths[293].close();

  // Paint paint_293_fill = Paint()..style = PaintingStyle.fill;
  // paint_293_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_293, paint_293_fill);

  allPaths[294].moveTo(196.99, 95.45);
  allPaths[294].lineTo(117.5, 207.11);
  allPaths[294].lineTo(199.09, 96.25);
  allPaths[294].lineTo(196.99, 95.45);
  allPaths[294].close();

  // Paint paint_294_fill = Paint()..style = PaintingStyle.fill;
  // paint_294_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_294, paint_294_fill);

  allPaths[295].moveTo(193.02, 93.95);
  allPaths[295].lineTo(116.11, 202.03);
  allPaths[295].lineTo(195.13, 94.75);
  allPaths[295].lineTo(193.02, 93.95);
  allPaths[295].close();

  // Paint paint_295_fill = Paint()..style = PaintingStyle.fill;
  // paint_295_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_295, paint_295_fill);

  allPaths[296].moveTo(200.93, 96.71);
  allPaths[296].lineTo(121.33, 208.52);
  allPaths[296].lineTo(203.04, 97.52);
  allPaths[296].lineTo(200.93, 96.71);
  allPaths[296].close();

  // Paint paint_296_fill = Paint()..style = PaintingStyle.fill;
  // paint_296_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_296, paint_296_fill);

  allPaths[297].moveTo(208.61, 99.63);
  allPaths[297].lineTo(125.29, 216.58);
  allPaths[297].lineTo(210.71, 100.44);
  allPaths[297].lineTo(208.61, 99.63);
  allPaths[297].close();

  // Paint paint_297_fill = Paint()..style = PaintingStyle.fill;
  // paint_297_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_297, paint_297_fill);

  allPaths[298].moveTo(204.64, 98.13);
  allPaths[298].lineTo(125.18, 209.74);
  allPaths[298].lineTo(206.75, 98.93);
  allPaths[298].lineTo(204.64, 98.13);
  allPaths[298].close();

  // Paint paint_298_fill = Paint()..style = PaintingStyle.fill;
  // paint_298_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_298, paint_298_fill);

  allPaths[299].moveTo(198.06, 132.52);
  allPaths[299].lineTo(104.65, 263.78);
  allPaths[299].lineTo(200.61, 133.48);
  allPaths[299].lineTo(198.06, 132.52);
  allPaths[299].close();

  // Paint paint_299_fill = Paint()..style = PaintingStyle.fill;
  // paint_299_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_299, paint_299_fill);

  allPaths[300].moveTo(191.11, 129.88);
  allPaths[300].lineTo(97.5801, 261.31);
  allPaths[300].lineTo(193.66, 130.85);
  allPaths[300].lineTo(191.11, 129.88);
  allPaths[300].close();

  // Paint paint_300_fill = Paint()..style = PaintingStyle.fill;
  // paint_300_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_300, paint_300_fill);

  allPaths[301].moveTo(194.49, 131.15);
  allPaths[301].lineTo(101.86, 261.36);
  allPaths[301].lineTo(197.04, 132.13);
  allPaths[301].lineTo(194.49, 131.15);
  allPaths[301].close();

  // Paint paint_301_fill = Paint()..style = PaintingStyle.fill;
  // paint_301_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_301, paint_301_fill);

  allPaths[302].moveTo(201.83, 133.95);
  allPaths[302].lineTo(109.06, 264.34);
  allPaths[302].lineTo(204.39, 134.92);
  allPaths[302].lineTo(201.83, 133.95);
  allPaths[302].close();

  // Paint paint_302_fill = Paint()..style = PaintingStyle.fill;
  // paint_302_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_302, paint_302_fill);

  allPaths[303].moveTo(210.07, 137.09);
  allPaths[303].lineTo(115.04, 270.6);
  allPaths[303].lineTo(212.63, 138.06);
  allPaths[303].lineTo(210.07, 137.09);
  allPaths[303].close();

  // Paint paint_303_fill = Paint()..style = PaintingStyle.fill;
  // paint_303_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_303, paint_303_fill);

  allPaths[304].moveTo(205.83, 135.47);
  allPaths[304].lineTo(110.46, 269.45);
  allPaths[304].lineTo(208.38, 136.45);
  allPaths[304].lineTo(205.83, 135.47);
  allPaths[304].close();

  // Paint paint_304_fill = Paint()..style = PaintingStyle.fill;
  // paint_304_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_304, paint_304_fill);

  allPaths[305].moveTo(219.39, 140.63);
  allPaths[305].lineTo(122.94, 276.11);
  allPaths[305].lineTo(221.95, 141.61);
  allPaths[305].lineTo(219.39, 140.63);
  allPaths[305].close();

  // Paint paint_305_fill = Paint()..style = PaintingStyle.fill;
  // paint_305_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_305, paint_305_fill);

  allPaths[306].moveTo(214.58, 138.81);
  allPaths[306].lineTo(121.26, 269.95);
  allPaths[306].lineTo(217.14, 139.78);
  allPaths[306].lineTo(214.58, 138.81);
  allPaths[306].close();

  // Paint paint_306_fill = Paint()..style = PaintingStyle.fill;
  // paint_306_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_306, paint_306_fill);

  allPaths[307].moveTo(224.17, 142.16);
  allPaths[307].lineTo(127.59, 277.82);
  allPaths[307].lineTo(226.73, 143.14);
  allPaths[307].lineTo(224.17, 142.16);
  allPaths[307].close();

  // Paint paint_307_fill = Paint()..style = PaintingStyle.fill;
  // paint_307_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_307, paint_307_fill);

  allPaths[308].moveTo(233.49, 145.71);
  allPaths[308].lineTo(132.39, 287.61);
  allPaths[308].lineTo(236.04, 146.68);
  allPaths[308].lineTo(233.49, 145.71);
  allPaths[308].close();

  // Paint paint_308_fill = Paint()..style = PaintingStyle.fill;
  // paint_308_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_308, paint_308_fill);

  allPaths[309].moveTo(228.68, 143.88);
  allPaths[309].lineTo(132.26, 279.31);
  allPaths[309].lineTo(231.24, 144.86);
  allPaths[309].lineTo(228.68, 143.88);
  allPaths[309].close();

  // Paint paint_309_fill = Paint()..style = PaintingStyle.fill;
  // paint_309_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_309, paint_309_fill);

  allPaths[310].moveTo(204.68, 55.37);
  allPaths[310].cubicTo(216.72, 57.17, 219.46, 71.32, 220.84, 90.22);
  allPaths[310].cubicTo(224.49, 141.31, 222.77, 188.13, 220.73, 235.66);
  allPaths[310].lineTo(182.56, 235.66);
  allPaths[310].cubicTo(180.52, 188.13, 178.81, 141.3, 182.45, 90.22);
  allPaths[310].cubicTo(183.85, 71.02, 186.66, 56.7, 199.21, 55.29);
  allPaths[310].lineTo(200.24, 53.52);
  allPaths[310].lineTo(201.6, 34.76);
  allPaths[310].cubicTo(201.51, 34.63, 202.34, 34.63, 202.25, 34.76);
  allPaths[310].lineTo(203.61, 53.52);
  allPaths[310].lineTo(204.68, 55.37);
  allPaths[310].close();

  // Paint paint_310_fill = Paint()..style = PaintingStyle.fill;
  // paint_310_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_310, paint_310_fill);

  allPaths[311].moveTo(195.84, 242.62);
  allPaths[311].cubicTo(192.99, 175.31, 192.32, 98.3101, 194.97, 31.0401);
  allPaths[311].cubicTo(195.55, 31.0601, 196.13, 30.8101, 196.7, 31.0401);
  allPaths[311].cubicTo(194.24, 98.1701, 193.57, 175.42, 195.84, 242.62);
  allPaths[311].close();

  // Paint paint_311_fill = Paint()..style = PaintingStyle.fill;
  // paint_311_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_311, paint_311_fill);

  allPaths[312].moveTo(199.03, 242.67);
  allPaths[312].cubicTo(197.62, 172.97, 196.97, 100.76, 198.2, 31.09);
  allPaths[312].cubicTo(198.76, 31.48, 199.33, 30.5, 199.86, 31.09);
  allPaths[312].cubicTo(198.82, 100.25, 198.18, 173.45, 199.03, 242.67);
  allPaths[312].close();

  // Paint paint_312_fill = Paint()..style = PaintingStyle.fill;
  // paint_312_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_312, paint_312_fill);

  allPaths[313].moveTo(189.82, 242.68);
  allPaths[313].cubicTo(184.31, 179.74, 183.63, 93.99, 188.92, 31.1);
  allPaths[313].cubicTo(189.56, 30.46, 190.07, 31.54, 190.7, 31.1);
  allPaths[313].cubicTo(185.59, 94.54, 184.91, 179.19, 189.82, 242.68);
  allPaths[313].close();

  // Paint paint_313_fill = Paint()..style = PaintingStyle.fill;
  // paint_313_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_313, paint_313_fill);

  allPaths[314].moveTo(192.75, 242.64);
  allPaths[314].cubicTo(188.53, 177.58, 187.86, 96.0801, 191.87, 31.0601);
  allPaths[314].cubicTo(192.48, 30.7501, 193.04, 31.1901, 193.63, 31.0601);
  allPaths[314].cubicTo(189.81, 96.2901, 189.13, 177.37, 192.75, 242.64);
  allPaths[314].close();
  //
  // Paint paint_314_fill = Paint()..style = PaintingStyle.fill;
  // paint_314_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_314, paint_314_fill);

  allPaths[315].moveTo(182.05, 242.8);
  allPaths[315].cubicTo(173.15, 185.51, 172.49, 88.46, 181.15, 31.22);
  allPaths[315].cubicTo(181.9, 29.72, 182.12, 32.52, 182.86, 31.22);
  allPaths[315].cubicTo(174.35, 89.87, 173.72, 184.1, 182.05, 242.8);
  allPaths[315].close();

  // Paint paint_315_fill = Paint()..style = PaintingStyle.fill;
  // paint_315_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_315, paint_315_fill);

  allPaths[316].moveTo(179.83, 242.84);
  allPaths[316].cubicTo(169.98, 187.25, 169.33, 86.82, 178.93, 31.26);
  allPaths[316].cubicTo(179.73, 29.5, 179.82, 32.82, 180.59, 31.26);
  allPaths[316].cubicTo(171.12, 88.49, 170.51, 185.57, 179.82, 242.84);
  allPaths[316].lineTo(179.83, 242.84);
  allPaths[316].close();

  // Paint paint_316_fill = Paint()..style = PaintingStyle.fill;
  // paint_316_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_316, paint_316_fill);

  allPaths[317].moveTo(184.46, 242.77);
  allPaths[317].cubicTo(176.6, 183.71, 175.93, 90.2201, 183.55, 31.1901);
  allPaths[317].cubicTo(184.26, 29.9701, 184.6, 32.2301, 185.3, 31.1901);
  allPaths[317].cubicTo(177.84, 91.3501, 177.19, 182.56, 184.46, 242.77);
  allPaths[317].close();

  // Paint paint_317_fill = Paint()..style = PaintingStyle.fill;
  // paint_317_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_317, paint_317_fill);

  allPaths[318].moveTo(187.06, 242.72);
  allPaths[318].cubicTo(180.33, 181.78, 179.65, 92.0501, 186.15, 31.1401);
  allPaths[318].cubicTo(186.83, 30.2001, 187.26, 31.8901, 187.92, 31.1401);
  allPaths[318].cubicTo(181.59, 92.9001, 180.92, 180.92, 187.06, 242.72);
  allPaths[318].close();

  // Paint paint_318_fill = Paint()..style = PaintingStyle.fill;
  // paint_318_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_318, paint_318_fill);

  allPaths[319].moveTo(220.13, 242.62);
  allPaths[319].cubicTo(228.13, 175.31, 227.45, 98.3101, 219.28, 31.0401);
  allPaths[319].cubicTo(219.86, 31.0601, 220.41, 30.8101, 221.01, 31.0401);
  allPaths[319].cubicTo(229.37, 98.1701, 228.71, 175.42, 220.14, 242.62);
  allPaths[319].lineTo(220.13, 242.62);
  allPaths[319].close();

  // Paint paint_319_fill = Paint()..style = PaintingStyle.fill;
  // paint_319_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_319, paint_319_fill);

  allPaths[320].moveTo(223.31, 242.67);
  allPaths[320].cubicTo(232.78, 172.97, 232.14, 100.76, 222.5, 31.09);
  allPaths[320].cubicTo(223.12, 31.48, 223.53, 30.5, 224.16, 31.09);
  allPaths[320].cubicTo(233.97, 100.25, 233.32, 173.45, 223.3, 242.67);
  allPaths[320].lineTo(223.31, 242.67);
  allPaths[320].close();

  // Paint paint_320_fill = Paint()..style = PaintingStyle.fill;
  // paint_320_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_320, paint_320_fill);

  allPaths[321].moveTo(214.1, 242.68);
  allPaths[321].cubicTo(219.37, 179.74, 218.69, 93.99, 213.23, 31.1);
  allPaths[321].cubicTo(213.77, 30.46, 214.45, 31.54, 215.01, 31.1);
  allPaths[321].cubicTo(220.66, 94.54, 219.97, 179.19, 214.1, 242.68);
  allPaths[321].close();

  // Paint paint_321_fill = Paint()..style = PaintingStyle.fill;
  // paint_321_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(allPaths[321], paint_321_fill);

  allPaths[322].moveTo(217.04, 242.64);
  allPaths[322].cubicTo(223.63, 177.58, 222.96, 96.0801, 216.17, 31.0601);
  allPaths[322].cubicTo(216.73, 30.7501, 217.36, 31.1901, 217.93, 31.0601);
  allPaths[322].cubicTo(224.9, 96.2901, 224.22, 177.37, 217.04, 242.64);
  allPaths[322].close();
  //
  // Paint paint_322_fill = Paint()..style = PaintingStyle.fill;
  // paint_322_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_322, paint_322_fill);

  allPaths[323].moveTo(205.38, 242.8);
  allPaths[323].cubicTo(206.77, 185.51, 206.13, 88.46, 204.55, 31.22);
  allPaths[323].cubicTo(205.08, 29.72, 205.72, 32.52, 206.26, 31.22);
  allPaths[323].cubicTo(208.02, 89.87, 207.36, 184.1, 205.39, 242.8);
  allPaths[323].lineTo(205.38, 242.8);
  allPaths[323].close();

  // Paint paint_323_fill = Paint()..style = PaintingStyle.fill;
  // paint_323_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_323, paint_323_fill);

  allPaths[324].moveTo(202.21, 242.84);
  allPaths[324].cubicTo(202.21, 187.25, 201.59, 86.82, 201.39, 31.26);
  allPaths[324].cubicTo(201.93, 29.5, 202.5, 32.82, 203.05, 31.26);
  allPaths[324].cubicTo(203.41, 88.49, 202.77, 185.57, 202.21, 242.84);
  allPaths[324].close();

  // Paint paint_324_fill = Paint()..style = PaintingStyle.fill;
  // paint_324_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_324, paint_324_fill);

  allPaths[325].moveTo(208.73, 242.77);
  allPaths[325].cubicTo(211.6, 183.71, 210.95, 90.2201, 207.88, 31.1901);
  allPaths[325].cubicTo(208.4, 29.9701, 209.09, 32.2301, 209.63, 31.1901);
  allPaths[325].cubicTo(212.88, 91.3501, 212.2, 182.56, 208.73, 242.77);
  allPaths[325].close();

  // Paint paint_325_fill = Paint()..style = PaintingStyle.fill;
  // paint_325_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_325, paint_325_fill);

  allPaths[326].moveTo(211.33, 242.72);
  allPaths[326].cubicTo(215.36, 181.78, 214.69, 92.0501, 210.47, 31.1401);
  allPaths[326].cubicTo(211, 30.2001, 211.69, 31.8901, 212.24, 31.1401);
  allPaths[326].cubicTo(216.65, 92.9001, 215.97, 180.92, 211.34, 242.72);
  allPaths[326].lineTo(211.33, 242.72);
  allPaths[326].close();

  // Paint paint_326_fill = Paint()..style = PaintingStyle.fill;
  // paint_326_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_326, paint_326_fill);

  allPaths[327].moveTo(32.3099, 232.74);
  allPaths[327].cubicTo(29.9799, 220.01, 28.6699, 205.63, 28.6699, 190.4);
  allPaths[327].cubicTo(28.6699, 153.86, 36.2299, 122.17, 47.2699, 106.53);
  allPaths[327].cubicTo(58.3199, 122.17, 65.8699, 153.85, 65.8699, 190.4);
  allPaths[327].cubicTo(65.8699, 205.63, 64.5599, 220.01, 62.2299, 232.74);
  allPaths[327].lineTo(32.3099, 232.74);
  allPaths[327].close();

  // Paint paint_327_fill = Paint()..style = PaintingStyle.fill;
  // paint_327_fill.color = Colors.white.withOpacity(1.0);
  // canvas.drawPath(path_327, paint_327_fill);

  allPaths[328].moveTo(45.4397, 183.58);
  allPaths[328].lineTo(45.9497, 96.81);
  allPaths[328].lineTo(44.9297, 96.16);
  allPaths[328].lineTo(45.4397, 183.58);
  allPaths[328].close();

  // Paint paint_328_fill = Paint()..style = PaintingStyle.fill;
  // paint_328_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_328, paint_328_fill);

  allPaths[329].moveTo(43.53, 183.58);
  allPaths[329].lineTo(44.03, 95.58);
  allPaths[329].lineTo(43.02, 94.92);
  allPaths[329].lineTo(43.53, 183.58);
  allPaths[329].close();

  // Paint paint_329_fill = Paint()..style = PaintingStyle.fill;
  // paint_329_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_329, paint_329_fill);

  allPaths[330].moveTo(41.76, 183.58);
  allPaths[330].lineTo(42.27, 95.58);
  allPaths[330].lineTo(41.25, 94.92);
  allPaths[330].lineTo(41.76, 183.58);
  allPaths[330].close();

  // Paint paint_330_fill = Paint()..style = PaintingStyle.fill;
  // paint_330_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_330, paint_330_fill);

  allPaths[331].moveTo(39.8801, 183.58);
  allPaths[331].lineTo(40.3801, 94.6001);
  allPaths[331].lineTo(39.3701, 93.9501);
  allPaths[331].lineTo(39.8801, 183.58);
  allPaths[331].close();

  // Paint paint_331_fill = Paint()..style = PaintingStyle.fill;
  // paint_331_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_331, paint_331_fill);

  allPaths[332].moveTo(38.1797, 183.58);
  allPaths[332].lineTo(38.6797, 94.4101);
  allPaths[332].lineTo(37.6597, 93.7601);
  allPaths[332].lineTo(38.1797, 183.58);
  allPaths[332].close();

  // Paint paint_332_fill = Paint()..style = PaintingStyle.fill;
  // paint_332_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_332, paint_332_fill);

  allPaths[333].moveTo(36.5, 181.03);
  allPaths[333].lineTo(37, 93.0201);
  allPaths[333].lineTo(35.98, 92.3701);
  allPaths[333].lineTo(36.5, 181.03);
  allPaths[333].close();
  //
  // Paint paint_333_fill = Paint()..style = PaintingStyle.fill;
  // paint_333_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_333, paint_333_fill);

  allPaths[334].moveTo(34.7297, 181.03);
  allPaths[334].lineTo(35.2397, 93.0201);
  allPaths[334].lineTo(34.2197, 92.3701);
  allPaths[334].lineTo(34.7297, 181.03);
  allPaths[334].close();

  // Paint paint_334_fill = Paint()..style = PaintingStyle.fill;
  // paint_334_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_334, paint_334_fill);

  allPaths[335].moveTo(32.8499, 181.03);
  allPaths[335].lineTo(33.3499, 92.0501);
  allPaths[335].lineTo(32.3398, 91.4001);
  allPaths[335].lineTo(32.8499, 181.03);
  allPaths[335].close();

  // Paint paint_335_fill = Paint()..style = PaintingStyle.fill;
  // paint_335_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_335, paint_335_fill);

  allPaths[336].moveTo(31.1399, 181.03);
  allPaths[336].lineTo(31.6499, 91.8601);
  allPaths[336].lineTo(30.6299, 91.2101);
  allPaths[336].lineTo(31.1399, 181.03);
  allPaths[336].close();

  // Paint paint_336_fill = Paint()..style = PaintingStyle.fill;
  // paint_336_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_336, paint_336_fill);

  allPaths[337].moveTo(48.9299, 183.58);
  allPaths[337].lineTo(49.4399, 99.0601);
  allPaths[337].lineTo(48.4199, 98.4001);
  allPaths[337].lineTo(48.9299, 183.58);
  allPaths[337].close();

  // Paint paint_337_fill = Paint()..style = PaintingStyle.fill;
  // paint_337_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_337, paint_337_fill);

  allPaths[338].moveTo(47.24, 183.58);
  allPaths[338].lineTo(47.74, 97.9701);
  allPaths[338].lineTo(46.73, 97.3101);
  allPaths[338].lineTo(47.24, 183.58);
  allPaths[338].close();

  // Paint paint_338_fill = Paint()..style = PaintingStyle.fill;
  // paint_338_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_338, paint_338_fill);

  allPaths[339].moveTo(53.45, 183.58);
  allPaths[339].lineTo(53.95, 101.96);
  allPaths[339].lineTo(52.9399, 101.31);
  allPaths[339].lineTo(53.45, 183.58);
  allPaths[339].close();

  // Paint paint_339_fill = Paint()..style = PaintingStyle.fill;
  // paint_339_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_339, paint_339_fill);

  allPaths[340].moveTo(54.7898, 183.58);
  allPaths[340].lineTo(55.2998, 102.83);
  allPaths[340].lineTo(54.2798, 102.17);
  allPaths[340].lineTo(54.7898, 183.58);
  allPaths[340].close();

  // Paint paint_340_fill = Paint()..style = PaintingStyle.fill;
  // paint_340_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_340, paint_340_fill);

  allPaths[341].moveTo(52.0298, 183.58);
  allPaths[341].lineTo(52.5298, 101.05);
  allPaths[341].lineTo(51.5098, 100.39);
  allPaths[341].lineTo(52.0298, 183.58);
  allPaths[341].close();

  // Paint paint_341_fill = Paint()..style = PaintingStyle.fill;
  // paint_341_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_341, paint_341_fill);

  allPaths[342].moveTo(50.5197, 183.58);
  allPaths[342].lineTo(51.0298, 100.08);
  allPaths[342].lineTo(50.0098, 99.42);
  allPaths[342].lineTo(50.5197, 183.58);
  allPaths[342].close();

  // Paint paint_342_fill = Paint()..style = PaintingStyle.fill;
  // paint_342_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_342, paint_342_fill);

  allPaths[343].moveTo(56.1899, 183.58);
  allPaths[343].lineTo(56.6899, 103.6);
  allPaths[343].lineTo(55.6699, 102.94);
  allPaths[343].lineTo(56.1899, 183.58);
  allPaths[343].close();

  // Paint paint_343_fill = Paint()..style = PaintingStyle.fill;
  // paint_343_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_343, paint_343_fill);

  allPaths[344].moveTo(60.7, 183.58);
  allPaths[344].lineTo(61.2099, 106.5);
  allPaths[344].lineTo(60.1899, 105.85);
  allPaths[344].lineTo(60.7, 183.58);
  allPaths[344].close();

  // Paint paint_344_fill = Paint()..style = PaintingStyle.fill;
  // paint_344_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_344, paint_344_fill);

  allPaths[345].moveTo(62.05, 183.58);
  allPaths[345].lineTo(62.55, 107.37);
  allPaths[345].lineTo(61.54, 106.71);
  allPaths[345].lineTo(62.05, 183.58);
  allPaths[345].close();

  // Paint paint_345_fill = Paint()..style = PaintingStyle.fill;
  // paint_345_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_345, paint_345_fill);

  allPaths[346].moveTo(63.33, 183.58);
  allPaths[346].lineTo(63.83, 108.67);
  allPaths[346].lineTo(62.8101, 108.02);
  allPaths[346].lineTo(63.33, 183.58);
  allPaths[346].close();

  // Paint paint_346_fill = Paint()..style = PaintingStyle.fill;
  // paint_346_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_346, paint_346_fill);

  allPaths[347].moveTo(64.7498, 184.22);
  allPaths[347].lineTo(65.2598, 109.31);
  allPaths[347].lineTo(64.2397, 108.65);
  allPaths[347].lineTo(64.7498, 184.22);
  allPaths[347].close();

  // Paint paint_347_fill = Paint()..style = PaintingStyle.fill;
  // paint_347_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_347, paint_347_fill);

  allPaths[348].moveTo(59.28, 183.58);
  allPaths[348].lineTo(59.79, 105.59);
  allPaths[348].lineTo(58.77, 104.93);
  allPaths[348].lineTo(59.28, 183.58);
  allPaths[348].close();

  // Paint paint_348_fill = Paint()..style = PaintingStyle.fill;
  // paint_348_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_348, paint_348_fill);

  allPaths[349].moveTo(57.78, 183.58);
  allPaths[349].lineTo(58.28, 104.62);
  allPaths[349].lineTo(57.27, 103.96);
  allPaths[349].lineTo(57.78, 183.58);
  allPaths[349].close();

  // Paint paint_349_fill = Paint()..style = PaintingStyle.fill;
  // paint_349_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_349, paint_349_fill);

  allPaths[350].moveTo(60.0498, 174.17);
  allPaths[350].lineTo(60.6498, 236.97);
  allPaths[350].lineTo(61.2498, 174.17);
  allPaths[350].lineTo(60.0498, 174.17);
  allPaths[350].close();

  // Paint paint_350_fill = Paint()..style = PaintingStyle.fill;
  // paint_350_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_350, paint_350_fill);

  allPaths[351].moveTo(57.6602, 174.17);
  allPaths[351].lineTo(58.2502, 237.58);
  allPaths[351].lineTo(58.8502, 174.17);
  allPaths[351].lineTo(57.6602, 174.17);
  allPaths[351].close();

  // Paint paint_351_fill = Paint()..style = PaintingStyle.fill;
  // paint_351_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_351, paint_351_fill);

  allPaths[352].moveTo(62.6499, 174.17);
  allPaths[352].lineTo(63.2399, 237.3);
  allPaths[352].lineTo(63.8399, 174.17);
  allPaths[352].lineTo(62.6499, 174.17);
  allPaths[352].close();

  // Paint paint_352_fill = Paint()..style = PaintingStyle.fill;
  // paint_352_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_352, paint_352_fill);

  allPaths[353].moveTo(65.46, 174.17);
  allPaths[353].lineTo(66.05, 235.82);
  allPaths[353].lineTo(66.65, 174.17);
  allPaths[353].lineTo(65.46, 174.17);
  allPaths[353].close();

  // Paint paint_353_fill = Paint()..style = PaintingStyle.fill;
  // paint_353_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_353, paint_353_fill);

  allPaths[354].moveTo(49.6602, 174.17);
  allPaths[354].lineTo(50.2602, 237.04);
  allPaths[354].lineTo(50.8601, 174.17);
  allPaths[354].lineTo(49.6602, 174.17);
  allPaths[354].close();

  // Paint paint_354_fill = Paint()..style = PaintingStyle.fill;
  // paint_354_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_354, paint_354_fill);

  allPaths[355].moveTo(47.27, 174.17);
  allPaths[355].lineTo(47.86, 236.69);
  allPaths[355].lineTo(48.46, 174.17);
  allPaths[355].lineTo(47.27, 174.17);
  allPaths[355].close();

  // Paint paint_355_fill = Paint()..style = PaintingStyle.fill;
  // paint_355_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_355, paint_355_fill);

  allPaths[356].moveTo(52.25, 174.17);
  allPaths[356].lineTo(52.85, 236.12);
  allPaths[356].lineTo(53.45, 174.17);
  allPaths[356].lineTo(52.25, 174.17);
  allPaths[356].close();

  // Paint paint_356_fill = Paint()..style = PaintingStyle.fill;
  // paint_356_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_356, paint_356_fill);

  allPaths[357].moveTo(55.0601, 174.17);
  allPaths[357].lineTo(55.6601, 238.19);
  allPaths[357].lineTo(56.2601, 174.17);
  allPaths[357].lineTo(55.0601, 174.17);
  allPaths[357].close();

  // Paint paint_357_fill = Paint()..style = PaintingStyle.fill;
  // paint_357_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_357, paint_357_fill);

  allPaths[358].moveTo(44.4697, 174.17);
  allPaths[358].lineTo(45.0697, 238.08);
  allPaths[358].lineTo(45.6697, 174.17);
  allPaths[358].lineTo(44.4697, 174.17);
  allPaths[358].close();
  //
  // Paint paint_358_fill = Paint()..style = PaintingStyle.fill;
  // paint_358_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_358, paint_358_fill);

  allPaths[359].moveTo(36.02, 174.17);
  allPaths[359].lineTo(36.61, 236.97);
  allPaths[359].lineTo(37.21, 174.17);
  allPaths[359].lineTo(36.02, 174.17);
  allPaths[359].close();

  // Paint paint_359_fill = Paint()..style = PaintingStyle.fill;
  // paint_359_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_359, paint_359_fill);

  allPaths[360].moveTo(33.6201, 174.17);
  allPaths[360].lineTo(34.2201, 237.58);
  allPaths[360].lineTo(34.8101, 174.17);
  allPaths[360].lineTo(33.6201, 174.17);
  allPaths[360].close();

  // Paint paint_360_fill = Paint()..style = PaintingStyle.fill;
  // paint_360_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_360, paint_360_fill);

  allPaths[361].moveTo(38.6099, 174.17);
  allPaths[361].lineTo(39.1999, 237.3);
  allPaths[361].lineTo(39.7999, 174.17);
  allPaths[361].lineTo(38.6099, 174.17);
  allPaths[361].close();

  // Paint paint_361_fill = Paint()..style = PaintingStyle.fill;
  // paint_361_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_361, paint_361_fill);

  allPaths[362].moveTo(41.4199, 174.17);
  allPaths[362].lineTo(42.0099, 235.82);
  allPaths[362].lineTo(42.6199, 174.17);
  allPaths[362].lineTo(41.4199, 174.17);
  allPaths[362].close();

  // Paint paint_362_fill = Paint()..style = PaintingStyle.fill;
  // paint_362_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_362, paint_362_fill);

  allPaths[363].moveTo(28.2197, 174.17);
  allPaths[363].lineTo(28.8097, 236.12);
  allPaths[363].lineTo(29.4097, 174.17);
  allPaths[363].lineTo(28.2197, 174.17);
  allPaths[363].close();

  // Paint paint_363_fill = Paint()..style = PaintingStyle.fill;
  // paint_363_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_363, paint_363_fill);

  allPaths[364].moveTo(31.0298, 174.17);
  allPaths[364].lineTo(31.6198, 238.19);
  allPaths[364].lineTo(32.2198, 174.17);
  allPaths[364].lineTo(31.0298, 174.17);
  allPaths[364].close();

  // Paint paint_364_fill = Paint()..style = PaintingStyle.fill;
  // paint_364_fill.color = Color(0xff6E1029).withOpacity(1.0);
  // canvas.drawPath(path_364, paint_364_fill);

  return allPaths;
}
