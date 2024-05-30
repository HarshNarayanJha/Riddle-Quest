import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riddle_quest_app/provider/room_data_provider.dart';
import 'package:riddle_quest_app/resources/socket_helper.dart';
import 'package:riddle_quest_app/widgets/responsive.dart';
import 'package:riddle_quest_app/widgets/riddle_quest_app_bar.dart';
import 'package:riddle_quest_app/widgets/waiting_room.dart';

class GamePage extends StatefulWidget {
  static const routeName = '/home/game';

  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _socketHelper = SocketHelper();

  @override
  void initState() {
    super.initState();

    _socketHelper.updateRoomListener(context);
    _socketHelper.updatePlayersListener(context);
    _socketHelper.leaveRoomListener(context);
  }

  @override
  void dispose() {
    super.dispose();

    _socketHelper.removeUpdateRoomListener(context);
    _socketHelper.removeUpdatePlayersListener(context);
    _socketHelper.removeLeaveRoomListener(context);
  }

  Future<bool> _onBack(BuildContext context, RoomDataProvider roomDataProvider) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert!'),
          content: const Text('Going back will destroy the room, and no one will be able to join the room'),
          actions: <Widget>[
            TextButton(
              child: const Text('Stay in the Room'),
              onPressed: () {
                print("Stay in the room");
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Destroy the room'),
              onPressed: () {
                print("Destroy the room");
                _socketHelper.destroyRoom(roomDataProvider.roomData['id']);
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    final size = MediaQuery.of(context).size;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        bool canPop = await _onBack(context, roomDataProvider);
        if (canPop) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: const RiddleQuestAppBar(),
        body: Responsive(
          maxWidth: 900,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: (roomDataProvider.roomData['canJoin'])
                ? WaitingRoom(size: size, roomDataProvider: roomDataProvider)
                : const Text("Starting Game"),
          ),
        ),
      ),
    );
  }
}
