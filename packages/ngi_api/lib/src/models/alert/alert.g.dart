// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlertQuery _$AlertQueryFromJson(Map<String, dynamic> json) => AlertQuery(
      page_count: json['page_count'] as int?,
      result: (json['result'] as List<dynamic>?)
              ?.map((dynamic e) => Alert.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      success: json['success'] as bool? ?? false,
      total_count: json['total_count'] as int? ?? 0,
    );

Map<String, dynamic> _$AlertQueryToJson(AlertQuery instance) =>
    <String, dynamic>{
      'success': instance.success,
      'page_count': instance.page_count,
      'total_count': instance.total_count,
      'result': instance.result.map((e) => e.toJson()).toList(),
    };

Alert _$AlertFromJson(Map<String, dynamic> json) => Alert(
      ack: json['ack'] as bool?,
      //alertConfig: json['_alertConfig'] as String?,
      alert_data: json['alert_data'] == null
          ? null
          : AlertData.fromJson(json['alert_data'] as Map<String, dynamic>),
      assetId: json['_assetId'] as String?,
      company_owner: json['_company_owner'] as String?,
      end_dt: json['end_dt'] as String?,
      id: json['_id'] as String,
      loc: json['loc'] == null
          ? null
          : Loc.fromJson(json['loc'] as Map<String, dynamic>),
      name: json['name'] as String?,
      public: json['public'] as bool?,
      start_dt: json['start_dt'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$AlertToJson(Alert instance) => <String, dynamic>{
      'alert_data': instance.alert_data?.toJson(),
      'ack': instance.ack,
      'public': instance.public,
      'status': instance.status,
      'loc': instance.loc?.toJson(),
      '_alertConfig': instance.alertConfig,
      '_assetId': instance.assetId,
      '_company_owner': instance.company_owner,
      'end_dt': instance.end_dt,
      '_id': instance.id,
      'name': instance.name,
      'start_dt': instance.start_dt,
    };

AlertData _$AlertDataFromJson(Map<String, dynamic> json) => AlertData(
      description: json['description'] == null
          ? null
          : AlertDescription.fromJson(
              json['description'] as Map<String, dynamic>,),
      outPolygonCheck0: json['OUT_POLYGON_CHECK_0'] == null
          ? null
          : OutPolygonCheck0.fromJson(
              json['OUT_POLYGON_CHECK_0'] as Map<String, dynamic>,),
      greaterCheck0: json['GREATER_CHECK_0'] == null
          ? null
          : GreaterCheck.fromJson(
              json['GREATER_CHECK_0'] as Map<String, dynamic>,),
      greaterCheck: json['GREATER_CHECK'] == null
          ? null
          : GreaterCheck.fromJson(
              json['GREATER_CHECK'] as Map<String, dynamic>,),
    );

Map<String, dynamic> _$AlertDataToJson(AlertData instance) => <String, dynamic>{
      'description': instance.description?.toJson(),
      'OUT_POLYGON_CHECK_0': instance.outPolygonCheck0?.toJson(),
      'GREATER_CHECK_0': instance.greaterCheck0?.toJson(),
      'GREATER_CHECK': instance.greaterCheck?.toJson(),
    };

AlertDescription _$AlertDescriptionFromJson(Map<String, dynamic> json) =>
    AlertDescription(
      value: json['value'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AlertDescriptionToJson(AlertDescription instance) =>
    <String, dynamic>{
      'value': instance.value,
      'message': instance.message,
    };

GreaterCheck _$GreaterCheckFromJson(Map<String, dynamic> json) => GreaterCheck(
      value: json['value']?.toString() ,
      threshold: json['threshold']?.toString(),
      field: json['field'] as String?,
      checker: json['checker'] as String?,
    );

Map<String, dynamic> _$GreaterCheckToJson(GreaterCheck instance) =>
    <String, dynamic>{
      'value': instance.value,
      'threshold': instance.threshold,
      'field': instance.field,
      'checker': instance.checker,
    };

OutPolygonCheck0 _$OutPolygonCheck0FromJson(Map<String, dynamic> json) =>
    OutPolygonCheck0(
      zone_id: json['zone_id'] as String?,
      zone: json['zone'] as String?,
      type: json['type'] as String?,
      checker: json['checker'] as String?,
    );

Map<String, dynamic> _$OutPolygonCheck0ToJson(OutPolygonCheck0 instance) =>
    <String, dynamic>{
      'zone_id': instance.zone_id,
      'zone': instance.zone,
      'type': instance.type,
      'checker': instance.checker,
    };
