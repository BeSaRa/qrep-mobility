// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentDefaultImpl _$$RentDefaultImplFromJson(Map<String, dynamic> json) =>
    _$RentDefaultImpl(
      issueYear: json['issueYear'] as int? ?? 0,
      kpi10PreviousYear: json['kpi10PreviousYear'] as int? ?? 0,
      kpi10Val: json['kpi10Val'] as int? ?? 0,
      kpi13PreviousYear: json['kpi13PreviousYear'] as int? ?? 0,
      kpi13Val: json['kpi13Val'] as int? ?? 0,
      kpi16PreviousYear: json['kpi16PreviousYear'] as int? ?? 0,
      kpi16Val: json['kpi16Val'] as int? ?? 0,
      kpi16_2PreviousYear: json['kpi16_2PreviousYear'] as int? ?? 0,
      kpi16_2Val: json['kpi16_2Val'] as int? ?? 0,
      kpi1PreviousYear: json['kpi1PreviousYear'] as int? ?? 0,
      kpi1Val: json['kpi1Val'] as int? ?? 0,
      kpi4PreviousYear: json['kpi4PreviousYear'] as int? ?? 0,
      kpi4Val: json['kpi4Val'] as int? ?? 0,
      kpi7PreviousYear: json['kpi7PreviousYear'] as int? ?? 0,
      kpi7Val: json['kpi7Val'] as int? ?? 0,
      kpiYoY1: json['kpiYoY1'] as int? ?? 0,
      kpiYoY10: json['kpiYoY10'] as int? ?? 0,
      kpiYoY10Difference: json['kpiYoY10Difference'] as int? ?? 0,
      kpiYoY13: json['kpiYoY13'] as int? ?? 0,
      kpiYoY13Difference: json['kpiYoY13Difference'] as int? ?? 0,
      kpiYoY16: json['kpiYoY16'] as int? ?? 0,
      kpiYoY16Difference: json['kpiYoY16Difference'] as int? ?? 0,
      kpiYoY16_2: json['kpiYoY16_2'] as int? ?? 0,
      kpiYoY16_2Difference: json['kpiYoY16_2Difference'] as int? ?? 0,
      kpiYoY1Difference: json['kpiYoY1Difference'] as int? ?? 0,
      kpiYoY4: json['kpiYoY4'] as int? ?? 0,
      kpiYoY4Difference: json['kpiYoY4Difference'] as int? ?? 0,
      kpiYoY7: json['kpiYoY7'] as int? ?? 0,
      kpiYoY7Difference: json['kpiYoY7Difference'] as int? ?? 0,
    );

Map<String, dynamic> _$$RentDefaultImplToJson(_$RentDefaultImpl instance) =>
    <String, dynamic>{
      'issueYear': instance.issueYear,
      'kpi10PreviousYear': instance.kpi10PreviousYear,
      'kpi10Val': instance.kpi10Val,
      'kpi13PreviousYear': instance.kpi13PreviousYear,
      'kpi13Val': instance.kpi13Val,
      'kpi16PreviousYear': instance.kpi16PreviousYear,
      'kpi16Val': instance.kpi16Val,
      'kpi16_2PreviousYear': instance.kpi16_2PreviousYear,
      'kpi16_2Val': instance.kpi16_2Val,
      'kpi1PreviousYear': instance.kpi1PreviousYear,
      'kpi1Val': instance.kpi1Val,
      'kpi4PreviousYear': instance.kpi4PreviousYear,
      'kpi4Val': instance.kpi4Val,
      'kpi7PreviousYear': instance.kpi7PreviousYear,
      'kpi7Val': instance.kpi7Val,
      'kpiYoY1': instance.kpiYoY1,
      'kpiYoY10': instance.kpiYoY10,
      'kpiYoY10Difference': instance.kpiYoY10Difference,
      'kpiYoY13': instance.kpiYoY13,
      'kpiYoY13Difference': instance.kpiYoY13Difference,
      'kpiYoY16': instance.kpiYoY16,
      'kpiYoY16Difference': instance.kpiYoY16Difference,
      'kpiYoY16_2': instance.kpiYoY16_2,
      'kpiYoY16_2Difference': instance.kpiYoY16_2Difference,
      'kpiYoY1Difference': instance.kpiYoY1Difference,
      'kpiYoY4': instance.kpiYoY4,
      'kpiYoY4Difference': instance.kpiYoY4Difference,
      'kpiYoY7': instance.kpiYoY7,
      'kpiYoY7Difference': instance.kpiYoY7Difference,
    };

