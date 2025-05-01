import 'dart:ui';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';

class HoldMessageWidget extends StatelessWidget {
  const HoldMessageWidget({
    super.key,
    required this.showHoldMessage,
  });

  final ValueNotifier<bool> showHoldMessage;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: showHoldMessage,
      builder: (context, visible, child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.2),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          ),
          child: visible
              ? Padding(
                  key: const ValueKey("visibleHoldMessage"),
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizeW.s20,
                    horizontal: AppSizeW.s30,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppSizeR.s10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: AppSizeW.s10,
                              horizontal: AppSizeW.s15,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(AppSizeR.s10),
                            ),
                            child: Text(
                              AppStrings().holdRecordMessage,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -AppSizeH.s10,
                        right: AppSizeW.s20,
                        child: CustomPaint(
                          size: Size(AppSizeW.s20, AppSizeH.s10),
                          painter: TrianglePainter(
                            color: Theme.of(context)
                                .primaryColor
                                .withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(key: ValueKey("invisibleHoldMessage")),
        );
      },
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;
  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
