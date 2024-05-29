import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            minimumSize: Size(width, 50),
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSecondaryContainer),
        ),
      ),
    );
  }
}
