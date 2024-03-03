// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ImageDisplay(),
//     );
//   }
// }

// class ImageHandler {
//   static Future<File?> pickAndSaveImage() async {
//     final ImagePicker _imagePicker = ImagePicker();
//     final XFile? pickedFile =
//         await _imagePicker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       final File imageFile = File(pickedFile.path);
//       final Directory appDir = await getApplicationDocumentsDirectory();
//       final String imageName =
//           'my_image.jpg'; // Change the image name if needed
//       final File savedImage = await imageFile.copy('${appDir.path}/$imageName');

//       // Save the image path to SharedPreferences
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setString('image_path', savedImage.path);

//       return savedImage;
//     }

//     return null;
//   }

//   static Future<String?> getSavedImagePath() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('image_path');
//   }
// }

// class ImageDisplay extends StatefulWidget {
//   @override
//   _ImageDisplayState createState() => _ImageDisplayState();
// }

// class _ImageDisplayState extends State<ImageDisplay> {
//   File? _image;

//   @override
//   void initState() {
//     super.initState();
//     loadImage();
//   }

//   Future<void> loadImage() async {
//     final String? imagePath = await ImageHandler.getSavedImagePath();
//     if (imagePath != null) {
//       setState(() {
//         _image = File(imagePath);
//       });
//     }
//   }

//   Future<void> _pickAndSaveImage() async {
//     final File? pickedImage = await ImageHandler.pickAndSaveImage();
//     if (pickedImage != null) {
//       setState(() {
//         _image = pickedImage;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Display'),
//       ),
//       body: Center(
//         child: _image != null ? Image.file(_image!) : Text('No image selected'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _pickAndSaveImage,
//         tooltip: 'Pick Image',
//         child: Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }
