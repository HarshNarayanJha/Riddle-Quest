// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riddle_quest_app/pages/create_room_page.dart';
import 'package:riddle_quest_app/pages/item_scan_page.dart';
import 'package:riddle_quest_app/pages/lobby_page.dart';
import 'package:riddle_quest_app/pages/home_page.dart';
import 'package:riddle_quest_app/pages/join_room_page.dart';
import 'package:riddle_quest_app/provider/room_data_provider.dart';
import 'package:riddle_quest_app/theme/theme.dart';
import 'package:riddle_quest_app/theme/util.dart';

// late List<CameraDescription> _cameras;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RiddleQuestApp());
}

class RiddleQuestApp extends StatelessWidget {
  const RiddleQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Work Sans", "Fira Sans");
    MaterialTheme theme = MaterialTheme(textTheme);

    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        title: "Riddle Quest",
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          CreateRoomPage.routeName: (context) => const CreateRoomPage(),
          JoinRoomPage.routeName: (context) => const JoinRoomPage(),
          LobbyPage.routeName: (context) => const LobbyPage(),
          ItemScanPage.routeName: (context) => const ItemScanPage(),
        },
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
