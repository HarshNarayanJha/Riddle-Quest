import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riddle_quest_app/pages/home_page.dart';
import 'package:riddle_quest_app/provider/room_data_provider.dart';
import 'package:riddle_quest_app/resources/socket_helper.dart';
import 'package:riddle_quest_app/widgets/custom_button.dart';
import 'package:riddle_quest_app/widgets/responsive.dart';
import 'package:riddle_quest_app/widgets/riddle_quest_app_bar.dart';
import 'package:riddle_quest_app/widgets/waiting_room.dart';

class LobbyPage extends StatefulWidget {
  static const routeName = '/home/game';

  const LobbyPage({super.key});

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  final _socketHelper = SocketHelper();

  @override
  void initState() {
    super.initState();

    _socketHelper.updateRoomListener(context);
    _socketHelper.updatePlayersListener(context);
    _socketHelper.leaveRoomListener(context);
    _socketHelper.scanStartedListener(context);
    _socketHelper.errorOccurredListener(context);
  }

  @override
  void dispose() {
    super.dispose();

    _socketHelper.removeUpdateRoomListener();
    _socketHelper.removeUpdatePlayersListener();
    _socketHelper.removeLeaveRoomListener();
    _socketHelper.removeScanStartedListener();
    _socketHelper.removeErrorOccurredListener();

    _socketHelper.destroyRoom(Provider.of<RoomDataProvider>(context).roomData['id']);
  }

  Future<bool> _onBack(
      BuildContext context, RoomDataProvider roomDataProvider) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert!'),
          content: const Text(
              'Going back will destroy the room, and no one will be able to join the room'),
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
          if (context.mounted) {
            Navigator.of(context).popUntil(ModalRoute.withName(HomePage.routeName));
          }
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
                : ((roomDataProvider.didCreateRoom)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Where are you two playing the game ?",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(height: size.height * 0.12),
                          LargeButton(
                            text: 'Indoors',
                            icon: Icons.house_rounded,
                            bgColor: Colors.blue,
                            size: size,
                            onTap: () {
                              _socketHelper.startScan(0, roomDataProvider.roomData['id']);
                            },
                          ),
                          SizedBox(height: size.height * 0.04),
                          LargeButton(
                            text: "Outdoors",
                            size: size,
                            icon: Icons.park_rounded,
                            bgColor: Colors.green,
                            onTap: () {
                              _socketHelper.startScan(1, roomDataProvider.roomData['id']);
                            },
                          )
                        ],
                      )
                    : Text(
                        "Waiting for ${roomDataProvider.player1.nickname} to configure the game...",
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 18),
                      )),
          ),
        ),
      ),
    );
  }
}
