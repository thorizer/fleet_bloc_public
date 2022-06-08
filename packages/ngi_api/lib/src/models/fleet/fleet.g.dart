// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fleet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FleetQuery _$FleetQueryFromJson(Map<String, dynamic> json) => FleetQuery(
      page_count: json['page_count'] as int?,
      result: (json['result'] as List<dynamic>?)
              ?.map((dynamic e) => Fleet.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      success: json['success'] as bool? ?? false,
      total_count: json['total_count'] as int? ?? 0,
    );

Map<String, dynamic> _$FleetQueryToJson(FleetQuery instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result.map((e) => e.toJson()).toList(),
      'page_count': instance.page_count,
      'total_count': instance.total_count,
    };

Fleet _$FleetFromJson(Map<String, dynamic> json) => Fleet(
      assets:
          (json['_assets'] as List<dynamic>?)?.map((dynamic e) => e as String).toList(),
      company_owner: json['_company_owner'] as String?,
      id: json['_id'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$FleetToJson(Fleet instance) => <String, dynamic>{
      '_assets': instance.assets,
      '_company_owner': instance.company_owner,
      'name': instance.name,
      '_id': instance.id,
    };
