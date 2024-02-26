import 'package:flutter/material.dart';
import 'package:metatube/screens/home_screen.dart';
import 'package:metatube/screens/spalsh_screen.dart';

void main() {
  runApp(const MetaTube());
}

class MetaTube extends StatelessWidget {
  const MetaTube({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MetaTube',
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
