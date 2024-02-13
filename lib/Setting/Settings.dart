// import 'package:accubooks/Tools/Colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// class settings extends StatefulWidget {
//   settings({super.key});

//   @override
//   State<settings> createState() => _settingsState();
// }

// class _settingsState extends State<settings> {
//   final ThemeController _themeController = Get.put(StyleState());

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 600,
//         height: 450,
//         child: Column(
//           children: [
//             ListView.builder(itemBuilder: (context, index) {
//               return Directionality(
//                 textDirection: TextDirection.rtl,
//                 child: ListTile(
//                   title: Text('نتظیم نور صفحه '),
//                   trailing: IconButton(
//                       onPressed: () {
//                         _themeController.toggleTheme();
//                       },
//                       icon: _themeController.toggleTheme?Icon(Icons.light_mode):Icon(Icons.nightlight_round_sharp)),
//                 ),
//               );
//             })
//           ],
//         ));
//   }
// }

// class ThemeController {
// }
