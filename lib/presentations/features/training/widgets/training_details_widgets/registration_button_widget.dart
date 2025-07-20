import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
class RegistrationButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const RegistrationButtonWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizeW.s16),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: AppSizeH.s10),
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s10),
          ),
        ),
        child: Text('سجل اهتمامك',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).scaffoldBackgroundColor,
                )),
      ),
    );
  }
}
