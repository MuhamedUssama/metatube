import 'package:flutter/material.dart';
import 'package:metatube/utils/app_style.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const MainButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppTheme.accent),
        foregroundColor: MaterialStateProperty.all<Color>(AppTheme.dark),
      ),
      child: Text(text),
    );
  }
}
