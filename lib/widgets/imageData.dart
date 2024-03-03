

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageHandler {
  static Future<File?> pickAndSaveImage() async {
  final ImagePicker _imagePicker = ImagePicker();
  final XFile? pickedFile =
      await _imagePicker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    final File imageFile = File(pickedFile.path);
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String imageName =
        'my_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final File savedImage = await imageFile.copy('${appDir.path}/$imageName');

    // Save the image path to SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('image_path', savedImage.path);

    return savedImage;
  }

  return null;
}

  static Future<String?> getSavedImagePath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('image_path');
  }
}