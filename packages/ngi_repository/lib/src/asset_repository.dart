// ignore_for_file: lines_longer_than_80_chars, avoid_print, public_member_api_docs, avoid_void_async

import 'dart:async';
import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:ngi_repository/ngi_repository.dart';
import 'package:tuple/tuple.dart';

/// {@template AssetRepository}
/// A repository that handles Asset related requests.
/// {@endtemplate}
class AssetRepository {
  /// A repository that handles ngi related requests
  AssetRepository({
    AssetsApi? assetsApi,
  }) : _assetsApi = assetsApi ?? AssetsApi();

  final AssetsApi _assetsApi;

  /// Provides a [Future] of all assets.
  Future<Tuple2<List<Asset>, Map<String, RtRepo?>>> getAllAssetsQuerry({
    String? token,
    Map<String, Object>? query,
    List<Fleet>? fleetList,
  }) async {
    // Hive.init('/data/hive');
    final token = Hive.box<dynamic>('login').get('token') as String?;
    final assetsResult = await _assetsApi.getAssetsQuerry(
      token: token ?? '',
      query: {},
    );
    final assets = <Asset>[];
    final assetsRt = <String, RtRepo?>{};
    for (final asset in assetsResult.result) {
      final rtrep = RtRepo(
        CANBUSDATA: asset.rt?.CANBUSDATA,
        CANBUSDATA_dt: asset.rt?.CANBUSDATA_dt,
        consL_Km: asset.rt?.consL_Km,
        gps_dt: asset.rt?.gps_dt,
        io_dt: asset.rt?.io_dt,
        last_stop_dt: asset.rt?.last_stop_dt,
        loc_dt: asset.rt?.loc_dt,
        odo: asset.rt?.odo,
        srv_dt: asset.rt?.srv_dt,
        uid: asset.rt?.uid,
        uid_dt: asset.rt?.uid_dt,
        working_time: asset.rt?.working_time,
        loc: asset.rt?.loc,
        io: asset.rt?.io,
        status: const RtRepo().getStatut(asset.rt?.io),
      );
      assetsRt[asset.id] = rtrep;
      final fleetIds = <String>[];
      if (fleetList != null) {
        for (final fleet in fleetList) {
          if (fleet.assets != null) {
            if (fleet.assets!.contains(asset.id)) {
              fleetIds.add(fleet.id);
            }
          }
        }
      }
      assets.add(asset.copyWith(fleet: fleetIds));
    }
    final assetRtTupple =
        Tuple2<List<Asset>, Map<String, RtRepo?>>(assets, assetsRt);
    return assetRtTupple;
  }

  /// Provides a [Future] of all assets.
  Future<List<Fleet>> getAllFleetsQuerry({
    String? token,
    Map<String, Object>? query,
    List<Fleet>? fleetList,
  }) async {
    //Hive.init('/data/hive');
    final token = Hive.box<dynamic>('login').get('token') as String?;

    final fleetsResult = await _assetsApi.getFleetsQuerry(
      token: token ?? '',
      query: {},
    );
    final fleets = <Fleet>[];
    final fleetsRt = <String, Fleet?>{};
    for (final fleet in fleetsResult.result) {
      fleetsRt[fleet.id] = fleet;
      final fleetIds = <String>[];
      if (fleetList != null) {
        for (final fleet in fleetList) {
          if (fleet.assets != null) {
            if (fleet.assets!.contains(fleet.id)) {
              fleetIds.add(fleet.id);
            }
          }
        }
      }
      fleets.add(fleet.copyWith());
    }
    return fleets;
  }
}

/// Error thrown when login input is wrong.
class WrongAssetException implements Exception {
  /// {@macro WrongLoginInputException}
  const WrongAssetException(this.error, this.stackTrace);

  /// The error that was caught.
  final Object error;

  /// The Stacktrace associated with the [error].
  final StackTrace stackTrace;
}

const Map<String, String> assetImage = {
  'drive': 'assets/images/fleet/truck/drive_3d.png',
  'idle': 'assets/images/fleet/truck/idle_3d.png',
  'stop': 'assets/images/fleet/truck/stop_3d.png',
  'disabled': 'assets/images/fleet/truck/disabled_3d.png',
};

// **************************************************************************
void main() async {
  const encoder = JsonEncoder.withIndent('  ');
  final assetRepository = AssetRepository();
  final assets = await assetRepository.getAllAssetsQuerry(
    token: '',
  );
  print(assets.item1.first);
  //print(assets.item2);
  //print(assetRepository.status.listen(print));

  final prettyprint = encoder.convert(assets.item2[assets.item1.first.id]);
  print(prettyprint);
}
