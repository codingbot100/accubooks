// ignore_for_file: must_be_immutable

import 'package:accubooks/Factoring/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../whouse2.dart/data/database.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class YourWidget extends StatefulWidget {
  final Function(int) onIntegerChanged;

  YourWidget({Key? key, required this.onIntegerChanged}) : super(key: key);
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  final _myBox = Hive.box('storeFactor');
  ToDoDatabsestoreFactor db2 = ToDoDatabsestoreFactor();

  int totalSum = 0;
  int counterme = 1;
  List<int> getTotals() {
    return totals;
  }

  final ToDoDatabse2 database = ToDoDatabse2();
  String barcodeResult = "Scan a barcode";
  List<FocusNode> _barcodeFocusNodes = [FocusNode()];
  List<List<TextEditingController>> _controllersList = [
  [
    TextEditingController(),
    TextEditingController(text: '1'),
    TextEditingController(),
    TextEditingController(),
  ]
];

void saveNewTask() {
  setState(() {
    for (int i = 0; i < _controllersList.length; i++) {
      List<TextEditingController> controllers = _controllersList[i];
      List<String> newTexts = [];
      for (int j = 0; j < controllers.length; j++) {
        newTexts.add(controllers[j].text);
      }

      // Print for debugging
      print('Data to be saved: $newTexts');

      db2.allInOne.add(newTexts);
    }

    Navigator.of(context).pop();
    db2.updateDatabase();
  });
}
  List<int> totals = [0];
  List<int> rowNumbers = [1];

  void calculateTotal(int rowIndex) {
    int value1 = int.tryParse(_controllersList[rowIndex][0].text) ?? 0;
    int value2 = int.tryParse(_controllersList[rowIndex][1].text) ?? 0;
    int total = value1 * value2;

    setState(() {
      totals[rowIndex] = total;
      totalSum = totals.fold(0, (previous, current) => previous + current);
      widget.onIntegerChanged(
          totalSum); // Update the totalSum in the parent widget
    });
  }

  void setValuesBasedOnInput(int newValue) {
    if (_controllersList.length == 1) {
      _controllersList[0][2].text = newValue.toString();
      _controllersList[0][1].text = '1';
      _controllersList[0][0].text = database.allInOne[0][4].toString();
    }
  }

  void initializeNewRow() {
    _controllersList.add([
      TextEditingController(),
      TextEditingController(text: '1'),
      TextEditingController(),
      TextEditingController(),
    ]);
    totals.add(0);
    rowNumbers.add(rowNumbers.length + 1); // Increment row number
  }

  void addNewRowIfNeeded() {
    if (_controllersList.every(
        (row) => row.every((controller) => controller.text.isNotEmpty))) {
      initializeNewRow();
      searchItem(_controllersList.length - 1); // Pass the index of the new row
    }
  }

  void addNewRow() {
    setState(() {
      initializeNewRow();
      searchItem(_controllersList.length - 1);
      _controllersList[_controllersList.length - 1][1].text = '1';
      // Pass the index of the new row
    });
  }

  void searchItem(int rowIndex) {
    String barcode =
        _controllersList[rowIndex][3].text; // Assuming barcode is at index 2
    List<dynamic>? selectedItem = database.allInOne.firstWhere(
      (item) => int.tryParse(item[2].toString()) == int.tryParse(barcode),
      orElse: () => null,
    );

    if (selectedItem != null) {
      _controllersList[rowIndex][0].text =
          selectedItem[5].toString(); // Assuming name is at index 0
      _controllersList[0][1].text = '1';
      // Assuming price is at index 1
      _controllersList[rowIndex][2].text = selectedItem[0].toString();
      _controllersList[rowIndex][3].text =
          selectedItem[2].toString(); // Assuming quantity is at index 2
      // You can update other text fields accordingly
    } else {
      // If the item is not found, clear the text fields and display an error message
    }
  }

  Future<void> ScanBarCode() async {
    String result;
    try {
      result = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", // Color for the toolbar
        "Cancel", // Text for the cancel button
        true, // Show flash icon
        ScanMode.BARCODE,
      );
    } on PlatformException {
      result = "Failed to get platform version.";
    }

    if (!mounted) return;
    setState(() {
      barcodeResult = result ?? "Scan failed!";
    });
  }

  @override
  void initState() {
    // Load data from the database when the widget initializes
    database.loadData();

    // Check if the database is empty and there are no rows already
    if (database.allInOne.isEmpty &&
        _controllersList.length == 1 &&
        _controllersList[0][0].text.isEmpty) {
      initializeNewRow();

      // Populate the text controllers with the data from the database
      if (database.allInOne.isNotEmpty) {
        for (int i = 0; i < _controllersList[0].length; i++) {
          _controllersList[0][i].text = '';
        }
      }

      setState(() {
        _controllersList[0][1].text = '1';
      }); // Calculate total initially
      calculateTotal(0);

      // Initialize a new row
      setState(() {
        searchItem(0); // Pass the index of the initial row
      });
    }
    for (int i = 1; i < _controllersList.length; i++) {
      _barcodeFocusNodes.add(FocusNode());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                for (int row = 0; row < _controllersList.length; row++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.8,
                                color: Color.fromARGB(255, 86, 85, 85)),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "افغانی ",
                                style: TextStyle(
                                  fontFamily: 'Yekan',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                " ${totals[row]}",
                                style: TextStyle(
                                  fontFamily: "Yekan",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          )),
                        ),
                        for (int i = 0; i < _controllersList[row].length; i++)
                          Container(
                            height: 33,
                            width: 150,
                            child: TextField(
                              style: TextStyle(
                                fontFamily: 'Yekan',
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                              ),
                              controller: _controllersList[row][i],
                              onChanged: (value) {
                                searchItem(
                                    row); // Pass the index of the current row
                                calculateTotal(row);

                                addNewRowIfNeeded();
                                barcodeResult = _controllersList[row][i].text;
                                setState(() {
                                  onChangedController3(row, i);
                                });
                              },
                              autofocus: i == 3,
                              cursorHeight: 0,
                              textAlignVertical: TextAlignVertical.top,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.8, color: Colors.grey))),
                            ),
                          ),
                        Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.8,
                                color: Color.fromARGB(255, 86, 85, 85)),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          child: Center(
                              child: Text(
                            '${rowNumbers[row]}',
                            style: TextStyle(
                              fontFamily: 'Yekan',
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          )),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onChangedController3(int row, int controllerIndex) {
    String enteredBarcode = _controllersList[row][3].text;
    bool isDuplicated = false;

    for (int i = 0; i < _controllersList.length; i++) {
      if (i != row && _controllersList[i][3].text == enteredBarcode) {
        isDuplicated = true;
        break;
      }
    }

    if (isDuplicated) {
      int currentValue = int.tryParse(_controllersList[row][1].text) ?? 0;

      // Update the value and keep the focus on the current row
      setState(() {
        _controllersList[row][1].text = (currentValue + 1).toString();
        _controllersList[row][controllerIndex].selection =
            TextSelection.fromPosition(
          TextPosition(
              offset: _controllersList[row][controllerIndex].text.length),
        );
      });
    } else {
      // Clear any error message or handle duplicate case as needed
    }
  }
}
