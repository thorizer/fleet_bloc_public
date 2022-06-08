// ignore_for_file: avoid_print, lines_longer_than_80_chars

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ngi_api/ngi_api.export.dart';

/// {@template ngi_api}
/// The interface for an API that provides authentification
/// {@endtemplate}
class LoginApi {
  /// {@macro ngi_api}
  LoginApi({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  /// Provides a [Future] of all User Login Result.
  Future<UserLoginResult> getLogin({
    required String login,
    required String password,
  }) async {
    final loginResultResponse = await _httpClient.post(
      Uri.parse('${TcFleetTunEnvironment.apiURL}/login'),
      body: json.encode({'login': login, 'password': password}),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (loginResultResponse.statusCode != 200) {
      throw LoginResultResponseFailure();
    }
    try {
      final dynamic userLoginResult = jsonDecode(
        loginResultResponse.body,
      );

      return UserLoginResult.fromJson(userLoginResult as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
      throw LoginResultJsonDecodeFailure();
    }
  }
}

/// Error thrown when a [LoginResult] with a given id is not found.
class LoginResultNotFoundException implements Exception {}

/// Exception thrown when locationSearch fails.
class LoginResultResponseFailure implements Exception {}

/// Exception thrown when json serioalizatiobn fails.
class LoginResultJsonDecodeFailure implements Exception {}

/// Exception thrown when locationSearch fails.
class LoginResultNotEmpty implements Exception {}

// **************************************************************************
void main() {
  const encoder = JsonEncoder.withIndent('  ');
  final loginApi = LoginApi();
  loginApi.getLogin(login: '', password: '').then(
    (loginResult) {
      final prettyprint = encoder.convert(loginResult);
      print('**************');
      print(prettyprint);
    },
  );
}
