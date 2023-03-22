import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    this.margin = const EdgeInsets.all(16),
    this.hintText = '',
    this.type = TextInputType.name,
    this.formatter,
    this.onChanged,
  });

  final TextEditingController controller;
  final EdgeInsets margin;
  final String hintText;
  final TextInputType type;
  final List<TextInputFormatter>? formatter;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: margin,
      child: TextField(
        controller: controller,
        cursorHeight: 18,
        onChanged: onChanged,
        keyboardType: type,
        inputFormatters: formatter,
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
