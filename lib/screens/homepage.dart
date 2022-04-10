import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:mywms/screens/basicpage/basicdata_page.dart';
import '../controller/sidemenu_controller.dart';
import '../utils/responsive.dart';
import '../widgets/side_menu.dart';
import '/widgets/mywidgets.dart';
import 'package:flutter/material.dart';
import 'package:mywms/widgets/myextension.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SideMenuController sideMenuController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sideMenuController = Get.put(SideMenuController());
  }


  var myindextemp = 0.obs;

  @override
  Widget build(BuildContext context) {
    // Widget testC() {
    //   return Container(
    //       child: Row(
    //     children: [
    //       Obx(() => GestureDetector(
    //             child: Container(
    //               child: 'aaa'.toLabel(),
    //               color: myindextemp.value == 0 ? Colors.red : Colors.grey,
    //             ),
    //             onTap: () => myindextemp.value = 0,
    //           )),
    //       SizedBox(
    //         width: 20,
    //       ),
    //       Obx(() => GestureDetector(
    //             child: Container(
    //               child: 'bbb'.toLabel(),
    //               color: myindextemp.value == 1 ? Colors.red : Colors.grey,
    //             ),
    //             onTap: () => myindextemp.value = 1,
    //           )),
    //     ],
    //   ));
    // }

    var box = GetStorage();
    return Scaffold(
      drawer: Responsive.isMobile(context) ? SideMenu() : null,
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: Row(children: [
          if (Responsive.isTablet(context))
            Flexible(
              child: Column(
                children: [
                  // '导航'.toLabel(color: Colors.black, fontsize: 20),
                  Expanded(
                    // default flex = 1
                    // and it takes 1/6 part of the screen
                    child: SideMenu(),
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
                // testC(),
                Expanded(
                  child: Center(
                    child: BasicDataPage(),
                    // MyButton(
                    //   title: 'aaaa',
                    //   onTap: () {
                    //     box.remove("personlocked");
                    //     box.remove("personid");
                    //     print(box.read('personlocked').toString() +
                    //         " aaaaa  home page");
                    //   },
                    // ),
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
