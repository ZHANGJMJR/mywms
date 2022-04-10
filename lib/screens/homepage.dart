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
   SideMenuController sideMenuController= Get.find<SideMenuController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // sideMenuController
  }

  // var myindextemp = 0.obs;

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
        title: Text('SnowBay Inc.'),
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
                // '数据处理 窗口'.toLabel(color: Colors.black, fontsize: 20),
                // testC(),
                Expanded(
                  child: Center(
                    child: Obx(() {
                     switch (sideMenuController.selectedMenuIndex.value) {
                      // switch (1) {
                        // case 0:
                        //   return Container(
                        //     child: 'dashboard'.toLabel(),
                        //   );
                        case 1:
                          return BasicDataPage();
                          break;
                        default:
                          return Container(
                            child: sideMenuController
                                .menuList[
                                    sideMenuController.selectedMenuIndex.value]
                                .title
                                .toString()
                                .toLabel(color: Colors.pinkAccent),
                          );
                      }
                    }),
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
