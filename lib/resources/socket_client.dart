// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io(
        'http://192.168.1.14:3000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket?.connect();

    socket?.onError((data) => print("Error --> $data"));
    socket?.onConnecting((data) => print("Connecting --> $data"));
    socket?.onConnectError((data) => print("Connect Error  --> $data"));
    socket?.onConnect((data) => print("Connect --> $data"));
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
