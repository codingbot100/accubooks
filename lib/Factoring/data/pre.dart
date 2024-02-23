import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParentWidget(),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String dropValue = "One"; // Use a single variable for the selected value
  List<String> dropMenu = ['One', 'Two', 'Three'];

  final TextEditingController customItemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parent Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              DropdownButton<String>(
                value: dropValue,
                items: dropMenu.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Text(value),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => _deleteItem(value),
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropValue =
                        value ?? "One"; // Provide a default value if null
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => _showAddItemDialog(context),
            child: Text('Add Custom Item'),
          ),
          // Display the selected value
          Text('Selected Value: $dropValue'),
        ],
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Custom Item'),
          content: TextField(
            controller: customItemController,
            decoration: InputDecoration(labelText: 'Enter Item'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog without saving
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the entered item to the dropMenu list
                String newItem = customItemController.text;
                if (newItem.isNotEmpty && !dropMenu.contains(newItem)) {
                  setState(() {
                    dropMenu.add(newItem);
                    customItemController.clear(); // Clear the text field
                  });
                }
                Navigator.pop(context); // Close the dialog after saving
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(String item) {
    setState(() {
      dropMenu.remove(item);
      if (dropValue == item) {
        dropValue = dropMenu.isNotEmpty ? dropMenu.first : "One";
      }
    });
  }
}
