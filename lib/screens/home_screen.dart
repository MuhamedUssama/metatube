import 'package:flutter/material.dart';
import 'package:metatube/services/file_services.dart';
import 'package:metatube/utils/snakbar_utils.dart';
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
  FileService fileService = FileService();

  @override
  void initState() {
    super.initState();
    addListeners();
  }

  @override
  void dispose() {
    removeListeners();
    super.dispose();
  }

  void addListeners() {
    List<TextEditingController> controllers = [
      fileService.textController,
      fileService.descriptionController,
      fileService.tagsController,
    ];

    for (TextEditingController controller in controllers) {
      controller.addListener(_onFieldChanged);
    }
  }

  void removeListeners() {
    List<TextEditingController> controllers = [
      fileService.textController,
      fileService.descriptionController,
      fileService.tagsController,
    ];

    for (TextEditingController controller in controllers) {
      controller.removeListener(_onFieldChanged);
    }
  }

  void _onFieldChanged() {
    setState(() {
      fileService.fieldsNotEmpty = fileService.textController.text.isNotEmpty &&
          fileService.descriptionController.text.isNotEmpty &&
          fileService.tagsController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainButton(
                  text: "New File",
                  onPressed: () => fileService.newFile(context),
                ),
                Row(
                  children: [
                    IconButtonWidget(
                      iconButton: Icons.file_upload,
                      onPressed: fileService.fieldsNotEmpty
                          ? () {
                              SnakBarUtils.showSnakbar(
                                  context,
                                  Icons.warning_amber_rounded,
                                  "Please delete text in fields first");
                            }
                          : () => fileService.loadFile(context),
                    ),
                    const SizedBox(width: 8),
                    IconButtonWidget(
                      iconButton: Icons.folder,
                      onPressed: () => fileService.newDirectory(context),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: fileService.textController,
              hintText: "Enter Video Title",
              maxLength: 100,
              maxLines: 3,
            ),
            const SizedBox(height: 40),
            CustomTextField(
              controller: fileService.descriptionController,
              hintText: "Enter Video Description",
              maxLength: 5000,
              maxLines: 6,
            ),
            const SizedBox(height: 40),
            CustomTextField(
              controller: fileService.tagsController,
              hintText: "Enter Video Tags",
              maxLength: 500,
              maxLines: 4,
            ),
            Row(
              children: [
                MainButton(
                  text: "Save File",
                  onPressed: fileService.fieldsNotEmpty
                      ? () => fileService.saveContent(context)
                      : () {
                          SnakBarUtils.showSnakbar(context, Icons.error_outline,
                              "Please fill in the blanks");
                        },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
