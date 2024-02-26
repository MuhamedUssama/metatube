import 'package:flutter/material.dart';
import 'package:metatube/utils/app_style.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash screen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.dark,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.edit,
              color: AppTheme.accent,
              size: 200,
            ),
            Text(
              "MetaTube",
              style: AppTheme.splashStyle,
            )
          ],
        ),
      ),
    );
  }
}
