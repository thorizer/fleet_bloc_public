// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ngi_api/ngi_api.export.dart';

/// {@template ngi_api}
/// The interface for an API that provides access to a list of comapny.
/// {@endtemplate}
class CompanyApi {
  /// {@macro ngi_api}
  CompanyApi({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  /// Provides a [Future] of all comapny.
  Future<CompanyOwnerResult> getComapny({
    required String token,
    required String id,
  }) async {
    final comapnyResponse = await _httpClient.get(
      Uri.parse('${TcFleetTunEnvironment.apiURL}/company/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

      if (comapnyResponse.statusCode != 200) {
        print(comapnyResponse.request);
        throw CompanyOwnerByIdResponseFailure();
      }


    try {
      final dynamic comapnyResult = jsonDecode(
        comapnyResponse.body,
      );

      return CompanyOwnerResult.fromJson(
        comapnyResult as Map<String, dynamic>,
      );
    } catch (e) {
      print(e.toString());
      throw CompanyOwnerByIdJsonDecodeFailure();
    }
  }
}

/// Error thrown when a [CompanyOwner] with a given id is not found.
class CompanyNotFoundException implements Exception {}

/// Exception thrown when locationSearch fails.
class CompanyOwnerByIdResponseFailure implements Exception {}

/// Exception thrown when json serioalizatiobn fails.
class CompanyOwnerByIdJsonDecodeFailure implements Exception {}

/// Exception thrown when locationSearch fails.
class CompanyOwnerByIdNotEmpty implements Exception {}

// **************************************************************************
void main() {
  const encoder = JsonEncoder.withIndent('  ');
  final comapnyApi = CompanyApi();
  comapnyApi
      .getComapny(token: '', id: '587c9ab4363e8e2e5a22dd74')
      .then( (x) {
        final prettyprint = encoder.convert(x.result);
        print(prettyprint);
      },);
}
