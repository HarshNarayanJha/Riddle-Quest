import 'package:flutter/material.dart';
import 'package:riddle_quest_app/provider/room_data_provider.dart';
import 'package:riddle_quest_app/widgets/hero_text.dart';

class WaitingRoom extends StatelessWidget {
  const WaitingRoom({
    super.key,
    required this.size,
    required this.roomDataProvider,
  });

  final Size size;
  final RoomDataProvider roomDataProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                roomDataProvider.roomData['id'],
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
            "1. ${roomDataProvider.roomData['playerRoom']['nickname']}",
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
      );
  }
}
