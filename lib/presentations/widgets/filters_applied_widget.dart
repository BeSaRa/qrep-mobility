import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';

import '../../domain/models/rent_models/rent_models.dart';

class FiltersApplied extends StatelessWidget {
  final bool? withoutZone;
  final LookupModel municipality;
  final LookupModel zone;
  final LookupModel propertyType;
  final LookupModel propertyPurpose;
  final int year;

  const FiltersApplied({
    super.key,
    required this.municipality,
    required this.zone,
    required this.propertyType,
    required this.propertyPurpose,
    required this.year,
    this.withoutZone,
  });

  String getNameFilter(LookupModel model, bool isArabic) {
    if (model.lookupKey == -1) {
      return "";
    } else {
      return isArabic ? '${model.arName},' : '${model.enName},';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizeW.s8),
      child: FittedBox(
        child: Text(
          '(${getNameFilter(municipality, (context.locale == ARABIC_LOCAL))}${withoutZone ?? false ? "" : getNameFilter(zone, (context.locale == ARABIC_LOCAL))}${getNameFilter(propertyType, (context.locale == ARABIC_LOCAL))}${getNameFilter(propertyPurpose, (context.locale == ARABIC_LOCAL))}$year)',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
