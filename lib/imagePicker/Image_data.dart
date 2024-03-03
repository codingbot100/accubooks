// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';

// class ImageHandler {
//   static Future<File?> pickAndSaveImage() async {
//     final ImagePicker _imagePicker = ImagePicker();
//     final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       final File imageFile = File(pickedFile.path);
//       final Directory appDir = await getApplicationDocumentsDirectory();
//       final String imageName = 'my_image.jpg'; // Change the image name if needed
//       final File savedImage = await imageFile.copy('${appDir.path}/$imageName');
//       return savedImage;
//     }

//     return null;
//   }
// }
