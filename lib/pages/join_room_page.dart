import 'package:flutter/material.dart';
import 'package:riddle_quest_app/widgets/custom_button.dart';
import 'package:riddle_quest_app/widgets/custom_text_field.dart';
import 'package:riddle_quest_app/widgets/responsive.dart';
import 'package:riddle_quest_app/widgets/riddle_quest_app_bar.dart';

class JoinRoomPage extends StatefulWidget {
  static const String routeName = '/home/joinRoom';
  const JoinRoomPage({super.key});

  @override
  State<JoinRoomPage> createState() => _JoinRoomPageState();
}

class _JoinRoomPageState extends State<JoinRoomPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomCodeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _roomCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const RiddleQuestAppBar(),
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Join Room",
                style: Theme.of(context)
                    .primaryTextTheme
                    .displayLarge
                    ?.copyWith(fontSize: 80, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                  controller: _nameController,
                  hintText: "Enter You Nickname",
                  fillColor: Theme.of(context).colorScheme.onInverseSurface),
              SizedBox(height: size.height * 0.05),
              CustomTextField(
                  controller: _roomCodeController,
                  hintText: "Enter Room Code",
                  fillColor: Theme.of(context).colorScheme.onInverseSurface),
              SizedBox(height: size.height * 0.05),
              CustomButton(onTap: () {}, text: "Join Room!")
            ],
          ),
        ),
      ),
    );
  }
}