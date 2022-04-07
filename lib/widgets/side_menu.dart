import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mywms/screens/basicdata_page.dart';
import 'package:mywms/utils/responsive.dart';
import 'package:mywms/values/constants.dart';
import '../controller/sidemenu_controller.dart';
import 'myextension.dart';

class SideMenu extends StatelessWidget {
  SideMenuController sideMenuController = Get.put(SideMenuController());
  final int? selectMenuIndex;

  SideMenu({Key? key, this.selectMenuIndex = 0}) : super(key: key);

  gotoPage(String menuName) {
    switch(menuName) {
      case '基础数据': {
        return () {
          Get.off(BasicDataPage(menuSelectIndex: 1,));
        };
      }
      break;

      case '采购处理': {
        return () {
          Get.off(BasicDataPage(menuSelectIndex: 2,));
        };
      }
      break;

      case '入出库业务': {
        return () {
          Get.off(BasicDataPage(menuSelectIndex: 3,));
        };
      }
      break;
      case '报表统计': {
        return () {
          Get.off(BasicDataPage(menuSelectIndex: 4,));
        };
      }
      break;
      case '系统设置': {
        return () {
          Get.off(BasicDataPage(menuSelectIndex: 5,));
        };
      }
      break;
      case '个人信息': {
        return () {
          Get.off(BasicDataPage(menuSelectIndex: 6,));
        };
      }
      break;
      case '退出登录': {
        return ()=>{};
      }
      break;
      default: {
        return ()=>{};
      }
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      DrawerHeader(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/logocetc.png",
              width: Responsive.isMobile(context) ? 160.0 : 280.0,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: 10,
            ),
            '食堂仓库管理'.toLabel(fontsize: 20, color: Colors.black),
          ],
        ),
      ),
      Expanded(
        child: Obx(() => sideMenuController.loaded.value
            ? ListView.builder(
                itemCount: sideMenuController.menuList.value.length,
                itemBuilder: (BuildContext context, int p) {
                  return DrawerListTile(
                    title: sideMenuController.menuList.value[p].title!,
                    svgSrc: sideMenuController.menuList.value[p].svgSrc!,
                    color: selectMenuIndex == p ? Colors.amber : null,
                    press:
                        gotoPage(sideMenuController.menuList.value[p].title!),
                  );
                },
              )
            : CircularProgressIndicator()),
      ),
    ]));
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {Key? key,
      // For selecting those three line once press "Command+D"
      required this.title,
      required this.svgSrc,
      required this.press,
      this.color})
      : super(key: key);

  final Color? color;
  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      tileColor: color,
      horizontalTitleGap: 0.0,
      hoverColor: Colors.purple,
      focusColor: Colors.greenAccent,
      selectedColor: GlobalConst.primaryColor,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.black,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
