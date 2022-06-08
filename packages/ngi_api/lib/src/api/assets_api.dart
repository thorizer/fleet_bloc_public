// ignore_for_file: avoid_print, lines_longer_than_80_chars

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ngi_api/ngi_api.export.dart';

/// {@template ngi_api}
/// The interface for an API that provides access to a list of assets.
/// {@endtemplate}
class AssetsApi {
  /// {@macro ngi_api}
  AssetsApi({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  /// Provides a [Future] of all assets.
  Future<AssetQuery> getAssetsQuerry({
    required String token,
    Map<String, Object>? query = const {},
  }) async {
    final assetListResponse = await _httpClient.post(
      Uri.parse('${TcFleetTunEnvironment.apiURL}/asset/query'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          'query': query,
        },
      ),
    );

    if (assetListResponse.statusCode != 200) {

      if (assetListResponse.statusCode == 401) {
      throw AssetListResponseUnauthorized();
    }
      throw AssetListResponseFailure();
    }



    try {
      final dynamic assetListResult = jsonDecode(
        assetListResponse.body,
      );

      return AssetQuery.fromJson(assetListResult as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
      throw AssetListJsonDecodeFailure();
    }
  }

 /// Provides a [Future] of all assets.
  Future<FleetQuery> getFleetsQuerry({
    required String token,
    Map<String, Object>? query = const {},
  }) async {
    final fleetListResponse = await _httpClient.post(
      Uri.parse('${TcFleetTunEnvironment.apiURL}/fleet/query'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          'query': query,
        },
      ),
    );

    if (fleetListResponse.statusCode != 200) {

      if (fleetListResponse.statusCode == 401) {
      throw FleetListResponseUnauthorized();
    }
      throw FleetListResponseFailure();
    }



    try {
      final dynamic fleetListResult = jsonDecode(
        fleetListResponse.body,
      );

      return FleetQuery.fromJson(fleetListResult as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
      throw FleetListJsonDecodeFailure();
    }
  }

}

/// Error thrown when Unauthorized
class AssetListResponseUnauthorized implements Exception {}

/// Error thrown when a [Asset] with a given id is not found.
class AssetNotFoundException implements Exception {}

/// Exception thrown when locationSearch fails.
class AssetListResponseFailure implements Exception {}

/// Exception thrown when json serioalizatiobn fails.
class AssetListJsonDecodeFailure implements Exception {}

/// Exception thrown when locationSearch fails.
class AssetListNotEmpty implements Exception {}


/// Error thrown when Unauthorized
class FleetListResponseUnauthorized implements Exception {}

/// Error thrown when a [Fleet] with a given id is not found.
class FleetNotFoundException implements Exception {}

/// Exception thrown when locationSearch fails.
class FleetListResponseFailure implements Exception {}

/// Exception thrown when json serioalizatiobn fails.
class FleetListJsonDecodeFailure implements Exception {}

/// Exception thrown when locationSearch fails.
class FleetListNotEmpty implements Exception {}

// **************************************************************************
void main() {
  // const encoder = JsonEncoder.withIndent('  ');
  final assetsApi = AssetsApi();
  final assets = <Asset>[];
  assetsApi
      .getAssetsQuerry(
        token: '',
        query: {'type' : 'CONCRETE_MIXER'},)
      .then((x) => {assets.addAll(x.result)})
      .then(
    (_) {
      //final prettyprint = encoder.convert(assets);
      //print(prettyprint);
      for (final asset in assets) {
        print(asset.toString());
      }
    },
  );
}
