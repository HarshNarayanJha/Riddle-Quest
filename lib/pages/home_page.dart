import 'package:flutter/material.dart';
import 'package:riddle_quest_app/pages/create_room_page.dart';
import 'package:riddle_quest_app/pages/join_room_page.dart';
import 'package:riddle_quest_app/widgets/custom_button.dart';
import 'package:riddle_quest_app/widgets/responsive.dart';
import 'package:riddle_quest_app/widgets/riddle_quest_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();

  void toCreateRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomPage.routeName);
  }

  void toJoinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomPage.routeName);
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RiddleQuestAppBar(),
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  onTap: () => widget.toCreateRoom(context),
                  text: "Create Room"),
              const SizedBox(height: 20),
              CustomButton(
                  onTap: () => widget.toJoinRoom(context),
                  text: "Join Room"),
            ],
          ),
        ),
      ),
    );
  }
}
