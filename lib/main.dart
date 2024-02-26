import 'package:flutter/material.dart';
import 'package:metatube/screens/home_screen.dart';
import 'package:metatube/screens/spalsh_screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  WindowOptions options = const WindowOptions(
    minimumSize: Size(400, 780),
    size: Size(600, 780),
    center: true,
    title: "MetaTube",
  );

  windowManager.waitUntilReadyToShow(options, () async {
    await windowManager.show();
    await windowManager.focus();
  });

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
