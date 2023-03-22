import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    this.margin = const EdgeInsets.all(16),
    this.hintText = '',
  });

  final TextEditingController controller;
  final EdgeInsets margin;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin:margin,
      child: TextField(
        controller: controller,
        cursorHeight: 18,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
