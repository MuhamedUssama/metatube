import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:metatube/utils/snakbar_utils.dart';

class FileService {
  final TextEditingController textController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();

  bool fieldsNotEmpty = false;

  File? _selectedFile;
  String _selectedDirectory = "";

  void saveContent(context) async {
    // we use context here as a parameter in this function because we use the Snackbar
    final title = textController.text;
    final discription = descriptionController.text;
    final tags = tagsController.text;

    final textContent =
        "Title:\n\n$title\n\nDiscription:\n\n$discription\n\nTags:\n\n$tags";

    try {
      if (_selectedFile != null) {
        await _selectedFile!.writeAsString(textContent);
      } else {
        final todayDate = getTodayDate();
        String metaDataDirPath = _selectedDirectory;
        if (metaDataDirPath.isEmpty) {
          final directory = await FilePicker.platform.getDirectoryPath();
          _selectedDirectory = metaDataDirPath = directory!;
        }
        final filePath = "$metaDataDirPath/$todayDate - $title - Metadata.txt";
        final newFile = File(filePath);
        await newFile.writeAsString(textContent);
      }
      SnakBarUtils.showSnakbar(
          context, Icons.check_circle, "File Saved Successfully");
    } catch (e) {
      SnakBarUtils.showSnakbar(context, Icons.error_outline, "File Not Saved");
    }
  }

  void loadFile(context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File file = File(result.files.single.path!);
        _selectedFile = file;

        final fileContent = await file.readAsString();

        final lines = fileContent.split("\n\n");

        textController.text = lines[1];
        descriptionController.text = lines[3];
        tagsController.text = lines[5];

        SnakBarUtils.showSnakbar(context, Icons.upload_file, "File uploaded");
      } else {
        SnakBarUtils.showSnakbar(
            context, Icons.error_rounded, "No file selected");
      }
    } catch (e) {
      SnakBarUtils.showSnakbar(context, Icons.error_outline,
          "Somthing wrong, please try again later.");
    }
  }

  void newFile(context) {
    _selectedFile = null;
    textController.clear();
    descriptionController.clear();
    tagsController.clear();

    SnakBarUtils.showSnakbar(context, Icons.folder, "New file created");
  }

  void newDirectory(context) async {
    try {
      String? directory = await FilePicker.platform.getDirectoryPath();
      _selectedDirectory = directory!;
      _selectedFile = null;

      SnakBarUtils.showSnakbar(
          context, Icons.error_outline, "New folder selected");
    } catch (e) {
      SnakBarUtils.showSnakbar(
          context, Icons.error_outline, "No folder selected");
    }
  }

  static String getTodayDate() {
    final now = DateTime.now();
    final formatter = DateFormat("yyyy-MM-dd");
    final formattedDate = formatter.format(now);

    return formattedDate;
  }
}
