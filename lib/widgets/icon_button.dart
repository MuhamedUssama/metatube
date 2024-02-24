import 'package:flutter/material.dart';
import 'package:metatube/utils/app_style.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData iconButton;
  const IconButtonWidget({super.key, required this.iconButton});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      splashRadius: 20,
      splashColor: AppTheme.accent,
      icon: Icon(
        iconButton,
        color: AppTheme.medium,
      ),
    );
  }
}
