import 'package:flutter/material.dart';
import 'package:riddle_quest_app/pages/create_room_page.dart';
import 'package:riddle_quest_app/pages/game_page.dart';
import 'package:riddle_quest_app/pages/home_page.dart';
import 'package:riddle_quest_app/pages/join_room_page.dart';
import 'package:riddle_quest_app/theme/theme.dart';
import 'package:riddle_quest_app/theme/util.dart';

void main() {
  runApp(const RiddleQuest());
}

class RiddleQuest extends StatelessWidget {
  const RiddleQuest({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Work Sans", "Fira Sans");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: "Riddle Quest",
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        CreateRoomPage.routeName: (context) => const CreateRoomPage(),
        JoinRoomPage.routeName: (context) => const JoinRoomPage(),
        GamePage.routeName: (context) => const GamePage(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
