import 'package:flutter/material.dart';

class RiddleQuestAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RiddleQuestAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Riddle Quest"),
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      centerTitle: true,
      elevation: 10,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(60);
}
