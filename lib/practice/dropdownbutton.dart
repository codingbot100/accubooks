import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> myList = ['Item 1', 'Item 2', 'Item 3'];
  final String myListKey = 'myListKey';

  @override
  void initState() {
    super.initState();
    _loadList();
  }

  Future<void> _loadList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(myListKey);

    if (jsonString != null) {
      List<dynamic> decodedList = jsonDecode(jsonString);
      setState(() {
        myList.clear();
        myList.addAll(decodedList.cast<String>());
      });
    }
  }

  Future<void> _saveList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(myList);
    prefs.setString(myListKey, jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences List Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My List: $myList'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  myList.add('New Item');
                });
                _saveList();
              },
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
