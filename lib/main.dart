// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdm_bloc/app.dart';
import 'package:hive/hive.dart';
import 'package:ngi_repository/ngi_repository.dart';
import 'package:path_provider/path_provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        final isValidHost = host == "tcfleet.ngi.tn" ||
            host == "10.20.160.105:4999" ||
            host == "civ.tc-fleet.com" ||
            host == "mar.tc-fleet.com" ||
            host == "new.ngi-gps.com" ||
            host == "app.ngi-gps.com" ||
            host == "41.224.35.21:7821" ||
            host == "orion-track.com";
        return isValidHost;
      };
  }
} 


void main() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async {
          WidgetsFlutterBinding.ensureInitialized();
          HttpOverrides.global = MyHttpOverrides();
          if (!kIsWeb) {
            final appDocumentDir = await getApplicationDocumentsDirectory();
            Hive.init(appDocumentDir.path);
            await Hive.openBox<dynamic>('login');
          }

          final authenticationRepository = AuthenticationRepository();
          runApp(App(authenticationRepository: authenticationRepository));
        },
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class AppBlocObserver extends BlocObserver {
  /* @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  } */

  /* @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('onTransition ${bloc.runtimeType} $transition');
  } */

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('onEvent ${bloc.runtimeType} $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
