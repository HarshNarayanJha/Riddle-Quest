import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riddle_quest_app/pages/game_page.dart';
import 'package:riddle_quest_app/provider/room_data_provider.dart';
import 'package:riddle_quest_app/resources/socket_client.dart';
import 'package:riddle_quest_app/utils/utils.dart';

class SocketHelper {
  final _socketClient = SocketClient.instance.socket!;

  // emmiters
  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
    }
  }

  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit('joinRoom', {
        'nickname': nickname,
        'roomId': roomId,
      });
    }
  }

  // Listeners
  void roomCreatedListener(BuildContext context) {
    print("Listening for roomCreated");
    _socketClient.on('roomCreated', (room) {
      print(room);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GamePage.routeName);
    });
  }

  void roomJoinedListener(BuildContext context) {
    print("Listening for roomJoined");
    _socketClient.on('roomJoined', (room) {
      print(room);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GamePage.routeName);
    });
  }

  void errorOccurredListener(BuildContext context) {
    print("Listening for errorOccurred");
    _socketClient.on('errorOccurred', (error) {
      print(error);
      showSnackBar(context, error); 
    });
  }
}
