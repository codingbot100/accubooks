// ignore_for_file: must_be_immutable

import 'package:accubooks/Invoice/TextFieldRows.dart';
import 'package:accubooks/Invoice/secondRow.dart';
import 'package:accubooks/Employees/data/database.dart';
import 'package:accubooks/widgets/save_Name.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class back_Home_Factoring extends StatefulWidget {
  final int numberFactor;
  final String TodayDate;
  var day;
  var time;
  final String numbersOfGoods;
  final String customer_name;
  final String barcode;
  final String seller_name;
  final String Product;
  final String Price;
  final List itemList;
  // final Function callbackFunction;

  back_Home_Factoring(
      {Key? key,
      required this.numberFactor,
      required this.TodayDate,
      required this.day,
      required this.customer_name,
      required this.barcode,
      required this.time,
      required this.numbersOfGoods,
      required this.seller_name,
      required this.Product,
      required this.Price,
      required this.itemList})
      : super(key: key);

  @override
  State<back_Home_Factoring> createState() => _back_Home_FactoringState();
}

class _back_Home_FactoringState extends State<back_Home_Factoring>
    with AutomaticKeepAliveClientMixin<back_Home_Factoring> {
  late YourWidget youWidgetState;
  int totalSumNew = 0;
  TextEditingController discount = TextEditingController();
  TextEditingController remainedMoNEY = TextEditingController();
  TextEditingController Name_customer = TextEditingController();

  int? counterfactor = 0;
  late int numberFactor = 0;
  TimeOfDay currentTime = TimeOfDay.now();
  DateTime now = DateTime.now();
  int dayOfWeek = DateTime.now().weekday;
  List<String> seller = ["احمد سدیس", "محمد کریم", "احمد فواد"];
  late String selectedItem; // Use 'late' to mark it as mutable
  ToDoDatabseEmployees db2 = ToDoDatabseEmployees();
  final _myBox = Hive.box('employees');
  late String _loadedInfo;

  final Key firstRowKey = UniqueKey();
  callme() {}
  @override
  void initState() {
    selectedItem = seller.first; // Initialize selectedItem with the first item

    if (_myBox.get("TODOLIST2") == null) {
      db2.createinitialData();
    } else {
      db2.loadData();
    }
    loadData();
    super.initState();
    _loadInfo().then((loadedInfo) {
      setState(() {
        _loadedInfo = loadedInfo ?? '';
      });
    });
  }

  Future<String?> _loadInfo() async {
    String? info = await StorageService.loadInfo();
    return info;
  }

  int selectedIndex = 0;
  ToDoDatabseEmployees database = ToDoDatabseEmployees();
  List<dynamic> dataList = [];
  void loadData() {
    database.loadData();
    setState(() {
      dataList = List.from(database.allInOne);
    });
  }

  void addNewNameToList(String newName) {
    setState(() {
      dataList.add([newName]);
      selectedIndex = dataList.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> numberofGoods = widget.numbersOfGoods
        .replaceAll('[', '')
        .replaceAll(']', '')
        .split(', ')
        .where((item) => item.isNotEmpty)
        .toList();
    List<String> productItems = widget.Product.replaceAll('[', '')
        .replaceAll(']', '')
        .split(', ')
        .where((item) => item.isNotEmpty)
        .toList();
    List<String> barcodeItem = widget.barcode
        .replaceAll('[', '')
        .replaceAll(']', '')
        .split(', ')
        .where((item) => item.isNotEmpty)
        .toList();
    List<String> price = widget.Price.replaceAll('[', '')
        .replaceAll(']', '')
        .split(', ')
        .where((item) => item.isNotEmpty)
        .toList();

    super.build(context);
    return Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color.fromRGBO(247, 247, 247, 1),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color.fromRGBO(247, 247, 247, 1),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Center(
                            child: Text(
                              "فروشگاه مواد غذایی " + _loadedInfo,
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Yekan',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 40,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '${widget.time} ',
                                style: TextStyle(
                                  fontFamily: 'Yekan',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  title(widget.day),
                                  title("  :  " "روز"),
                                ],
                              ),
                              Row(
                                children: [
                                  title('${widget.TodayDate} '),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  title(": تاریخ "),
                                ],
                              ),
                              title(" شماره فاکتور:  ${widget.numberFactor}"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    widget.seller_name,
                                    style: TextStyle(
                                      fontFamily: 'Yekan',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    ": " + "فروشنده ",
                                    style: TextStyle(
                                      fontFamily: 'Yekan',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.customer_name,
                                    style: TextStyle(
                                      fontFamily: 'Yekan',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  title(": " + 'نام مشتری')
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Second_Row(),
                        Divider(
                          thickness: 1,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: ListView.builder(
                                itemCount: productItems.length,
                                itemBuilder: (context, index) {
                                  int counter = index + 1;

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: listFactor(
                                                "افغانی" "  " + price[index])),
                                        listFactor(
                                          price[index],
                                        ),
                                        listFactor(
                                          numberofGoods[index],
                                        ),
                                        listFactor(
                                          productItems[index],
                                        ),
                                        listFactor(
                                          barcodeItem[index],
                                        ),
                                        listFactor('$counter')
                                      ],
                                    ),
                                  );
                                },
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              " افغانی",
                              style: TextStyle(
                                fontFamily: 'Yekan',
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "$totalSumNew",
                              style: TextStyle(
                                fontFamily: 'Yekan',
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        ": " ' جمع کل پول  ',
                        style: TextStyle(
                          fontFamily: 'Yekan',
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      Container(
                        height: 30,
                        width: 150,
                        child: Center(
                          child: TextField(
                            style: TextStyle(
                              fontFamily: 'Yekan',
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                            controller: remainedMoNEY,
                            cursorHeight: 0,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                prefix: Text(
                                  "افغانی",
                                  style: TextStyle(
                                      fontFamily: 'Yekan',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.8, color: Colors.black))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        ": " "باقی مانده حساب",
                        style: TextStyle(
                          fontFamily: 'Yekan',
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      Container(
                        height: 33,
                        width: 150,
                        child: TextField(
                          style: TextStyle(
                            fontFamily: 'Yekan',
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ),
                          cursorHeight: 0,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              prefix: Text(
                                "افغانی",
                                style: TextStyle(
                                    fontFamily: 'Yekan',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.8, color: Colors.grey))),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        ": " "تخفیف برای مشتریان ",
                        style: TextStyle(
                          fontFamily: 'Yekan',
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Icon(Icons.arrow_back)));
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

  Widget listFactor(String list) {
    return Container(
      height: 30,
      width: 180,
      decoration: BoxDecoration(
        border: Border.all(width: 0.8, color: Color.fromARGB(255, 86, 85, 85)),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Center(
          child: Text(
        list,
        style: TextStyle(
          fontFamily: 'Yekan',
          fontSize: 17,
          fontWeight: FontWeight.w900,
        ),
      )),
    );
  }

  Widget title(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Yekan',
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
