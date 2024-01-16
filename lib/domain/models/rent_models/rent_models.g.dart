// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentDefaultImpl _$$RentDefaultImplFromJson(Map<String, dynamic> json) =>
    _$RentDefaultImpl(
      issueYear: json['issueYear'] as int? ?? 0,
      kpi10PreviousYear: (json['kpi10PreviousYear'] as num?)?.toDouble() ?? 0,
      kpi10Val: (json['kpi10Val'] as num?)?.toDouble() ?? 0,
      kpi13PreviousYear: (json['kpi13PreviousYear'] as num?)?.toDouble() ?? 0,
      kpi13Val: (json['kpi13Val'] as num?)?.toDouble() ?? 0,
      kpi16PreviousYear: (json['kpi16PreviousYear'] as num?)?.toDouble() ?? 0,
      kpi16Val: (json['kpi16Val'] as num?)?.toDouble() ?? 0,
      kpi16_2PreviousYear:
          (json['kpi16_2PreviousYear'] as num?)?.toDouble() ?? 0,
      kpi16_2Val: (json['kpi16_2Val'] as num?)?.toDouble() ?? 0,
      kpi1PreviousYear: (json['kpi1PreviousYear'] as num?)?.toDouble() ?? 0,
      kpi1Val: (json['kpi1Val'] as num?)?.toDouble() ?? 0,
      kpi4PreviousYear: (json['kpi4PreviousYear'] as num?)?.toDouble() ?? 0,
      kpi4Val: (json['kpi4Val'] as num?)?.toDouble() ?? 0,
      kpi7PreviousYear: (json['kpi7PreviousYear'] as num?)?.toDouble() ?? 0,
      kpi7Val: (json['kpi7Val'] as num?)?.toDouble() ?? 0,
      kpiYoY1: (json['kpiYoY1'] as num?)?.toDouble() ?? 0,
      kpiYoY10: (json['kpiYoY10'] as num?)?.toDouble() ?? 0,
      kpiYoY10Difference: (json['kpiYoY10Difference'] as num?)?.toDouble() ?? 0,
      kpiYoY13: (json['kpiYoY13'] as num?)?.toDouble() ?? 0,
      kpiYoY13Difference: (json['kpiYoY13Difference'] as num?)?.toDouble() ?? 0,
      kpiYoY16: (json['kpiYoY16'] as num?)?.toDouble() ?? 0,
      kpiYoY16Difference: (json['kpiYoY16Difference'] as num?)?.toDouble() ?? 0,
      kpiYoY16_2: (json['kpiYoY16_2'] as num?)?.toDouble() ?? 0,
      kpiYoY16_2Difference:
          (json['kpiYoY16_2Difference'] as num?)?.toDouble() ?? 0,
      kpiYoY1Difference: (json['kpiYoY1Difference'] as num?)?.toDouble() ?? 0,
      kpiYoY4: (json['kpiYoY4'] as num?)?.toDouble() ?? 0,
      kpiYoY4Difference: (json['kpiYoY4Difference'] as num?)?.toDouble() ?? 0,
      kpiYoY7: (json['kpiYoY7'] as num?)?.toDouble() ?? 0,
      kpiYoY7Difference: (json['kpiYoY7Difference'] as num?)?.toDouble() ?? 0,
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
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      durations: (json['durations'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      halfYearDurations: (json['halfYearDurations'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      quarterYearDurations: (json['quarterYearDurations'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      spaces: (json['spaces'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      unitStatus: (json['unitStatus'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      propertyTypeList: (json['propertyTypeList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rentPurposeList: (json['rentPurposeList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      zoneList: (json['zoneList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      halfYearList: (json['halfYearList'] as List<dynamic>?)
              ?.map(
                  (e) => PeriodTimeDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [
            PeriodTimeDetails(
                name: 'نصف اول', value: [1, 2], enName: 'First Half'),
            PeriodTimeDetails(
                name: 'نصف ثاني', value: [3, 4], enName: 'Last Half')
          ],
      quarterYearList: (json['quarterYearList'] as List<dynamic>?)
              ?.map(
                  (e) => PeriodTimeDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [
            PeriodTimeDetails(
                name: 'ربع اول', value: [1], enName: 'First Quarter'),
            PeriodTimeDetails(
                name: 'ربع ثاني', value: [2], enName: 'Second Quarter'),
            PeriodTimeDetails(
                name: 'ربع ثالث', value: [3], enName: 'Third Quarter'),
            PeriodTimeDetails(
                name: 'ربع اخير', value: [4], enName: 'Last Quarter')
          ],
      periodTime: (json['periodTime'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [
            LookupModel(arName: 'سنوي', id: 1, enName: 'Yearly'),
            LookupModel(arName: 'نصف سنوي', id: 2, enName: 'Half Yearly'),
            LookupModel(arName: 'ربع سنوي ', id: 3, enName: 'Quarter Yearly'),
            LookupModel(arName: 'شهري', id: 4, enName: 'Monthly')
          ],
      bedRooms: (json['bedRooms'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [
            LookupModel(arName: 'استوديو', id: 6, enName: 'studio'),
            LookupModel(arName: 'غرفة', id: 1, enName: 'one room'),
            LookupModel(arName: 'غرفتين', id: 2, enName: '2 rooms'),
            LookupModel(arName: '3 غرف', id: 3, enName: '3 rooms'),
            LookupModel(arName: '4 غرف', id: 4, enName: '4 rooms'),
            LookupModel(arName: '5 غرف', id: 5, enName: '5 rooms'),
            LookupModel(arName: 'الكل', id: -1, enName: 'ALL')
          ],
      districtList: (json['districtList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      municipalityList: (json['municipalityList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      furnitureStatusList: (json['furnitureStatusList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nationalityList: (json['nationalityList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nationalityCategoryList:
          (json['nationalityCategoryList'] as List<dynamic>?)
                  ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
      genderList: (json['genderList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ageCategoryList: (json['ageCategoryList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ownerCategoryList: (json['ownerCategoryList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      maxParams: (json['maxParams'] as List<dynamic>?)
              ?.map((e) => MaxParamsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      streetList: (json['streetList'] as List<dynamic>?)
              ?.map((e) => LookupModel.fromJson(e as Map<String, dynamic>))
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
      'streetList': instance.streetList,
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
      enName: json['enName'] as String? ?? '',
      value: (json['value'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
    );

Map<String, dynamic> _$$PeriodTimeDetailsImplToJson(
        _$PeriodTimeDetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'enName': instance.enName,
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
      realEstateMT: json['realEstateMT'] as num? ?? 0,
      realEstateSQT: json['realEstateSQT'] as num? ?? 0,
      priceMT: json['priceMT'] as num? ?? 0,
      priceSQ: json['priceSQ'] as num? ?? 0,
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
      'realEstateMT': instance.realEstateMT,
      'realEstateSQT': instance.realEstateSQT,
      'priceMT': instance.priceMT,
      'priceSQ': instance.priceSQ,
    };

_$BaseRentResponsePerAreaUnitTypeImpl
    _$$BaseRentResponsePerAreaUnitTypeImplFromJson(Map<String, dynamic> json) =>
        _$BaseRentResponsePerAreaUnitTypeImpl(
          issueYear: json['issueYear'] as num? ?? 0,
          kpiSqft: json['kpiSqft'] as num? ?? 0,
          kpiSqmt: json['kpiSqmt'] as num? ?? 0,
          kpiSqftPreviousYear: json['kpiSqftPreviousYear'] as num? ?? 0,
          kpiSqmtPreviousYear: json['kpiSqmtPreviousYear'] as num? ?? 0,
          kpiSqftYoYDifference: json['kpiSqftYoYDifference'] as num? ?? 0,
          kpiSqmtYoYDifference: json['kpiSqmtYoYDifference'] as num? ?? 0,
          kpiSqftYoYVal: json['kpiSqftYoYVal'] as num? ?? 0,
          kpiSqmtYoYVal: json['kpiSqmtYoYVal'] as num? ?? 0,
        );

Map<String, dynamic> _$$BaseRentResponsePerAreaUnitTypeImplToJson(
        _$BaseRentResponsePerAreaUnitTypeImpl instance) =>
    <String, dynamic>{
      'issueYear': instance.issueYear,
      'kpiSqft': instance.kpiSqft,
      'kpiSqmt': instance.kpiSqmt,
      'kpiSqftPreviousYear': instance.kpiSqftPreviousYear,
      'kpiSqmtPreviousYear': instance.kpiSqmtPreviousYear,
      'kpiSqftYoYDifference': instance.kpiSqftYoYDifference,
      'kpiSqmtYoYDifference': instance.kpiSqmtYoYDifference,
      'kpiSqftYoYVal': instance.kpiSqftYoYVal,
      'kpiSqmtYoYVal': instance.kpiSqmtYoYVal,
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

_$RentListSummaryImpl _$$RentListSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$RentListSummaryImpl(
      count: json['count'] as int? ?? 0,
      transactionList: (json['transactionList'] as List<dynamic>?)
              ?.map(
                  (e) => RentSummaryObject.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RentListSummaryImplToJson(
        _$RentListSummaryImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'transactionList': instance.transactionList,
    };

_$RentSummaryObjectImpl _$$RentSummaryObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$RentSummaryObjectImpl(
      area: (json['area'] as num?)?.toDouble() ?? 0,
      bedRoomsCount: json['bedRoomsCount'] as int? ?? 0,
      endDate: json['endDate'] as String? ?? '',
      issueYear: json['issueYear'] as int? ?? 0,
      issueDate: json['issueDate'] as String? ?? '',
      municipalityid: json['municipalityid'] as int? ?? 0,
      propertyTypeId: json['propertyTypeId'] as int? ?? 0,
      rentPaymentMeterMT: (json['rentPaymentMeterMT'] as num?)?.toDouble() ?? 0,
      rentPaymentMeterSQT:
          (json['rentPaymentMeterSQT'] as num?)?.toDouble() ?? 0,
      rentPaymentMonthly: (json['rentPaymentMonthly'] as num?)?.toDouble() ?? 0,
      startDate: json['startDate'] as String? ?? '',
      unitBroker: json['unitBroker'] as String? ?? '',
      unitNo: json['unitNo'] as String? ?? '',
      unitOwner: json['unitOwner'] as String? ?? '',
      unitTenant: json['unitTenant'] as String? ?? '',
    );

Map<String, dynamic> _$$RentSummaryObjectImplToJson(
        _$RentSummaryObjectImpl instance) =>
    <String, dynamic>{
      'area': instance.area,
      'bedRoomsCount': instance.bedRoomsCount,
      'endDate': instance.endDate,
      'issueYear': instance.issueYear,
      'issueDate': instance.issueDate,
      'municipalityid': instance.municipalityid,
      'propertyTypeId': instance.propertyTypeId,
      'rentPaymentMeterMT': instance.rentPaymentMeterMT,
      'rentPaymentMeterSQT': instance.rentPaymentMeterSQT,
      'rentPaymentMonthly': instance.rentPaymentMonthly,
      'startDate': instance.startDate,
      'unitBroker': instance.unitBroker,
      'unitNo': instance.unitNo,
      'unitOwner': instance.unitOwner,
      'unitTenant': instance.unitTenant,
    };
