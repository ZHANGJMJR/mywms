import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
// import 'package:mywms/values/constants.dart';
// import '../../utils/responsive.dart';
// import '../../widgets/side_menu.dart';
// import '/widgets/mywidgets.dart';
// import 'package:flutter/material.dart';
import 'package:mywms/widgets/myextension.dart';

import 'CategoryGrid.dart';



class BasicDataPage extends StatefulWidget{
  final menuSelectIndex;
  BasicDataPage({this.menuSelectIndex=0});

  @override
  State<BasicDataPage> createState() => _BasicDataPageState();
}

class _BasicDataPageState extends State<BasicDataPage> {

  int indexNavBar=0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
      final List<Widget> _widgetOptions = <Widget>[
      CategoryGrid(),
      Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var box = GetStorage();
    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 20,
      //   title: const Text('GoogleNavBar'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(indexNavBar),
      ),
      bottomNavigationBar: Container(

        decoration: BoxDecoration(
          color: Colors.grey[100],

          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.grey[500]!,
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor:  Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.amber, //Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.cubes,
                  text: '类别设置',
                ),
                GButton(
                  icon: LineIcons.utensils,
                  text: '商品设置',
                ),
                GButton(
                  icon: LineIcons.truckSide,
                  text: '未知项目',
                ),
                GButton(
                  icon: LineIcons.apple,
                  text: '其他。。。',
                ),
              ],
              selectedIndex: indexNavBar,
              onTabChange: (index) {
                setState(() {
                   indexNavBar = index;
                });
              },
            ),
          ),
        ),
      ),
    );

  }
}
