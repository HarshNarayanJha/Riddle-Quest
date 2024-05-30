import 'package:flutter/material.dart';

class HeroText extends StatelessWidget {
  final String text;
  final double fontSize;
  const HeroText({
    super.key, required this.text, this.fontSize = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:  Alignment.centerLeft, 
      child: Text(
        text,
        style: Theme.of(context)
            .primaryTextTheme
            .displayLarge
            ?.copyWith(fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}