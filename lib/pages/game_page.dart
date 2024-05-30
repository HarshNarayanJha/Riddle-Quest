import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riddle_quest_app/provider/room_data_provider.dart';
import 'package:riddle_quest_app/widgets/hero_text.dart';
import 'package:riddle_quest_app/widgets/responsive.dart';
import 'package:riddle_quest_app/widgets/riddle_quest_app_bar.dart';

class GamePage extends StatefulWidget {
  static const routeName = '/home/game';

  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const RiddleQuestAppBar(),
      body: Responsive(
        maxWidth: 900,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeroText(text: "Room Created"),
              SizedBox(height: size.height * 0.01),
              Column(
                children: [
                  Text(
                    "Let the other player join using this Room Code",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    Provider.of<RoomDataProvider>(context).roomData['id'],
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextButton.icon(
                    onPressed: () {},
                    label: const Text("Share"),
                    icon: const Icon(Icons.share_outlined),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.08),
              Text(
                "1. ${Provider.of<RoomDataProvider>(context).roomData['players'][0]['nickname']}",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                "Waiting for the other player to join...",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
