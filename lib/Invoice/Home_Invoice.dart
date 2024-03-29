// ignore_for_file: must_be_immutable

import 'package:accubooks/Invoice/TextFieldRows.dart';
import 'package:accubooks/Invoice/secondRow.dart';
import 'package:accubooks/Employees/data/database.dart';
import 'package:accubooks/widgets/save_Name.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class Home_Factoring extends StatefulWidget {
  @override
  State<Home_Factoring> createState() => _Home_FactoringState();
}

class _Home_FactoringState extends State<Home_Factoring>
    with AutomaticKeepAliveClientMixin<Home_Factoring> {
  // final GlobalKey<_YourWidgetState> childKey = GlobalKey();

  late YourWidget youWidgetState;
  int totalSumNew = 0;

  int selectedIndexDropDown = 0; // Assuming the default index is 0
  String selectedName = ''; // Add this line
  TextEditingController discount = TextEditingController();
  TextEditingController remainedMoNEY = TextEditingController();
  TextEditingController Name_customer = TextEditingController();

  int? counterfactor = 0;
  late int numberFactor;
  TimeOfDay currentTime = TimeOfDay.now();
  DateTime now = DateTime.now();
  int dayOfWeek = DateTime.now().weekday;
  List<String> seller = ["احمد سدیس", "محمد کریم", "احمد فواد"];
  late String selectedItem; // Use 'late' to mark it as mutable
  ToDoDatabseEmployees db2 = ToDoDatabseEmployees();
  final _myBox = Hive.box('employees');
  // late String _loadedInfo;
  final Key firstRowKey = UniqueKey();
  callme() {}
  @override
  void initState() {
    setState(() {
      selectedItem =
          seller.first; // Initialize selectedItem with the first item

      if (_myBox.get("TODOLIST2") == null) {
        db2.createinitialData();
      } else {
        db2.loadData();
      }

      super.initState();
      _loadInfo().then((loadedInfo) {
        setState(() {
          // _loadedInfo = loadedInfo ?? '';
        });
      });
      loadData();
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
    String dayNameInPersian = getDayNameInPersian(dayOfWeek);

    super.build(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Center(
                        child: Text(
                          "فروشگاه مواد غذایی تک",
                          // + _loadedInfo
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
                            '${currentTime.format(context)} ',
                            style: TextStyle(
                              fontFamily: 'Yekan',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              title("$dayNameInPersian"),
                              title("  :  " "امروز"),
                            ],
                          ),
                          Row(
                            children: [
                              title(
                                DateFormat("d,MM,yyy").format(DateTime.now()),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              title(": تاریخ امروز"),
                            ],
                          ),
                          title(" شماره فاکتور:  $counterfactor"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DropdownButton<int>(
                                hint: Text('نام خود '),
                                value: selectedIndexDropDown,
                                items: List.generate(dataList.length, (index) {
                                  return DropdownMenuItem<int>(
                                    value: index,
                                    child: Text(
                                      dataList[index][
                                          0], // Assuming the name is at index 0
                                      style: TextStyle(
                                        fontFamily: 'Yekan',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  );
                                }),
                                onChanged: (value) {
                                  setState(() {
                                    selectedIndexDropDown = value!;
                                    selectedName = dataList[value]
                                        [0]; // Assuming the name is at index 0
                                  });
                                  // Do something with the selected index and name
                                  print('Selected Index: $value');
                                  print('Selected Name: $selectedName');
                                },
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
                              Container(
                                height: 33,
                                width: 180,
                                child: TextField(
                                  controller: Name_customer,
                                  style: TextStyle(
                                    fontFamily: 'Yekan',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  cursorHeight: 0,
                                  textAlignVertical: TextAlignVertical.top,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 0.8, color: Colors.grey))),
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
                      child: SingleChildScrollView(
                        child: YourWidget(
                          onAddToItem: () {},
                          seller_name: selectedName,
                          onStateReady: (state) {
                            youWidgetState = state as YourWidget;
                          },
                          home_factoring: widget,
                          onChangedfactor: (factor) async {
                            setState(() {
                              counterfactor = factor;
                            });
                          },
                          onSavePressed: () {},
                          onIntegerChanged: (totalSum) async {
                            setState(() {
                              totalSumNew = totalSum;
                            });
                          },
                          name_customer: Name_customer,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20),
            //   child: Row(
            //     children: [
            //       Container(
            //         height: 30,
            //         width: 100,
            //         decoration: BoxDecoration(
            //             border: Border.all(width: 0.5),
            //             color: Color.fromRGBO(248, 249, 251, 1),
            //             borderRadius: BorderRadius.circular(6.5)),
            //         child: MaterialButton(
            //             onPressed: () {},
            //             child: Text(
            //               "  ذخیره کردن ",
            //               style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 16,
            //                   fontFamily: 'YekanBakh',
            //                   fontWeight: FontWeight.w600),
            //             )),
            //       ),
            //       SizedBox(
            //         width: 30,
            //       ),
            //       Container(
            //         height: 30,
            //         width: 100,
            //         decoration: BoxDecoration(
            //             border: Border.all(width: 0.5),
            //             color: Color.fromRGBO(248, 249, 251, 1),
            //             borderRadius: BorderRadius.circular(6.5)),
            //         child: MaterialButton(
            //             onPressed: () {},
            //             child: Text(
            //               " لغو  فاکتور  ",
            //               style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 16,
            //                   fontFamily: 'YekanBakh',
            //                   fontWeight: FontWeight.w600),
            //             )),
            //       ),
            //     ],
            //   ),
            // ),
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
                          width: 0.8, color: Color.fromARGB(255, 86, 85, 85)),
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
                              borderSide:
                                  BorderSide(width: 0.8, color: Colors.grey))),
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
    );
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
