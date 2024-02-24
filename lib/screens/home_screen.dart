import 'package:flutter/material.dart';
import 'package:metatube/widgets/custom_textfield.dart';
import 'package:metatube/widgets/icon_button.dart';
import 'package:metatube/widgets/main_button.dart';
import 'package:metatube/utils/app_style.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.dark,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainButton(text: "New File"),
                Row(
                  children: [
                    IconButtonWidget(
                      iconButton: Icons.file_upload,
                    ),
                    SizedBox(width: 8),
                    IconButtonWidget(
                      iconButton: Icons.folder,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // CustomTextField(),
          ],
        ),
      ),
    );
  }
}
