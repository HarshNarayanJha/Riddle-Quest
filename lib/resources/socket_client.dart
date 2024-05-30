// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io('http://192.168.104.94:3000',
        IO.OptionBuilder().setTransports(['websocket']).disableAutoConnect().build());
    socket?.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
