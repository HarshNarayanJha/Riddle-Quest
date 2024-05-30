import 'package:flutter/material.dart';

class RoomDataProvider extends ChangeNotifier {
  // notifyListener

  Map<String, dynamic> _roomData = {};

  Map<String, dynamic> get roomData => _roomData;


  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }
}