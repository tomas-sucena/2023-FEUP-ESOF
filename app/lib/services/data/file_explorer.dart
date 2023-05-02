import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class FileExplorer {
  final ImagePicker _imagePicker;

  /* CONSTRUCTOR */
  FileExplorer() : _imagePicker = ImagePicker();

  Future<File?> getImage(ImageSource source) async {
    File? _file = null;

    try {
      final _image = await _imagePicker.pickImage(source: source);
      if (_image == null) return null;

      _file = File(_image.path);
    } on PlatformException catch (e) {
      print("Failed to select image: $e");
    }

    return _file;
  }
}
