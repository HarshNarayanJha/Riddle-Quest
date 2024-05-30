import 'package:flutter/material.dart';
import 'package:riddle_quest_app/pages/game_page.dart';
import 'package:riddle_quest_app/resources/socket_client.dart';

class SocketHelper {
  static final _socketClient = SocketClient.instance.socket!;

  static void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
    }
  }

  static void roomCreatedListener(BuildContext context) {
    print("Listening for roomCreated");
    _socketClient.on('roomCreated', (room) {
      print(room);
      Navigator.pushNamed(context, GamePage.routeName);
    });
  }
}
