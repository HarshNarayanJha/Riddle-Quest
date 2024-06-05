// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:riddle_quest_app/models/player.dart';

class RoomDataProvider extends ChangeNotifier {
  // notifyListener

  Map<String, dynamic> _roomData = {};
  Player _player1 = Player(nickname: '', socketId: '', points: 0, imagesDone: 0);
  Player _player2 = Player(nickname: '', socketId: '', points: 0, imagesDone: 0);

  Map<String, dynamic> get roomData => _roomData;
  Player get player1 => _player1;
  Player get player2 => _player2;

  late bool _didCreateRoom;
  bool _receivedRiddle = true;
  String _currentItemName = "";
  String _currentRiddle = "";

  bool get didCreateRoom => _didCreateRoom;

  Player get myPlayer => _didCreateRoom ? _player1 : _player2;

  bool get receivedRiddle => _receivedRiddle;
  String get currentItemName => _currentItemName;
  String get currentRiddle => _currentRiddle;

  // late List<CameraDescription> _cameras;

  // List<CameraDescription> get cameras => _cameras;


  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> player1Data) {
    _player1 = Player.fromMap(player1Data);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> player2Data) {
    _player2 = Player.fromMap(player2Data);
    notifyListeners();
  }

  void setDidCreateRoom(bool didCreate) {
    _didCreateRoom = didCreate;
    notifyListeners();
  }

  void updateReceivedRiddle(bool state) {
    _receivedRiddle = state;
  }

  void updateRiddleData(String itemName, String riddle) {
    _currentItemName = itemName;
    _currentRiddle = riddle;
    notifyListeners();
  }

  // void setCameras(List<CameraDescription> cameras) {
  //   _cameras = cameras;
  //   notifyListeners();
  // }
}