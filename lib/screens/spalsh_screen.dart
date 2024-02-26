import 'package:flutter/material.dart';
import 'package:metatube/screens/home_screen.dart';
import 'package:metatube/utils/app_style.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

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
