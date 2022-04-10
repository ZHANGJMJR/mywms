import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mywms/utils/responsive.dart';
import '../controller/sidemenu_controller.dart';
import 'myextension.dart';

class SideMenu extends StatelessWidget {
  SideMenuController sideMenuController = Get.find<SideMenuController>();
  final int? selectMenuIndex;
  SideMenu({Key? key, this.selectMenuIndex = 0}) : super(key: key);

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
                    index: p,
                    val: p == 2 ? 2 : 0,
                    title: sideMenuController.menuList.value[p].title!,
                    svgSrc: sideMenuController.menuList.value[p].svgSrc!,
                    color: sideMenuController.selectedMenuIndex.value == p
                        ? Colors.amber
                        : null, //selectMenuIndex == p ? Colors.amber : null,
                    press: () {
                      sideMenuController.selectedMenuIndex.value = p;
                    },
                    //gotoPage(sideMenuController.menuList.value[p].title!),
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
      required this.index,
      required this.title,
      required this.svgSrc,
      required this.press,
      this.color,
      this.selected = false,
      this.val = 0})
      : super(key: key);
  final int index;
  final Color? color;
  final String title, svgSrc;
  final VoidCallback press;
  final bool selected;
  final int val;

  @override
  Widget build(BuildContext context) {
    SideMenuController _sideMenuController = Get.find<SideMenuController>();
    return Obx(() {
      if (_sideMenuController.selectedMenuIndex.value == index) {
        return ListTile(
          onTap: press,
          tileColor: Colors.amber,
          horizontalTitleGap: 0.0,
          hoverColor: Colors.amberAccent[100],
          // trailing: CircleAvatar(backgroundColor: Colors.pink,radius: 10,child: '3'.toLabel(fontsize: 14),),
          leading: SvgPicture.asset(
            svgSrc,
            color: Colors.black,
            height: 16,
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          trailing: this.val > 0
              ? CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 10,
                  child: val.toString().toLabel(fontsize: 10),
                )
              : null,
        );
      } else {
        return ListTile(
          onTap: press,
          tileColor: null,
          horizontalTitleGap: 0.0,
          hoverColor: Colors.amberAccent[100],
          leading: SvgPicture.asset(
            svgSrc,
            color: Colors.black,
            height: 16,
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          trailing: this.val > 0
              ? CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 10,
                  child: val.toString().toLabel(fontsize: 10),
                )
              : null,
        );
      }
    });
  }
}
