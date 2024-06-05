import 'package:flutter/material.dart';
import 'package:riddle_quest_app/resources/socket_helper.dart';
import 'package:riddle_quest_app/widgets/custom_button.dart';
import 'package:riddle_quest_app/widgets/custom_text_field.dart';
import 'package:riddle_quest_app/widgets/hero_text.dart';
import 'package:riddle_quest_app/widgets/responsive.dart';
import 'package:riddle_quest_app/widgets/riddle_quest_app_bar.dart';

class CreateRoomPage extends StatefulWidget {
  static const String routeName = '/home/createRoom';
  const CreateRoomPage({super.key});

  @override
  State<CreateRoomPage> createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {
  final TextEditingController _nameController = TextEditingController();
  final _socketHelper = SocketHelper();

  @override
  void initState() {
    super.initState();
    _socketHelper.roomCreatedListener(context);
    _socketHelper.errorOccurredListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();

    // UnListeners

    _socketHelper.removeRoomCreatedListener();
    _socketHelper.removeErrorOccurredListener();
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeroText(text: "Create Room"),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                  controller: _nameController,
                  hintText: "Enter Your Nickname",
                  fillColor: Theme.of(context).colorScheme.onInverseSurface),
              SizedBox(height: size.height * 0.05),
              CustomButton(
                  onTap: () {
                    _socketHelper.createRoom(context, _nameController.text);
                  },
                  text: "Create Room!")
            ],
          ),
        ),
      ),
    );
  }
}
