import 'package:accubooks/Invoice/data/sharedDatabase.dart';
import 'package:accubooks/Save_Invoice/Invoice/Home_Factoring.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

class saved_home_factor12 extends StatefulWidget {
  const saved_home_factor12({super.key});

  @override
  State<saved_home_factor12> createState() => _saved_home_factor12State();
}

class _saved_home_factor12State extends State<saved_home_factor12> {
  TextEditingController _searchController = TextEditingController();
  SharedPreferencesHelper db = SharedPreferencesHelper();

  List<List<String>> itemList = []; // The list to hold the retrieved data

  @override
  void initState() {
    loadListData();
    super.initState();
  }

  Future<void> loadListData() async {
    // Retrieve the data from SharedPreferences
    itemList = await SharedPreferencesHelper.getList();

    // Update the widget with the retrieved data
    setState(() {});
  }

  Color color = Colors.transparent;
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          body: itemList.isEmpty
              ? Center(
                  child: Text(
                    "",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                )
              : Expanded(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    // height: 500,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 20, top: 20, bottom: 30),
                            child: Row(children: [
                              Text("لیست فاکتور ها",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'YekanBakh'))
                            ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20, bottom: 40),
                            child: Row(
                              children: [
                                Container(
                                    width: 250,
                                    height: 35,
                                    child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: TextField(
                                            controller: _searchController,
                                            cursorHeight: 20,
                                            textAlign: TextAlign.right,
                                            textAlignVertical:
                                                TextAlignVertical.bottom,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'YekanBakh',
                                                fontWeight: FontWeight.w800),
                                            decoration: InputDecoration(
                                                suffixIcon: Icon(Icons.search),
                                                hintText: 'جستجوی کالا...',
                                                hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontFamily: 'YekanBakh'),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0))),
                                            onChanged: (value) {}))),
                              ],
                            ),
                          ),
                          Container(
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    title('تاریخ خرید'),
                                    title("نمبر فاکتور"),
                                    title('نام خریدار'),
                                    title("شماره"),
                                  ]),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.blueAccent,
                          ),
                          // TextButton(
                          //     onPressed: () async {
                          //       await db.clearList();
                          //     },
                          //     child: Text("clear")),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: Colors.grey[900],
                                    thickness: 0.2,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  int counter = index + 1;

                                  return MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    onHover: (event) {
                                      setState(() {
                                        Duration(milliseconds: 2500);
                                        color =
                                            Color.fromRGBO(51, 241, 54, 0.533);
                                      });
                                    },
                                    onEnter: (event) {
                                      setState(() {
                                        isHover = true;
                                        // color = const Color.fromARGB(255, 244, 239, 239);
                                      });
                                    },
                                    onExit: (event) {
                                      setState(() {
                                        isHover = false;
                                        color = Colors.transparent;
                                      });
                                    },
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      back_Home_Factoring(
                                                        itemList: itemList,
                                                        time: itemList[index][2]
                                                            .replaceAll('[', '')
                                                            .replaceAll(
                                                                ']', ''),
                                                        numberFactor: counter,
                                                        TodayDate:
                                                            itemList[index][3]
                                                                .replaceAll(
                                                                    '[', '')
                                                                .replaceAll(
                                                                    ']', ''),
                                                        day: itemList[index][4]
                                                            .replaceAll('[', '')
                                                            .replaceAll(
                                                                ']', ''),
                                                        customer_name:
                                                            itemList[index][5]
                                                                .replaceAll(
                                                                    '[', '')
                                                                .replaceAll(
                                                                    ']', ''),
                                                        barcode: itemList[index]
                                                                [1]
                                                            .replaceAll('[', '')
                                                            .replaceAll(
                                                                ']', ''),
                                                        numbersOfGoods:
                                                            itemList[index][0]
                                                                .replaceAll(
                                                                    '[', '')
                                                                .replaceAll(
                                                                    ']', ''),
                                                        seller_name:
                                                            itemList[index][7]
                                                                .replaceAll(
                                                                    '[', '')
                                                                .replaceAll(
                                                                    ']', ''),
                                                        Product: itemList[index]
                                                            [9],
                                                        Price: itemList[index]
                                                            [8],
                                                      )));
                                        });
                                      },
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        onHover: (event) {
                                          setState(() {
                                            Duration(milliseconds: 2500);
                                            color = Color.fromRGBO(
                                                51, 241, 54, 0.533);
                                          });
                                        },
                                        onEnter: (event) {
                                          setState(() {
                                            isHover = true;
                                            // color = const Color.fromARGB(255, 244, 239, 239);
                                          });
                                        },
                                        onExit: (event) {
                                          setState(() {
                                            isHover = false;
                                            color = Colors.transparent;
                                          });
                                        },
                                        child: Slidable(
                                          startActionPane: ActionPane(
                                              motion: StretchMotion(),
                                              children: [
                                                Container(
                                                  child: SlidableAction(
                                                    onPressed:
                                                        (BuildContext) async {
                                                      int index =
                                                          itemList.length -
                                                              1 -
                                                              counter;

                                                      // Ensure that the index is within bounds
                                                      if (index >= 0 &&
                                                          index <
                                                              itemList.length) {
                                                        // Call deleteEntry to remove the item at the specified index
                                                        _deleteEntry(index);
                                                        // Show a snackbar or any other feedback
                                                        _showSnackBar(context,
                                                            "لیست موفقانه پاک شد.");
                                                      }
                                                    },
                                                    icon: Icons.delete,
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 232, 17, 17),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    spacing: 10,
                                                  ),
                                                )
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                width: 100,
                                                child: Center(
                                                  child: Text(
                                                    textAlign:
                                                        TextAlign.justify,
                                                    '$counter',
                                                    style: TextStyle(
                                                      fontFamily: 'Yekan',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                child: Center(
                                                  child: Text(
                                                    textAlign:
                                                        TextAlign.justify,
                                                    //5
                                                    // تعداد 0
                                                    //شماره بار کد 1
                                                    //ساعت 2
                                                    //تاریخ 3
                                                    //روز 4
                                                    //فروشنده 7
                                                    // خریدار 5
                                                    // قیمت فی 0
                                                    itemList[index][5]
                                                        .replaceAll('[', '')
                                                        .replaceAll(']', ''),
                                                    style: TextStyle(
                                                      fontFamily: 'Yekan',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                child: Center(
                                                  child: Text(
                                                    textAlign:
                                                        TextAlign.justify,
                                                    '$counter',
                                                    style: TextStyle(
                                                      fontFamily: 'Yekan',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                child: Center(
                                                  child: Text(
                                                    textAlign:
                                                        TextAlign.justify,
                                                    itemList[index][3]
                                                        .replaceAll('[', '')
                                                        .replaceAll(']', ''),
                                                    style: TextStyle(
                                                      fontFamily: 'Yekan',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: itemList.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget title(String title) {
    return Container(
      width: 100,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Yekan',
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message,
      [Color color = Colors.green]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                message,
                style: TextStyle(
                    fontFamily: 'Yekan',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )),
        ),
        backgroundColor: color,
      ),
    );
  }

  void _deleteEntry(int index) async {
    setState(() {
      // Remove the entry at the specified index
      itemList.removeAt(index);
      // Save the updated list to SharedPreferences
      SharedPreferencesHelper.saveList(itemList);
    });
  }
}
