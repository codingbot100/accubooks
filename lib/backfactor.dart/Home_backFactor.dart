import 'package:accubooks/Factoring/data/sharedDatabase.dart';
import 'package:accubooks/backfactor.dart/page_detail.dart';
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
            context, MaterialPageRoute(builder: (context) => page_detail(
              numberFactor: counter,
               TodayDate:db.itemList[index][6],
                day: db.itemList[index][6], 
                customer_name: db.itemList[index][8],
                 barcode: counter,
                  siglePrice: db.itemList[index][6] ,
                   totalPrice: db.itemList[index][6] )));
      },
      child: Container(
        key: key,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 180,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.8, color: Color.fromARGB(255, 86, 85, 85)),
                    borderRadius: BorderRadius.circular(3.0)),
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
                height: 30,
                width: 180,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.8, color: Color.fromARGB(255, 86, 85, 85)),
                    borderRadius: BorderRadius.circular(3.0)),
                child: Center(
                  child: Text(
                    db.itemList.isNotEmpty ? db.itemList[index][8] : "No Name",
                    style: TextStyle(
                      fontFamily: 'Yekan',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 180,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.8, color: Color.fromARGB(255, 86, 85, 85)),
                    borderRadius: BorderRadius.circular(3.0)),
                child: Center(
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
              ),
              Container(
                height: 30,
                width: 180,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.8, color: Color.fromARGB(255, 86, 85, 85)),
                    borderRadius: BorderRadius.circular(3.0)),
                child: Center(
                  child: Text(
                    db.itemList.isNotEmpty ? db.itemList[index][6] : "No Name",
                    style: TextStyle(
                      fontFamily: 'Yekan',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 180,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.8, color: Color.fromARGB(255, 86, 85, 85)),
                    borderRadius: BorderRadius.circular(3.0)),
                child: Center(
                  child: Text(
                    db.itemList.isNotEmpty ? db.itemList[index][4] : "No Name",
                    style: TextStyle(
                      fontFamily: 'Yekan',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

