import '../../../whouse2.dart/data/database.dart';
import 'package:flutter/material.dart';

// void main() async {
//   await Hive.initFlutter();
//   await Hive.openBox('Mybox');

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: InvoiceScreen(),
//     );
//   }
// }

class InvoiceScreen extends StatefulWidget {
  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final ToDoDatabse2 database = ToDoDatabse2();

  TextEditingController barcodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    database.loadData(); // Load data from Hive when the screen initializes
  }

  void searchItem() {
    String barcode = barcodeController.text;
    List<dynamic>? selectedItem = database.allInOne.firstWhere(
      (item) => int.tryParse(item[2].toString()) == int.tryParse(barcode),
      orElse: () => null,
    );

    if (selectedItem != null) {
      nameController.text =
          selectedItem[0].toString(); // Assuming name is at index 0
      priceController.text =
          selectedItem[1].toString(); // Assuming price is at index 1
      quantityController.text =
          selectedItem[2].toString(); // Assuming quantity is at index 2
      // You can update other text fields accordingly
    } else {
      // If the item is not found, clear the text fields and display an error message
      nameController.text = '';
      priceController.text = '';
      quantityController.text = '';
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Item not found for the entered barcode.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: barcodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Barcode'),
            ),
            ElevatedButton(
              onPressed: () {
                searchItem();
              },
              child: Text('Search'),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Product Price'),
            ),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Product Quantity'),
            ),
            // Add more text fields if needed
          ],
        ),
      ),
    );
  }
}
