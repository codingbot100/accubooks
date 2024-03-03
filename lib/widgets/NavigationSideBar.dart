// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:accubooks/widgets/imageData.dart';
import 'package:accubooks/widgets/save_Name.dart';
import 'package:flutter/material.dart';

class NavigationSidebar extends StatefulWidget {
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
  State<NavigationSidebar> createState() => _NavigationSidebarState();
}

class _NavigationSidebarState extends State<NavigationSidebar> {
  late String _loadedInfo;
  int _selectedindex = 0;
  File? _image2;
  int font = 15;
  @override
  void initState() {
    super.initState();
    loadImage();
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

  Future<void> loadImage() async {
    final String? imagePath = await ImageHandler.getSavedImagePath();
    if (imagePath != null) {
      setState(() {
        _image2 = File(imagePath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          // top: 30, bottom: 30
          ),
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(0
                  // 20.0
                  )),
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
                          padding: const EdgeInsets.only(
                              bottom: 80, top: 40, left: 30),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    child: CircleAvatar(
                                      child: ClipOval(
                                        child: _image2 != null
                                            ? Image.file(
                                                _image2!,
                                                fit: BoxFit.cover,
                                                width: 150,
                                                height: 150,
                                              )
                                            : Text(
                                                'No image selected',
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "فروشگاه " + _loadedInfo,
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
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                height: 50,
                                child: ListTile(
                                  minVerticalPadding: 10,
                                  // hoverColor: Color.fromRGBO(45, 45, 45, 1),
                                  // selectedColor: Color.fromRGBO(8, 6, 6, 1),
                                  selectedTileColor: Color.fromRGBO(7, 7, 7, 1),
                                  leading: widget.itemsIcons[
                                      index], // Use the provided icon widget
                                  title: Text(
                                    widget.items[index],
                                    style: TextStyle(
                                        color: Color(0xFF15111D),
                                        fontSize: 18,
                                        fontFamily: 'YekanBakh',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  onTap: () {
                                    widget.onItemSelected(index);
                                  },
                                  selected: widget.selectedIndex == index,
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
        ),
      ),
    );
  }
}
