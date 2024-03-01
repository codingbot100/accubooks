// ignore_for_file: must_be_immutable, unused_field

import 'package:accubooks/Factoring/Home_Factoring.dart';
import 'package:accubooks/Factoring/data/database.dart';
import 'package:accubooks/Factoring/data/saveFactorData.dart';
import 'package:accubooks/Factoring/data/sharedDatabase.dart';
import 'package:accubooks/Factoring/factorData.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import '../../whouse2.dart/data/database.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class YourWidget extends StatefulWidget {
  final Home_Factoring home_factoring;
  final Function(int) onIntegerChanged;
  final Function(int) onChangedfactor;
  final VoidCallback onSavePressed;
  final void Function(_YourWidgetState)
      onStateReady; // Callback for state reference
  var name_customer;
  final String seller_name;
  int factor = 1;

  YourWidget(
      {Key? key,
      required this.home_factoring,
      required this.onIntegerChanged,
      required this.onSavePressed,
      required this.onChangedfactor,
      required this.onStateReady,
      required this.name_customer,
      required this.seller_name})
      : super(key: key);
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  String name_cos = '';
  int _numberFactor = 1;
  int numberFactor = 1;
  final _saveFactor = Hive.box('drop');
  TimeOfDay currentTime = TimeOfDay.now();
  DateTime now = DateTime.now();
  int dayOfWeek = DateTime.now().weekday;
  final _yourBox = Hive.box('yourBox');
  SharedPreferencesHelper shareddb = SharedPreferencesHelper();
  final _factoeBox = Hive.box('storeFactor');
  ToDoDatabsestoreFactor dbfactor = ToDoDatabsestoreFactor();
  save_factor_database saveFactor = save_factor_database();
  int totalSum = 0;
  int counterme = 1;
  String selectedDropdownValue = ''; // Add this line
  List<String> BarcodesList = [];
  List<String> number_S_GOODList = [];
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
      widget.onChangedfactor(numberFactor);
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
      searchItem(_controllersList.length); // Pass the index of the new row
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
    loadList();
    if (_yourBox.get("TODOFacto") == null) {
      dbfactor.createinitialData();
    } else {
      dbfactor.loadData();
    }
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

    // loadList();
    super.initState();
    name_cos = widget.name_customer.toString();
  }

  void addtosaveFactor() async {
    setState(() {
      List Barcodes = [];
      String dayOfWeekInPersian = getDayNameInPersian(DateTime.now().weekday);
      String customerName = widget.name_customer.text;
      List number_S_GOOD = [];

      Map<String, dynamic> itemsOfFacor = {
        "name_of_customer": customerName,
        "name_of_seller": widget.seller_name,
        "facotor_id": _numberFactor,
        "date": DateFormat("d,MM,yyy").format(DateTime.now()).toString(),
        "day": dayOfWeekInPersian,
        "time": currentTime.format(context).toString(),
        "barcodes": Barcodes,
      };

      // Check if a factor with the same number exists in the list
      int existingFactorIndex = -1;
      for (int i = 0; i < saveFactor.factorAll.length; i++) {
        if (saveFactor.factorAll[i]["facotor_id"] == _numberFactor) {
          existingFactorIndex = i;
          break;
        }
      }

      if (existingFactorIndex != -1) {
        // Factor with the same number exists, update it
        saveFactor.factorAll[existingFactorIndex] = itemsOfFacor;
      } else {
        // Factor with the same number does not exist, add a new one
        saveFactor.factorAll.add(itemsOfFacor);
        saveFactor.updateDatabase();
      }
    });
  }

  void addtoItems() {
    setState(() {
      List<String> barcodeList = [];
      List<String> quantityList = [];
      List<String> timeList = [];
      List<String> dateList = [];
      List<String> dayOfWeekList = [];
      List<String> customerNameList = [];
      List<String> factorNumberList = [];
      List<String> sellerNameList = [];
      List<String> priceList = [];
      List<String> ProductList = [];
      int nextFactor = _numberFactor + 1;

      for (int i = 0; i < _controllersList.length; i++) {
        List<TextEditingController> controllers = _controllersList[i];
        String price = controllers[0].text;
        String barcode = controllers[1].text;
        String quantity = controllers[3].text;
        String producet = controllers[2].text;

        barcodeList.add(barcode);
        quantityList.add(quantity);
        priceList.add(price);
        ProductList.add(producet);
        bool combinationExists = timeList
                .any((e) => e == currentTime.format(context).toString()) &&
            dateList.any((e) =>
                e ==
                DateFormat("d,MM,yyy").format(DateTime.now()).toString()) &&
            dayOfWeekList
                .any((e) => e == getDayNameInPersian(DateTime.now().weekday)) &&
            customerNameList.any((e) => e == widget.name_customer.text) &&
            factorNumberList.any((e) => e == nextFactor.toString()) &&
            sellerNameList.any((e) => e == widget.seller_name);
        ProductList.any((e) => e == producet);

        if (!combinationExists) {
          timeList.add(currentTime.format(context).toString());
          dateList
              .add(DateFormat("d,MM,yyy").format(DateTime.now()).toString());
          dayOfWeekList.add(getDayNameInPersian(DateTime.now().weekday));
          customerNameList.add(widget.name_customer.text);
          factorNumberList.add(nextFactor.toString());
          sellerNameList.add(widget.seller_name);
          // ProductList.add(producet);
        }
      }

      List<String> singleData = [
        barcodeList.toString(),
        quantityList.toString(),
        timeList.toString(),
        dateList.toString(),
        dayOfWeekList.toString(),
        customerNameList.toString(),
        factorNumberList.toString(),
        sellerNameList.toString(),
        priceList.toString(),
        ProductList.toString(),
      ];

      shareddb.itemList.add(singleData);

      setState(() {
        numberFactor = nextFactor;
      });
    });

    saveList(); // Save the list and numberFactor
  }

  Future<void> saveList() async {
    await SharedPreferencesHelper.saveList(shareddb.itemList);
    await SharedPreferencesHelper.saveNumberFactor(_numberFactor);
  }

  Future<void> loadList() async {
    List<List<String>> loadedList = await SharedPreferencesHelper.getList();

    int loadedFactor = await SharedPreferencesHelper.loadNumberFactor();

    setState(() {
      shareddb.itemList = loadedList;
      numberFactor = loadedFactor;
      ; // بازیابی numberFactor
    });
  }

  @override
  Widget build(BuildContext context) {
    String dayNameInPersian = getDayNameInPersian(dayOfWeek);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // MaterialButton(
                //     child: Text("dsafsdaf"),
                //     onPressed: () {
                //       setState(() {
                //         shareddb.clearList();
                //       });
                //     }),
                for (int row = 0; row < _controllersList.length; row++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 30,
                          width: 180,
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
                            width: 180,
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
                          width: 180,
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
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      addtoItems();
                      // addtosaveFactor();
                    });
                  },
                  child: Text("دخیره کردن "),
                ),
                MaterialButton(
                  onPressed: () {
                    // shareddb.clearList();
                    print(shareddb.itemList);
                  },
                  child: Text(" لغو "),
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
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("complete"),
            titlePadding: EdgeInsets.only(left: 30),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("لغو ذخیره ")),
              TextButton(
                  onPressed: () {
                    _onSavePressed();
                    Navigator.of(context).pop();

                    setState(() {});
                  },
                  child: Text("دخیره کردن ")),
            ],
          );
        });
  }

  String getDayNameInPersian(int dayOfWeek) {
    switch (dayOfWeek) {
      case DateTime.saturday:
        return 'شنبه';
      case DateTime.sunday:
        return 'یک‌شنبه';
      case DateTime.monday:
        return 'دوشنبه';
      case DateTime.tuesday:
        return 'سه‌شنبه';
      case DateTime.wednesday:
        return 'چهارشنبه';
      case DateTime.thursday:
        return 'پنج‌شنبه';
      case DateTime.friday:
        return 'جمعه';
      default:
        return '';
    }
  }

  void _onSavePressed() {
    // Perform your logic after clicking "دخیره کردن" button

    // Clear text controllers and set default values
    setState(() {
      _controllersList.forEach((controllers) {
        controllers.forEach((controller) {
          // Clear the text in the controller

          // Set default values if needed
        });
      });

      // Initialize the first row with default values if needed
      _controllersList[0][1].text = '1';
      // Add more initialization if needed
    });
  }
}
