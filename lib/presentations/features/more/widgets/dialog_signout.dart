import 'package:flutter/material.dart';

import '../../../../app/app_preferences.dart';
import '../../../../app/depndency_injection.dart';
import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';

class DialogSignOut extends StatelessWidget {
  const DialogSignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: AppSizeH.s200,
      padding: EdgeInsets.symmetric(
          vertical: AppSizeH.s30, horizontal: AppSizeW.s30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizeW.s15),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStrings().logout,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: AppSizeH.s20,
          ),
          Text(
            AppStrings().validateLogout,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: AppSizeH.s20,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    isPrimary: false,
                    titleStyle: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: ColorManager.primary),
                    title: AppStrings().yes,
                    onPress: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ),
                SizedBox(width: AppSizeW.s8),
                Expanded(
                  child: CustomElevatedButton(
                    isPrimary: true,
                    title: AppStrings().no,
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                    backgroundColor:
                        instance<AppPreferences>().getTheme().brightness ==
                                Brightness.light
                            ? ColorManager.primary
                            : ColorManager.greyCloud,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
