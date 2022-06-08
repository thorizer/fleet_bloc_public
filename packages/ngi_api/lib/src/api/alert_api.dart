// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ngi_api/ngi_api.export.dart';

/// {@template ngi_api}
/// The interface for an API that provides access to a list of alerts.
/// {@endtemplate}
class AlertsApi {
  /// {@macro ngi_api}
  AlertsApi({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  /// Provides a [Future] of all alerts.
  Future<AlertQuery> getAlerts({required String token}) async {
    final alertListResponse = await _httpClient.post(
      Uri.parse('${TcFleetTunEnvironment.apiURL}/alert/query?limit=1'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (alertListResponse.statusCode != 200) {
      throw AlertListResponseFailure();
    }
    try {
      final dynamic alertListResult = jsonDecode(
        alertListResponse.body,
      );

      return AlertQuery.fromJson(alertListResult as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
      throw AlertListJsonDecodeFailure();
    }
  }
}

/// Error thrown when a [Alert] with a given id is not found.
class AlertNotFoundException implements Exception {}

/// Exception thrown when locationSearch fails.
class AlertListResponseFailure implements Exception {}

/// Exception thrown when json serioalizatiobn fails.
class AlertListJsonDecodeFailure implements Exception {}

/// Exception thrown when locationSearch fails.
class AlertListNotEmpty implements Exception {}

// **************************************************************************
void main() {
  const encoder = JsonEncoder.withIndent('  ');
  final alertsApi = AlertsApi();
  final alerts = <Alert>[];
  alertsApi
      .getAlerts(token: '')
      .then((x) => {alerts.addAll(x.result)})
      .then(
    (_) {
      final prettyprint = encoder.convert(alerts[0]);
      for (final alert in alerts) {
        print(alert.toJson());
      }
      print('**************');
      print(prettyprint);
    },
  );
}
