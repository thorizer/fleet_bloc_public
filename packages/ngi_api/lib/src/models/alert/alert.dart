// ignore_for_file: public_member_api_docs, non_constant_identifier_names, constant_identifier_names, lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';

part 'alert.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class AlertQuery extends Equatable {
  const AlertQuery({
    this.page_count,
    this.result = const [],
    this.success = false,
    this.total_count = 0,
  });

  final bool? success;
  final int? page_count;
  final int? total_count;
  final List<Alert> result;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [result, total_count, page_count, success];

  /// Deserializes the given [JsonMap] into a [AlertQuery].
  static AlertQuery fromJson(JsonMap json) => _$AlertQueryFromJson(json);

  /// Converts this [AlertQuery] into a [JsonMap].
  JsonMap toJson() => _$AlertQueryToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class Alert extends Equatable {
  const Alert({
    this.ack,
    this.alertConfig,
    this.alert_data,
    this.assetId,
    this.company_owner,
    this.end_dt,
    required this.id,
    this.loc,
    this.name,
    this.public,
    this.start_dt,
    this.status,
  });

  final AlertData? alert_data;
  final bool? ack;
  final bool? public;
  final int? status;
  final Loc? loc;
  @JsonKey(name: '_alertConfig')
  final String? alertConfig;
  @JsonKey(name: '_assetId')
  final String? assetId;
  @JsonKey(name: '_company_owner')
  final String? company_owner;
  final String? end_dt;
  @JsonKey(name: '_id')
  final String id;
  final String? name;
  final String? start_dt;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      alert_data,
      ack,
      public,
      status,
      loc,
      alertConfig,
      assetId,
      company_owner,
      end_dt,
      id,
      name,
      start_dt,
    ];
  }

  /// Deserializes the given [JsonMap] into a [Alert].
  static Alert fromJson(JsonMap json) => _$AlertFromJson(json);

  /// Converts this [Alert] into a [JsonMap].
  JsonMap toJson() => _$AlertToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class AlertData extends Equatable {
  const AlertData({
    this.description,
    this.outPolygonCheck0,
    this.greaterCheck0,
    this.greaterCheck,
  });

  final AlertDescription? description;
  @JsonKey(name: 'OUT_POLYGON_CHECK_0')
  final OutPolygonCheck0? outPolygonCheck0;
  @JsonKey(name: 'GREATER_CHECK_0')
  final GreaterCheck? greaterCheck0;
  @JsonKey(name: 'GREATER_CHECK')
  final GreaterCheck? greaterCheck;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props =>
      [description, outPolygonCheck0, greaterCheck0, greaterCheck];

  /// Deserializes the given [JsonMap] into a [AlertData].
  static AlertData fromJson(JsonMap json) => _$AlertDataFromJson(json);

  /// Converts this [AlertData] into a [JsonMap].
  JsonMap toJson() => _$AlertDataToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class AlertDescription extends Equatable {
  const AlertDescription({
    this.value,
    this.message,
  });

  final String? value;
  final String? message;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [value, message];

  /// Deserializes the given [JsonMap] into a [AlertDescription].
  static AlertDescription fromJson(JsonMap json) =>
      _$AlertDescriptionFromJson(json);

  /// Converts this [AlertDescription] into a [JsonMap].
  JsonMap toJson() => _$AlertDescriptionToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class GreaterCheck extends Equatable {
  const GreaterCheck({
    this.value,
    this.threshold,
    this.field,
    this.checker,
  });

  final String? value;
  final String? threshold;
  final String? field;
  final String? checker;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [value, threshold, field, checker];

  /// Deserializes the given [JsonMap] into a [GreaterCheck].
  static GreaterCheck fromJson(JsonMap json) => _$GreaterCheckFromJson(json);

  /// Converts this [GreaterCheck] into a [JsonMap].
  JsonMap toJson() => _$GreaterCheckToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class OutPolygonCheck0 extends Equatable {
  const OutPolygonCheck0({
    this.zone_id,
    this.zone,
    this.type,
    this.checker,
  });

  final String? zone_id;
  final String? zone;
  final String? type;
  final String? checker;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [zone_id, zone, type, checker];

  /// Deserializes the given [JsonMap] into a [OutPolygonCheck0].
  static OutPolygonCheck0 fromJson(JsonMap json) => _$OutPolygonCheck0FromJson(json);

  /// Converts this [OutPolygonCheck0] into a [JsonMap].
  JsonMap toJson() => _$OutPolygonCheck0ToJson(this);
}
