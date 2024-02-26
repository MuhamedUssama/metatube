import 'package:flutter/material.dart';
import 'package:metatube/utils/app_style.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData iconButton;
  final Function onPressed;
  const IconButtonWidget(
      {super.key, required this.iconButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed();
      },
      splashRadius: 20,
      splashColor: AppTheme.accent,
      icon: Icon(
        iconButton,
        color: AppTheme.medium,
      ),
    );
  }
}
