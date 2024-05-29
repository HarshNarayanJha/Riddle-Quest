import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color fillColor;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlue)),
          fillColor: fillColor,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
