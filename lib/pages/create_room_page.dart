import 'package:flutter/material.dart';
import 'package:riddle_quest_app/widgets/custom_button.dart';
import 'package:riddle_quest_app/widgets/custom_text_field.dart';
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

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
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
                "Create Room",
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
              CustomButton(onTap: () {}, text: "Create Room!")
            ],
          ),
        ),
      ),
    );
  }
}
