// ignore_for_file: lines_longer_than_80_chars, public_member_api_docs



/// Provides the envirement variables of the API.
/// abstract class
abstract class Environment {

}

class TcFleetTunEnvironment extends Environment {
    static const String apiURL = 'http://41.224.35.21:7821/gps/api/v1.0';
  static const String socketURL = 'ws://41.224.35.21:7821';
  static const String bndUrl = 'http://41.224.35.21:7821/bgis/bnd';
  static const String titleUrl =
      'http://41.224.35.21:7821/bgis/bgis/wms?format=png';
}
