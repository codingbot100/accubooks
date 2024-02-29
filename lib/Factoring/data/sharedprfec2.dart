// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferencesHelper2 {
//   List<Map<String, dynamic>> itemList2 = [];

//   static const String _keyList = 'your_list_key';
//   static const String _keyNumberFactor = 'your_number_factor_key';

//   static Future<void> saveList(List<Map<String, dynamic>> yourList) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final List<String> stringList =
//         yourList.map((map) => json.encode(map)).toList();
//     await prefs.setStringList(_keyList, stringList);
//   }

//   static Future<List<Map<String, dynamic>>> getList() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final List<String>? stringList = prefs.getStringList(_keyList);

//     if (stringList != null) {
//       final List<Map<String, dynamic>> yourList = stringList.map((string) {
//         final dynamic decodedMap = json.decode(string);
//         return Map<String, dynamic>.from(decodedMap);
//       }).toList();
//       return yourList;
//     } else {
//       return [];
//     }
//   }

//   static Future<void> saveNumberFactor(int numberFactor) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt(_keyNumberFactor, numberFactor);
//   }

//   static Future<int> loadNumberFactor() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getInt(_keyNumberFactor) ?? 1;
//   }

//   static Future<int> getNextFactorNumber() async {
//     final int currentFactorNumber = await loadNumberFactor();
//     final int nextFactorNumber = currentFactorNumber + 1;
//     await saveNumberFactor(nextFactorNumber);
//     return nextFactorNumber;
//   }
// }
