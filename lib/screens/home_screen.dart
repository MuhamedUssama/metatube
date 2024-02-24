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
  final TextEditingController textController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: [
            const Row(
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
            const SizedBox(height: 20),
            CustomTextField(
              controller: textController,
              hintText: "Enter Video Title",
              maxLength: 100,
              maxLines: 3,
            ),
            const SizedBox(height: 40),
            CustomTextField(
              controller: descriptionController,
              hintText: "Enter Video Description",
              maxLength: 5000,
              maxLines: 6,
            ),
            const SizedBox(height: 40),
            CustomTextField(
              controller: tagsController,
              hintText: "Enter Video Tags",
              maxLength: 500,
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
