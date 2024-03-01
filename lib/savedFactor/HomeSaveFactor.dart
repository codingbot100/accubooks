import 'package:accubooks/Factoring/data/sharedDatabase.dart';
import 'package:flutter/material.dart';

class saved_home_factor extends StatefulWidget {
  @override
  _saved_home_factorState createState() => _saved_home_factorState();
}

class _saved_home_factorState extends State<saved_home_factor> {
  List<List<String>> itemList = []; // The list to hold the retrieved data

  @override
  void initState() {
    super.initState();
    loadListData(); // Load the list data when the widget is initialized
  }

  Future<void> loadListData() async {
    // Retrieve the data from SharedPreferences
    itemList = await SharedPreferencesHelper.getList();

    // Update the widget with the retrieved data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your List Display'),
      ),
      body: itemList.isEmpty
          ? Center(
              child: Text('No data available.'),
            )
          : ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                // Extracting each section of data
                List<String> currentData = itemList[index];

                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Barcode: ${currentData[0]}'),
                      Text('Quantity: ${currentData[1]}'),
                      Text('ProductName: ${currentData[2]}'),
                      Text('ProductName: ${currentData[3]}'),
                      Text('ProductName: ${currentData[4]}'),
                      Text('ProductName: ${currentData[5]}'),
                      Text('ProductName: ${currentData[6]}'),
                      Text('ProductName: ${currentData[7]}'),

                      // Add more Text widgets for other sections
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Time: ${currentData[4]}'),
                      Text('Date: ${currentData[5]}'),
                      // Add more Text widgets for other sections
                    ],
                  ),
                );
              },
            ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: saved_home_factor(),
    ),
  );
}