_$RentLookupResponseImpl _$$RentLookupResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RentLookupResponseImpl(
      rooms: (json['rooms'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      durations: (json['durations'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      halfYearDurations: (json['halfYearDurations'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      quarterYearDurations: (json['quarterYearDurations'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      spaces: (json['spaces'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      unitStatus: (json['unitStatus'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      propertyTypeList: (json['propertyTypeList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rentPurposeList: (json['rentPurposeList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      zoneList: (json['zoneList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      halfYearList: (json['halfYearList'] as List<dynamic>?)
              ?.map(
                  (e) => PeriodTimeDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [
            PeriodTimeDetails(name: 'نصف اول', value: [1, 2]),
            PeriodTimeDetails(name: 'نصف ثاني', value: [3, 4])
          ],
      quarterYearList: (json['quarterYearList'] as List<dynamic>?)
              ?.map(
                  (e) => PeriodTimeDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [
            PeriodTimeDetails(name: 'ربع اول', value: [1]),
            PeriodTimeDetails(name: 'ربع ثاني', value: [2]),
            PeriodTimeDetails(name: 'ربع ثالث', value: [3]),
            PeriodTimeDetails(name: 'ربع اخير', value: [4])
          ],
      periodTime: (json['periodTime'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [
            RentLookupModel(arName: 'سنوي', id: 1),
            RentLookupModel(arName: 'نصف سنوي', id: 2),
            RentLookupModel(arName: 'ربع سنوي ', id: 3),
            RentLookupModel(arName: 'شهري', id: 4),
            RentLookupModel(arName: ' فترة محددة', id: 5)
          ],
      bedRooms: (json['bedRooms'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [
            RentLookupModel(arName: 'استوديو', id: 6),
            RentLookupModel(arName: 'غرفة', id: 1),
            RentLookupModel(arName: 'غرفتين', id: 2),
            RentLookupModel(arName: '3 غرف', id: 3),
            RentLookupModel(arName: '4 غرف', id: 4),
            RentLookupModel(arName: '5 غرف', id: 5),
            RentLookupModel(arName: 'الكل', id: -1)
          ],
      districtList: (json['districtList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      municipalityList: (json['municipalityList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      furnitureStatusList: (json['furnitureStatusList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nationalityList: (json['nationalityList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nationalityCategoryList: (json['nationalityCategoryList']
                  as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      genderList: (json['genderList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ageCategoryList: (json['ageCategoryList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ownerCategoryList: (json['ownerCategoryList'] as List<dynamic>?)
              ?.map((e) => RentLookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      maxParams: (json['maxParams'] as List<dynamic>?)
              ?.map((e) => MaxParamsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RentLookupResponseImplToJson(
        _$RentLookupResponseImpl instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
      'durations': instance.durations,
      'halfYearDurations': instance.halfYearDurations,
      'quarterYearDurations': instance.quarterYearDurations,
      'spaces': instance.spaces,
      'unitStatus': instance.unitStatus,
      'propertyTypeList': instance.propertyTypeList,
      'rentPurposeList': instance.rentPurposeList,
      'zoneList': instance.zoneList,
      'halfYearList': instance.halfYearList,
      'quarterYearList': instance.quarterYearList,
      'periodTime': instance.periodTime,
      'bedRooms': instance.bedRooms,
      'districtList': instance.districtList,
      'municipalityList': instance.municipalityList,
      'furnitureStatusList': instance.furnitureStatusList,
      'nationalityList': instance.nationalityList,
      'nationalityCategoryList': instance.nationalityCategoryList,
      'genderList': instance.genderList,
      'ageCategoryList': instance.ageCategoryList,
      'ownerCategoryList': instance.ownerCategoryList,
      'maxParams': instance.maxParams,
    };

_$RentLookupModelImpl _$$RentLookupModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RentLookupModelImpl(
      value: json['value'] as int? ?? 0,
      yoy: json['yoy'] as int? ?? 0,
      selected: json['selected'] as bool? ?? false,
      url: json['url'] as String? ?? '',
      hasPrice: json['hasPrice'] as bool? ?? false,
      id: json['id'] as int? ?? 0,
      lookupKey: json['lookupKey'] as int? ?? 0,
      arName: json['arName'] as String? ?? '',
      enName: json['enName'] as String? ?? '',
      municipalityId: json['municipalityId'] as int? ?? 0,
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$$RentLookupModelImplToJson(
        _$RentLookupModelImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'yoy': instance.yoy,
      'selected': instance.selected,
      'url': instance.url,
      'hasPrice': instance.hasPrice,
      'id': instance.id,
      'lookupKey': instance.lookupKey,
      'arName': instance.arName,
      'enName': instance.enName,
      'municipalityId': instance.municipalityId,
      'isActive': instance.isActive,
    };

_$PeriodTimeDetailsImpl _$$PeriodTimeDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$PeriodTimeDetailsImpl(
      name: json['name'] as String? ?? '',
      value: (json['value'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
    );

Map<String, dynamic> _$$PeriodTimeDetailsImplToJson(
        _$PeriodTimeDetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

_$MaxParamsModelImpl _$$MaxParamsModelImplFromJson(Map<String, dynamic> json) =>
    _$MaxParamsModelImpl(
      id: json['id'] as int? ?? 0,
      fieldName: json['fieldName'] as String? ?? '',
      minVal: json['minVal'] as int? ?? 0,
      maxVal: json['maxVal'] as int? ?? 0,
      model: json['model'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$$MaxParamsModelImplToJson(
        _$MaxParamsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fieldName': instance.fieldName,
      'minVal': instance.minVal,
      'maxVal': instance.maxVal,
      'model': instance.model,
      'isActive': instance.isActive,
    };

_$BaseRentResponseImpl _$$BaseRentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BaseRentResponseImpl(
      issueYear: json['issueYear'] as num? ?? 0,
      kpiPreviousYear: json['kpiPreviousYear'] as num? ?? 0,
      kpiVal: json['kpiVal'] as num? ?? 0,
      zoneId: json['zoneId'] as num? ?? 0,
      kpiYoYDifference: json['kpiYoYDifference'] as num? ?? 0,
      kpiYoYVal: json['kpiYoYVal'] as num? ?? 0,
      purposeId: json['purposeId'] as num? ?? 0,
      propertyTypeId: json['propertyTypeId'] as num? ?? 0,
    );

Map<String, dynamic> _$$BaseRentResponseImplToJson(
        _$BaseRentResponseImpl instance) =>
    <String, dynamic>{
      'issueYear': instance.issueYear,
      'kpiPreviousYear': instance.kpiPreviousYear,
      'kpiVal': instance.kpiVal,
      'zoneId': instance.zoneId,
      'kpiYoYDifference': instance.kpiYoYDifference,
      'kpiYoYVal': instance.kpiYoYVal,
      'purposeId': instance.purposeId,
      'propertyTypeId': instance.propertyTypeId,
    };

_$MeanAreaResponseImpl _$$MeanAreaResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MeanAreaResponseImpl(
      issueYear: json['issueYear'] as int? ?? 0,
      kpi2PreviousYear: json['kpi2PreviousYear'] as int? ?? 0,
      kpi2Val: json['kpi2Val'] as int? ?? 0,
      kpi2YoYDifference: json['kpi2YoYDifference'] as int? ?? 0,
      kpi2YoYVal: json['kpi2YoYVal'] as int? ?? 0,
      kpiPreviousYear: json['kpiPreviousYear'] as int? ?? 0,
      kpiVal: json['kpiVal'] as int? ?? 0,
      kpiYoYDifference: json['kpiYoYDifference'] as int? ?? 0,
      kpiYoYVal: json['kpiYoYVal'] as int? ?? 0,
    );

Map<String, dynamic> _$$MeanAreaResponseImplToJson(
        _$MeanAreaResponseImpl instance) =>
    <String, dynamic>{
      'issueYear': instance.issueYear,
      'kpi2PreviousYear': instance.kpi2PreviousYear,
      'kpi2Val': instance.kpi2Val,
      'kpi2YoYDifference': instance.kpi2YoYDifference,
      'kpi2YoYVal': instance.kpi2YoYVal,
      'kpiPreviousYear': instance.kpiPreviousYear,
      'kpiVal': instance.kpiVal,
      'kpiYoYDifference': instance.kpiYoYDifference,
      'kpiYoYVal': instance.kpiYoYVal,
    };
