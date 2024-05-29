import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riddle Quest"),
        centerTitle: true,
        elevation: 0,
      ),
      body: const Center(
        child: Column(
          children: [
            Text("Scan and Solve")
          ],
        ),
      ),
    );
  }
}
