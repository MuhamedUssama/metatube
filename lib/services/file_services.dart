import 'dart:io';

import 'package:flutter/material.dart';
import 'package:metatube/utils/snakbar_utils.dart';

class FileService {
  final TextEditingController textController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();

  bool fieldsNotEmpty = false;

  File? _selectedFile;
  String _selectedDirectory = "";

  void saveContent(context) async {
    final title = textController.text;
    final discription = descriptionController.text;
    final tags = tagsController.text;

    final textContent =
        "Title:\n\t$title\n\nDiscription:\n\t$discription\n\nTags:\n\t$tags\n";

    try {
      if (_selectedFile != null) {
        await _selectedFile!.writeAsString(textContent);
      }
    } catch (e) {
      SnakBarUtils.showSnakbar(context, Icons.error_outline, "File Not Saved");
    }
  }
}
