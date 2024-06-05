import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riddle_quest_app/pages/home_page.dart';
import 'package:riddle_quest_app/pages/item_scan_page.dart';
import 'package:riddle_quest_app/pages/lobby_page.dart';
import 'package:riddle_quest_app/provider/room_data_provider.dart';
import 'package:riddle_quest_app/resources/socket_client.dart';
import 'package:riddle_quest_app/utils/utils.dart';

class SocketHelper {
  final _socketClient = SocketClient.instance.socket!;

  // emmiters
  void createRoom(BuildContext context, String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
    }

    Provider.of<RoomDataProvider>(context, listen: false)
        .setDidCreateRoom(true);
  }

  void joinRoom(BuildContext context, String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit('joinRoom', {
        'nickname': nickname,
        'roomId': roomId,
      });
    }

    Provider.of<RoomDataProvider>(context, listen: false)
        .setDidCreateRoom(false);
  }

  void destroyRoom(String roomId) {
    if (roomId.isNotEmpty) {
      print("Destroying room $roomId");
      _socketClient.emit('destroyRoom', {
        'roomId': roomId,
      });
    }
  }

  void startScan(int environmentType, String roomId) {
    if ((environmentType == 0 || environmentType == 1) && roomId.isNotEmpty) {
      _socketClient.emit('startScan', {
        'environmentType': environmentType,
        'roomId': roomId,
      });
    }
  }

  void scanImage(BuildContext context, XFile image, String roomId, bool didCreateRoom) async {
    if (roomId.isNotEmpty) {
      Provider.of<RoomDataProvider>(context, listen: false).updateReceivedRiddle(false);
      var bytes = await image.readAsBytes();
      // print("scanImage ${bytes}");
      _socketClient.emit('scanImage', {
        'image': bytes,
        'roomId': roomId,
        'didCreateRoom': didCreateRoom,
      });
    }
  }

  // Listeners
  void roomCreatedListener(BuildContext context) {
    // print("Listening for roomCreated");
    _socketClient.on('roomCreated', (room) {
      print("Created: $room");
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, LobbyPage.routeName);
    });
  }

  void roomJoinedListener(BuildContext context) {
    // print("Listening for roomJoined");
    _socketClient.on('roomJoined', (room) {
      print("Joined: $room");
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, LobbyPage.routeName);
    });
  }

  void errorOccurredListener(BuildContext context) {
    // print("Listening for errorOccurred");
    _socketClient.on('errorOccurred', (error) {
      print("Error: $error");
      showSnackBar(context, error);
    });
  }

  void updatePlayersListener(BuildContext context) {
    // print("Listening for updatePlayers");
    _socketClient.on('updatePlayers', (players) {
      print("Players: $players");
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(players[0]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer2(players[1]);
    });
  }

  void updateRoomListener(BuildContext context) {
    // print("Listening for updateRoom");
    _socketClient.on('updateRoom', (room) {
      print("Room: $room");
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
    });
  }

  void leaveRoomListener(BuildContext context) {
    _socketClient.on('leaveRoom', (room) {
      print("Room Leave $room");
      Navigator.of(context).popUntil(ModalRoute.withName(HomePage.routeName));
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    });
  }

  void scanStartedListener(BuildContext context) {
    _socketClient.on('scanStarted', (room) {
      print("Scan Started $room");
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, ItemScanPage.routeName);
    });
  }

  void scannedImageListener(BuildContext context, CameraController cameraController) {
    _socketClient.on('scannedImage', (data) {
      cameraController.resumePreview();
      print("Scanned: $data");
      Provider.of<RoomDataProvider>(context, listen: false).updateReceivedRiddle(true);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(data['players'][0]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer2(data['players'][1]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRiddleData(data['riddle']['item'], data['riddle']['riddle']);
    });
  }

  // UnListeners
  void removeRoomCreatedListener() {
    // print("UNListening for roomCreated");
    _socketClient.off('roomCreated');
  }

  void removeRoomJoinedListener() {
    // print("UnListening for roomJoined");
    _socketClient.off('roomJoined');
  }

  void removeErrorOccurredListener() {
    // print("UnListening for errorOccurred");
    _socketClient.off('errorOccurred');
  }

  void removeUpdatePlayersListener() {
    // print("UnListening for updatePlayers");
    _socketClient.off('updatePlayers');
  }

  void removeUpdateRoomListener() {
    // print("UnListening for updateRoom");
    _socketClient.off('updateRoom');
  }

  void removeLeaveRoomListener() {
    _socketClient.off('leaveRoom');
  }

  void removeScanStartedListener() {
    _socketClient.off('scanStarted');
  }

  void removeScannedImageListener() {
    _socketClient.off('scannedImage');
  }
}
