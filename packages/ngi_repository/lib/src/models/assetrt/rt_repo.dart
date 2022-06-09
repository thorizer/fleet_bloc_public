// ignore_for_file: public_member_api_docs, non_constant_identifier_names, constant_identifier_names, lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';

part 'rt_repo.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class RtRepo extends Equatable {
  /// {@macro RT}
  const RtRepo({
    this.CANBUSDATA_dt,
    this.CANBUSDATA,
    this.consL_Km,
    this.gps_dt,
    this.io_dt,
    this.io,
    this.last_stop_dt,
    this.loc_dt,
    this.loc,
    this.odo,
    this.srv_dt,
    this.status = 'disabled',
    this.uid_dt,
    this.uid,
    this.working_time,
  });

  final double? odo;
  final Loc? loc;
  final Map<String, Object?>? CANBUSDATA;
  final Map<String, Object?>? io;
  final num? working_time;
  final String? CANBUSDATA_dt;
  final String? consL_Km;
  final String? gps_dt;
  final String? io_dt;
  final String? last_stop_dt;
  final String? loc_dt;
  final String? srv_dt;
  final String? status;
  final String? uid_dt;
  final String? uid;

  String getStatut(Map<String, Object?>? io) {
    if (io?['spd'] != null &&
        io?['con'] != null &&
        io?['spd'] is num &&
        io?['con'] is num) {
      if (io!['con'] == 1 && io['spd']! as num > 0) {
        return 'drive';
      } else if (io['con'] == 1 && io['spd']! as num == 0) {
        return 'idle';
      } else if (io['con'] == 0) {
        return 'stop';
      }
    }
    return 'disabled';
  }

  /// Deserializes the given [JsonMap] into a [RtRepo].
  static RtRepo fromJson(JsonMap json) => _$RtRepoFromJson(json);

  /// Converts this [RtRepo] into a [JsonMap].
  JsonMap toJson() => _$RtRepoToJson(this);

  /// Returns a copy of this Io with the given values updated.
  ///
  /// {@macro Io}
  RtRepo copyWith({
    double? odo,
    Loc? loc,
    Map<String, Object?>? CANBUSDATA,
    Map<String, Object?>? io,
    num? working_time,
    String? CANBUSDATA_dt,
    String? consL_Km,
    String? gps_dt,
    String? io_dt,
    String? last_stop_dt,
    String? loc_dt,
    String? srv_dt,
    String? uid_dt,
    String? uid,
    String? status,
  }) {
    return RtRepo(
      CANBUSDATA_dt: CANBUSDATA_dt ?? this.CANBUSDATA_dt,
      CANBUSDATA: CANBUSDATA ?? this.CANBUSDATA,
      consL_Km: consL_Km ?? this.consL_Km,
      gps_dt: gps_dt ?? this.gps_dt,
      io_dt: io_dt ?? this.io_dt,
      io: io ?? this.io,
      last_stop_dt: last_stop_dt ?? this.last_stop_dt,
      loc_dt: loc_dt ?? this.loc_dt,
      loc: loc ?? this.loc,
      odo: odo ?? this.odo,
      srv_dt: srv_dt ?? this.srv_dt,
      uid_dt: uid_dt ?? this.uid_dt,
      uid: uid ?? this.uid,
      working_time: working_time ?? this.working_time,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      CANBUSDATA_dt,
      CANBUSDATA,
      consL_Km,
      gps_dt,
      io_dt,
      io,
      last_stop_dt,
      loc_dt,
      loc,
      odo,
      srv_dt,
      uid_dt,
      uid,
      working_time,
      status,
    ];
  }
}
