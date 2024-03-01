import 'package:accubooks/Factoring/data/sharedDatabase.dart';
import 'package:accubooks/backfactor.dart/Factoring/Home_Factoring.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        width: 1100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(248, 248, 251, 1),
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
                    width: 1100,
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
                                    color: Colors.black,
                                    thickness: 0.5,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  int counter = index + 1;

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    back_Home_Factoring(
                                                      time: itemList[index][2]
                                                          .replaceAll('[', '')
                                                          .replaceAll(']', ''),
                                                      numberFactor: counter,
                                                      TodayDate: itemList[index]
                                                              [3]
                                                          .replaceAll('[', '')
                                                          .replaceAll(']', ''),
                                                      day: itemList[index][4]
                                                          .replaceAll('[', '')
                                                          .replaceAll(']', ''),
                                                      customer_name: itemList[
                                                              index][5]
                                                          .replaceAll('[', '')
                                                          .replaceAll(']', ''),
                                                      barcode: itemList[index]
                                                              [1]
                                                          .replaceAll('[', '')
                                                          .replaceAll(']', ''),
                                                      numbersOfGoods: itemList[
                                                              index][0]
                                                          .replaceAll('[', '')
                                                          .replaceAll(']', ''),
                                                      seller_name: itemList[
                                                              index][7]
                                                          .replaceAll('[', '')
                                                          .replaceAll(']', ''),
                                                    )));
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Center(
                                            child: Text(
                                              textAlign: TextAlign.justify,
                                              '$counter',
                                              style: TextStyle(
                                                fontFamily: 'Yekan',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          child: Center(
                                            child: Text(
                                              textAlign: TextAlign.justify,
                                              //5
                                              // تعداد 0
                                              //شماره بار کد 1
                                              //ساعت 2
                                              //تاریخ 3
                                              //روز 4
                                              //فروشنده 7
                                              // خریدار 5
                                              itemList[index][5]
                                                  .replaceAll('[', '')
                                                  .replaceAll(']', ''),
                                              style: TextStyle(
                                                fontFamily: 'Yekan',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          child: Center(
                                            child: Text(
                                              textAlign: TextAlign.justify,
                                              '$counter',
                                              style: TextStyle(
                                                fontFamily: 'Yekan',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          child: Center(
                                            child: Text(
                                              textAlign: TextAlign.justify,
                                              itemList[index][3]
                                                  .replaceAll('[', '')
                                                  .replaceAll(']', ''),
                                              style: TextStyle(
                                                fontFamily: 'Yekan',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
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

  //
}
