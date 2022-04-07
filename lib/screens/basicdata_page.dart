import 'package:get_storage/get_storage.dart';

import '../utils/responsive.dart';
import '../widgets/side_menu.dart';
import '/widgets/mywidgets.dart';
import 'package:flutter/material.dart';
import 'package:mywms/widgets/myextension.dart';


class BasicDataPage extends StatelessWidget{
  final menuSelectIndex;
  BasicDataPage({this.menuSelectIndex=0});
  @override
  Widget build(BuildContext context) {
    var box = GetStorage();
    return Scaffold(
      drawer: Responsive.isMobile(context)?SideMenu():null,
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: Row(children: [
          if (Responsive.isTablet(context)) Flexible(
            child: Column(
              children: [
               // '导航'.toLabel(color: Colors.black, fontsize: 20),
                  Expanded(
                    // default flex = 1
                    // and it takes 1/6 part of the screen
                    child: SideMenu(selectMenuIndex: 1,),
                  ),
              ],
            ),
            flex: 1,
          ),
          Flexible(
            flex: 4,
            child: Column(
              children: [
                '数据处理 窗口'.toLabel(color: Colors.black, fontsize: 20),
                Expanded(
                  child: Center(
                    child: MyButton(
                      title: 'aaaa',
                      onTap: () {
                        box.remove("personlocked");
                        box.remove("personid");
                        print(box.read('personlocked').toString() +
                            " aaaaa  home page");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
