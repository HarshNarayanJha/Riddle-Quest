import 'package:flutter/material.dart';
import 'package:riddle_quest_app/resources/socket_helper.dart';
import 'package:riddle_quest_app/widgets/custom_button.dart';
import 'package:riddle_quest_app/widgets/custom_text_field.dart';
import 'package:riddle_quest_app/widgets/hero_text.dart';
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
  final _socketHelper = SocketHelper();

  @override
  void initState() {
    super.initState();
    _socketHelper.roomJoinedListener(context);
    _socketHelper.updatePlayersListener(context);
    _socketHelper.errorOccurredListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _roomCodeController.dispose();

    // UnListeners
    _socketHelper.removeRoomJoinedListener();
    _socketHelper.removeUpdatePlayersListener();
    _socketHelper.removeErrorOccurredListener();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const RiddleQuestAppBar(),
      body: SingleChildScrollView(
        child: Responsive(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.08),
                const HeroText(text: "Join Room"),
                SizedBox(height: size.height * 0.08),
                CustomTextField(
                    controller: _nameController,
                    hintText: "Enter Your Nickname",
                    fillColor: Theme.of(context).colorScheme.onInverseSurface),
                SizedBox(height: size.height * 0.05),
                CustomTextField(
                    controller: _roomCodeController,
                    hintText: "Enter Room Code",
                    fillColor: Theme.of(context).colorScheme.onInverseSurface),
                SizedBox(height: size.height * 0.05),
                CustomButton(onTap: () {
                  _socketHelper.joinRoom(context, _nameController.text, _roomCodeController.text);
                }, text: "Join Room!"),
                SizedBox(height: size.height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}