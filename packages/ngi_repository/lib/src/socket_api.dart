// ignore_for_file: public_member_api_docs, library_prefixes, lines_longer_than_80_chars, cascade_invocations, avoid_print, avoid_dynamic_calls, avoid_void_async, unused_catch_stack
import 'dart:async';

import 'package:hive/hive.dart';
import 'package:ngi_repository/ngi_repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class StreamSocketController<T> {
  StreamSocketController() {
    print('Init Stream controller ${T.toString()}');
  }
  final _socketResponse = StreamController<T>();

  void Function(T) get addResponse => _socketResponse.sink.add;

  Stream<T> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}

class SocketApi {
  // Factry constructor to retutn same static instance everytime you create any object.
  factory SocketApi() {
    return _socketApi;
  }

  // An internal private constructor to access it for only once for static instance of class.
  SocketApi._internal() {
    print('internal');
  }

  static Future<void> init() async {
    token = await Hive.box<dynamic>('login').get('token') as String?;
    final userData = await AuthenticationRepository().getUserData();
    //print('userData:  $userData');
    //print('userData: $userData');
    //print('Enviroment: ${Environment.user2}');

    //await loginInfoBox.close();
    print('socket init connected: $status');

    if (status == 'disconnected') {
      status = 'connecting';
      //print(status);
      socket.connect();
      socket.on('server:connected', (dynamic data) {
        socket.emit(
          'user:connected',
          {'user': userData},
        );

        status = 'connected';
        //print(userData);
        print('socket instance created and $status');
      });

      socket.on('unauthorized', (dynamic data) {
        print('Unauthorized');
      });
      socket.onError(
        (dynamic error) => {print(error), print('socket error')},
      );
      socket.onDisconnect((dynamic data) {
        print('socket instance disconnected');
        //status = 'disconnected';
      });
    } else {
      print('socket instance already connected');
    }
  }

  static String status = 'disconnected';
  // A static private instance to access _socketApi from inside class only
  static final SocketApi _socketApi = SocketApi._internal();

  static IO.Socket socket = IO.io(
    TcFleetTunEnvironment.socketURL,
    IO.OptionBuilder()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .enableForceNewConnection()
        .setTimeout(5000)
        .setReconnectionDelay(10000)
        .enableReconnection()
        .setQuery(
          <dynamic, dynamic>{'token': token},
        )
        .build(),
  );

  static String? token = '';

  // All socket related functions.
  static Stream<Asset> getAsset() async* {
    final streamSocket = StreamSocketController<Asset>();
    try {
      socket.on('newMsg', (dynamic data) {
        try {
          streamSocket
              .addResponse(Asset.fromJson(data as Map<String, dynamic>));
          print(data['name']);
        } catch (e, stackTrace) {
          print('Exception newMsg');
          print(e);
          print(stackTrace);
          print(data);
        }
      });
      yield* streamSocket.getResponse;
    } catch (e) {
      print('Exception getAsset');
      print(e);
    } finally {
      print('Stream controller asset closed');
      socket.off('newMsg');
      streamSocket.dispose();
    }
  }

  static Stream<Alert> getAlertNew() async* {
    final streamSocket = StreamSocketController<Alert>();
    try {
      socket.on('newAlert', (dynamic data) {
        try {
          streamSocket
              .addResponse(Alert.fromJson(data as Map<String, dynamic>));
        } catch (e, stackTrace) {
          print('Exception newAlert');
          print(e);
          // print(stackTrace);
          print(data);
        }
      });
      yield* streamSocket.getResponse.take(20);
    } catch (e) {
      print('Exception getAlertNew');
      print(e);
    } finally {
      print('Stream controller alert new closed');
      socket.off('newAlert');
      streamSocket.dispose();
    }
  }

  static Stream<Alert> getAlertUpdate() async* {
    final streamSocket = StreamSocketController<Alert>();
    try {
      socket.on('updateAlert', (dynamic data) {
        try {
          streamSocket
              .addResponse(Alert.fromJson(data as Map<String, dynamic>));
        } catch (e, stackTrace) {
          print('Exception updateAlert');
          print(e);
          // print(stackTrace);
          print(data);
        }
      });
      yield* streamSocket.getResponse.take(20);
    } catch (e) {
      print('Exception getAlertUpdate');
      print(e);
    } finally {
      print('Stream controller alert update closed');
      socket.off('updateAlert');
      streamSocket.dispose();
    }
  }

  static Stream<Driver> getDriverChange() async* {
    final streamSocket = StreamSocketController<Driver>();
    try {
      socket.on('changeDriver', (dynamic data) {
        try {
          streamSocket
              .addResponse(Driver.fromJson(data as Map<String, dynamic>));
        } catch (e, stackTrace) {
          print('Exception changeDriver');
          print(e);
          // print(stackTrace);
          print(data);
        }
      });
      yield* streamSocket.getResponse.take(2);
    } catch (e) {
      print('Exception getDriverChange');
      print(e);
    } finally {
      print('Stream controller driver closed');
      socket.off('changeDriver');
      streamSocket.dispose();
    }
  }
}

//main
void main() async {
  await SocketApi.init();
  SocketApi.getAsset().listen(
    (Asset data) {
      print('Asset.1: ${data.name}');
    },
    cancelOnError: false,
    onError: print,
    onDone: () {
      print('*** asset.1 stream controller Done ***');
    },
  );

  SocketApi.getAlertNew().listen(
    (Alert data) {
      print('Alert-New.1: ${data.name}');
    },
    cancelOnError: false,
    onError: print,
    onDone: () {
      print('*** alert-new.1 stream controller Done ***');
    },
  );

  SocketApi.getAlertUpdate().listen(
    (Alert data) {
      print('Alert-Update.1: ${data.name}');
    },
    cancelOnError: false,
    onError: print,
    onDone: () {
      print('*** alert-update.1  stream controller Done ***');
    },
  );

  SocketApi.getDriverChange().listen(
    (Driver data) {
      print('Drievr-Change.1: ${data.first_name} ${data.last_name}');
    },
    cancelOnError: false,
    onError: print,
    onDone: () {
      print('*** driver-change.1 stream controller Done ***');
    },
  );
}
