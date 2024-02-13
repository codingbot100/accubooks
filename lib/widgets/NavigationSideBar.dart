import 'package:flutter/material.dart';

class NavigationSidebar extends StatelessWidget {
  final List<String> items;
  final List<Widget> itemsIcons; // Updated to accept a list of Widget
  final int selectedIndex;
  final Function(int) onItemSelected;

  NavigationSidebar({
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.itemsIcons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: BoxDecoration(
          color: Color.fromRGBO(247, 247, 247, 1),
          borderRadius: BorderRadius.circular(20.0)),
      width: 100,
      child: Row(
        children: [
          Center(
            child: Container(
              width: 200,
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: 80, top: 40, left: 30),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                                width: 100,
                                height: 100,
                                child: CircleAvatar(
                                  backgroundColor: Colors.lightBlueAccent,
                                  child: Text(
                                    'تک',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "فروشگاه تک",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            height: 40,
                            child: ListTile(
                              minVerticalPadding: 5,
                              dense: true,
                              // hoverColor: Color.fromRGBO(45, 45, 45, 1),
                              // selectedColor: Color.fromRGBO(45, 45, 45, 1),
                              // selectedTileColor: Color.fromRGBO(45, 45, 45, 1),
                              leading: itemsIcons[
                                  index], // Use the provided icon widget
                              title: Text(
                                items[index],
                                style: TextStyle(
                                    color: Color(0xFF15111D),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              onTap: () {
                                onItemSelected(index);
                              },
                              selected: selectedIndex == index,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
