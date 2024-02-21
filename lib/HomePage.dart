import 'package:accubooks/Factoring/Home_Factoring.dart';
import 'package:accubooks/Factoring/prac/pr.dart';
import 'package:accubooks/employees/Ware_Home.dart';
import '../whouse2.dart/Ware_Home.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("حدید نرم افزار"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "محصولات",icon: Icon(Iconsax.document)),
            Tab(text: "فروشات",icon: Icon(Icons.warehouse)),
            Tab(text: "کارمندان", icon: Icon(Icons.receipt)),
            Tab(text: "گزارشات", icon: Icon(Icons.settings)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Home_Page(),
           Home_Factoring(),
          employees(),
          InvoiceScreen(),
        ],
      ),
    );
  }
}


