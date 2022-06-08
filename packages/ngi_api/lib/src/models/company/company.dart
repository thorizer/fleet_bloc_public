// ignore_for_file: public_member_api_docs, non_constant_identifier_names, constant_identifier_names, lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';

part 'company.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class CompanyOwnerResult extends Equatable {
  const CompanyOwnerResult({
    this.success,
    this.result,
  });

  final bool? success;
  final CompanyOwner? result;

  @override
  List<Object?> get props => [success, result];

  @override
  bool get stringify => true;

  /// Deserializes the given [JsonMap] into a [CompanyOwnerResult].
  static CompanyOwnerResult fromJson(JsonMap json) => _$CompanyOwnerResultFromJson(json);

  /// Converts this [CompanyOwnerResult] into a [JsonMap].
  JsonMap toJson() => _$CompanyOwnerResultToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class CompanyOwner extends Equatable {
  const CompanyOwner({
    this.alertActions,
    this.alertModel,
    this.alertType,
    this.client_code,
    this.company_owner,
    this.contact,
    this.creation_dt,
    this.ctry,
    this.currency,
    this.expiration_dt,
    this.geoDataType,
    required this.id,
    this.layer,
    this.module,
    this.name,
    this.params,
    this.reports,
    this.totalData,
  });

  final CompanyOwnerContact? contact;
  final CompanyOwnerParams? params;
  final List<String>? alertActions;
  @JsonKey(name: '_alertModel')
  final List<String>? alertModel;
  @JsonKey(name: '_alertType')
  final List<String>? alertType;
  @JsonKey(name: '_geoDataType')
  final List<String>? geoDataType;
  @JsonKey(name: '_layer')
  final List<String>? layer;
  @JsonKey(name: '_module')
  final List<String>? module;
  @JsonKey(name: '_reports')
  final List<String>? reports;
  final String? client_code;
  @JsonKey(name: '_company_owner')
  final String? company_owner;
  final String? creation_dt;
  @JsonKey(name: '_ctry')
  final String? ctry;
  final String? currency;
  final String? expiration_dt;
  @JsonKey(name: '_id')
  final String id;
  final String? name;
  final TotalData? totalData;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      contact,
      params,
      alertActions,
      alertModel,
      alertType,
      geoDataType,
      layer,
      module,
      reports,
      client_code,
      company_owner,
      creation_dt,
      ctry,
      currency,
      expiration_dt,
      id,
      name,
      totalData,
    ];
  }

  /// Deserializes the given [JsonMap] into a [CompanyOwner].
  static CompanyOwner fromJson(JsonMap json) => _$CompanyOwnerFromJson(json);

  /// Converts this [CompanyOwner] into a [JsonMap].
  JsonMap toJson() => _$CompanyOwnerToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class CompanyOwnerContact extends Equatable {
  const CompanyOwnerContact({
    this.fax,
    this.phone,
    this.mail,
  });

  final String? fax;
  final String? phone;
  final String? mail;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [fax, mail, phone];

  /// Deserializes the given [JsonMap] into a [CompanyOwnerContact].
  static CompanyOwnerContact fromJson(JsonMap json) =>
      _$CompanyOwnerContactFromJson(json);

  /// Converts this [CompanyOwnerContact] into a [JsonMap].
  JsonMap toJson() => _$CompanyOwnerContactToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class CompanyOwnerParams extends Equatable {
  const CompanyOwnerParams({
    this.fraudRate,
    this.tank_over,
    this.tank_under,
    this.tank_threshold,
  });

  final int? fraudRate;
  final int? tank_over;
  final int? tank_under;
  final int? tank_threshold;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [fraudRate, tank_over, tank_under, tank_threshold];

  /// Deserializes the given [JsonMap] into a [CompanyOwnerParams].
  static CompanyOwnerParams fromJson(JsonMap json) =>
      _$CompanyOwnerParamsFromJson(json);

  /// Converts this [CompanyOwnerParams] into a [JsonMap].
  JsonMap toJson() => _$CompanyOwnerParamsToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class TotalData extends Equatable {
  const TotalData({
    this.username,
    this.password,
    this.check_access,
  });

  final String? username;
  final String? password;
  final bool? check_access;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [username, password, check_access];

  /// Deserializes the given [JsonMap] into a [TotalData].
  static TotalData fromJson(JsonMap json) => _$TotalDataFromJson(json);

  /// Converts this [TotalData] into a [JsonMap].
  JsonMap toJson() => _$TotalDataToJson(this);
}
