import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  List<List<String>> itemList = [];

  static const String _keyList = 'your_list_key';
  static const String _keyNumberFactor = 'your_number_factor_key';

  static Future<void> saveList(List<List<String>> yourList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> stringList =
        yourList.map((list) => json.encode(list)).toList();
    await prefs.setStringList(_keyList, stringList);
  }

  static Future<List<List<String>>> getList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? stringList = prefs.getStringList(_keyList);

    if (stringList != null) {
      final List<List<String>> yourList = stringList.map((string) {
        final dynamic decodedList = json.decode(string);
        return List<String>.from(decodedList);
      }).toList();
      return yourList;
    } else {
      return [];
    }
  }

  static Future<void> saveNumberFactor(int numberFactor) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyNumberFactor, numberFactor);
  }

  static Future<int> loadNumberFactor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyNumberFactor) ?? 1;
  }

  static Future<int> getNextFactorNumber() async {
    final int currentFactorNumber = await loadNumberFactor();
    final int nextFactorNumber = currentFactorNumber + 1;
    await saveNumberFactor(nextFactorNumber);
    return nextFactorNumber;
  }
  
  Future<void> deleteEntry(int index) async {
    if (index >= 0 && index < itemList.length) {
      itemList.removeAt(index);
      await saveList(itemList); // Save the updated list

    }
  }


  Future<void> clearList() async {
    itemList.clear();
    await saveList(itemList); // Save the cleared list
    await saveNumberFactor(1); // Reset the number factor to the default value
  }
}
