// ignore_for_file: no_default_cases, library_private_types_in_public_api

/*
Note: app.dart is split into two parts App and AppView.
App is responsible for creating/providing the AuthenticationBloc
which will be consumed by the AppView. This decoupling will enable us
to easily test both the App and AppView widgets later on.

Note: RepositoryProvider is used to provide the single instance of
AuthenticationRepository to the entire application
which will come in handy later on.

AppView is a StatefulWidget because it maintains a GlobalKey
which is used to access the NavigatorState. By default,
AppView will render the SplashPage (which we will see later)
and it uses BlocListener to navigate to different pages based on changes
in the AuthenticationState. */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdm_bloc/authentication/authentication.dart';
import 'package:gdm_bloc/home/home.dart';
import 'package:gdm_bloc/login/login.dart';
import 'package:gdm_bloc/shared/constants.dart';
import 'package:gdm_bloc/splash/splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngi_repository/ngi_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;


  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NGI Fleet',
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
