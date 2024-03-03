import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class StorageService {
  static const String infoKey = 'info';

  static Future<void> saveInfo(String info) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(infoKey, info);
  }

  static Future<String?> loadInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(infoKey);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InformationListScreen(),
    );
  }
}

class InformationListScreen extends StatefulWidget {
  @override
  _InformationListScreenState createState() => _InformationListScreenState();
}

class _InformationListScreenState extends State<InformationListScreen> {
  final List<String> listItems = ['Item 1', 'Item 2', 'Item 3'];
  late String _loadedInfo;

  @override
  void initState() {
    super.initState();
    _loadInfo().then((loadedInfo) {
      setState(() {
        _loadedInfo = loadedInfo ?? '';
      });
    });
  }

  Future<void> _showInformationDialog(
      BuildContext context, String listItem) async {
    TextEditingController _infoController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Information Dialog'),
          content: Column(
            children: [
              TextField(
                controller: _infoController,
                decoration: InputDecoration(labelText: 'Enter information'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      String info = _infoController.text;
                      await StorageService.saveInfo(info);
                      _loadInfo().then((loadedInfo) {
                        setState(() {
                          _loadedInfo = loadedInfo ?? '';
                        });
                      });
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Text('Save'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<String?> _loadInfo() async {
    String? info = await StorageService.loadInfo();
    return info;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information List'),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'Loaded Information: $_loadedInfo',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(listItems[index]),
                  onTap: () {
                    _showInformationDialog(context, listItems[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
