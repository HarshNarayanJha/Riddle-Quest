import 'package:flutter/material.dart';
import 'package:riddle_quest/pages/home_page.dart';
import 'package:riddle_quest/theme/theme.dart';
import 'package:riddle_quest/theme/util.dart';

void main() {
  runApp(const RiddleQuest());
}

class RiddleQuest extends StatelessWidget {
  const RiddleQuest({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Roboto", "Lemon");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: "Riddle Quest",
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const HomePage(),
    );
  }
}
