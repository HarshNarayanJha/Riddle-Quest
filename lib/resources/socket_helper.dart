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

  void destroyRoom(String roomId) {
    if (roomId.isNotEmpty) {
      _socketClient.emit('destroyRoom', {
        'roomId': roomId,
      });
    }
  }

  // Listeners
  void roomCreatedListener(BuildContext context) {
    // print("Listening for roomCreated");
    _socketClient.on('roomCreated', (room) {
      // print(room);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GamePage.routeName);
    });
  }

  void roomJoinedListener(BuildContext context) {
    // print("Listening for roomJoined");
    _socketClient.on('roomJoined', (room) {
      // print(room);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GamePage.routeName);
    });
  }

  void errorOccurredListener(BuildContext context) {
    // print("Listening for errorOccurred");
    _socketClient.on('errorOccurred', (error) {
      // print(error);
      showSnackBar(context, error);
    });
  }

  void updatePlayersListener(BuildContext context) {
    // print("Listening for updatePlayers");
    _socketClient.on('updatePlayers', (players) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1 (players[0]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer2(players[1]);
    });
  }

  void updateRoomListener(BuildContext context) {
    // print("Listening for updateRoom");
    _socketClient.on('updateRoom', (room) {
      Provider.of<RoomDataProvider>(context, listen: false).updateRoomData(room);
    });
  }

  void leaveRoomListener(BuildContext context) {
    _socketClient.on('leaveRoom', (room) {
      Navigator.of(context).pop();
    });
  }

  // UnListeners
  void removeRoomCreatedListener(BuildContext context) {
    // print("UNListening for roomCreated");
    _socketClient.off('roomCreated');
  }

  void removeRoomJoinedListener(BuildContext context) {
    // print("UnListening for roomJoined");
    _socketClient.off('roomJoined');
  }

  void removeErrorOccurredListener(BuildContext context) {
    // print("UnListening for errorOccurred");
    _socketClient.off('errorOccurred');
  }

  void removeUpdatePlayersListener(BuildContext context) {
    // print("UnListening for updatePlayers");
    _socketClient.off('updatePlayers');
  }

  void removeUpdateRoomListener(BuildContext context) {
    // print("UnListening for updateRoom");
    _socketClient.off('updateRoom');
  }

  void removeLeaveRoomListener(BuildContext context) {
    _socketClient.off('leaveRoom');
  }
}
