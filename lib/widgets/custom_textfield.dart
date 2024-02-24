import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final int maxLength;
  final int? maxLines;
  final String hentText;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.maxLength,
    this.maxLines,
    required this.hentText,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return const TextField();
  }
}
