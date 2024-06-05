import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: (onTap == null) ? Colors.grey : Colors.blue,
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
              color: (onTap == null) ? Colors.grey.shade300 : Theme.of(context).colorScheme.onSecondaryContainer),
        ),
      ),
    );
  }
}

class LargeButton extends StatelessWidget {
  const LargeButton({
    super.key,
    required this.text,
    required this.size,
    required this.icon,
    required this.bgColor,
    required this.onTap,
  });

  final String text;
  final Size size;
  final IconData icon;
  final Color bgColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      label: Text(
        text,
        style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.onSecondaryContainer),
      ),
      icon: Icon(
        icon,
        size: 24,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(size.width, 65),
          backgroundColor: bgColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
    );
  }
}

