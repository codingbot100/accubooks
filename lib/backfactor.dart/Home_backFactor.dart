import 'package:accubooks/Factoring/data/sharedDatabase.dart';
import 'package:accubooks/backfactor.dart/Factoring/Home_Factoring.dart';
import 'package:flutter/material.dart';

main() {
  runApp(home_backFactor());
}

class home_backFactor extends StatefulWidget {
  const home_backFactor({super.key});

  @override
  State<home_backFactor> createState() => _home_backFactorState();
}

class _home_backFactorState extends State<home_backFactor> {
  TextEditingController _searchController = TextEditingController();
  SharedPreferencesHelper db = SharedPreferencesHelper();

  Future<void> loadList() async {
    List<List<String>> loadedList = await SharedPreferencesHelper.getList();
    int loadedFactor = await SharedPreferencesHelper.loadNumberFactor();

    setState(() {
      db.itemList = loadedList;
    });
  }

  @override
  void initState() {
    loadList();
    super.initState();
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
          body: Expanded(
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
                      padding:
                          const EdgeInsets.only(right: 20, top: 20, bottom: 30),
                      child: Row(children: [
                        Text("لیست فاکتور ها",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'YekanBakh'))
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 40),
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
                                                  BorderRadius.circular(10.0))),
                                      onChanged: (value) {}))),
                        ],
                      ),
                    ),
                    Container(
                      width: 950,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 100, child: title('مجموعه پول')),
                              title('تاریخ خرید'),
                              title("نمبر فاکتور"),
                              title('نام خریدار'),
                              title("شماره"),
                            ]),
                      ),
                    ),
                    Divider(),
                    TextButton(
                        onPressed: () async {
                          await db.clearList();
                        },
                        child: Text("clear")),
                    Expanded(
                      child: Container(
                        width: 1100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return factorList(
                                  index, db.itemList[index][0].toString());
                            },
                            itemCount: db.itemList.length),
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
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Yekan',
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget factorList(int index, String text) {
    int counter = index + 1;
    Key key = UniqueKey(); // UniqueKey for each widget
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => back_Home_Factoring(
                    time: db.itemList[index][5],
                    numberFactor: counter,
                    TodayDate: db.itemList[index][6],
                    day: db.itemList[index][7],
                    name_goods: db.itemList[index][2],
                    customer_name: db.itemList[index][8],
                    barcode: counter,
                    siglePrice: db.itemList[index][6],
                    numbersOfGoods: db.itemList[index][3],
                    seller_name: db.itemList[index][10])));

        // print(db.itemList[index][7]);

        // time 5
        //date 6
        //تعداذ 3
        // نام کالا 2
        // facotor number 1
        //نام مشتری 8
        //روز به 7
        //10 نام فروشنده

        // setState(() {
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) => Test(
        //               name: db.itemList[index][8],
        //               barcode: counter.toString())));
        // });
      },
      child: Container(
        key: key,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 60,
              child: Center(
                child: Text(
                  '$counter',
                  style: TextStyle(
                    fontFamily: 'Yekan',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              width: 130,
              child: Text(
                db.itemList.isNotEmpty ? db.itemList[index][8] : "No Name",
                style: TextStyle(
                  fontFamily: 'Yekan',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: 60,
              child: Text(
                "$counter",
                // db.itemList.isNotEmpty ? db.itemList[index][2] : "No Name",
                style: TextStyle(
                  fontFamily: 'Yekan',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: 100,
              child: Text(
                db.itemList.isNotEmpty ? db.itemList[index][6] : "No Name",
                style: TextStyle(
                  fontFamily: 'Yekan',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: 100,
              child: Text(
                db.itemList.isNotEmpty ? db.itemList[index][4] : "No Name",
                style: TextStyle(
                  fontFamily: 'Yekan',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
