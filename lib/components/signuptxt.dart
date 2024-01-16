import 'package:flutter/material.dart';

class Ctextfield extends StatelessWidget {
  final EdgeInsets padding;
  final String hintText;
  final controller;
  final TextInputType keyboardType; // Added keyboardType property

  const Ctextfield({
    Key? key,
    required this.padding,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text, // Default to TextInputType.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType, // Set the keyboardType property
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFF5450)),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      ),
    );
  }
}
