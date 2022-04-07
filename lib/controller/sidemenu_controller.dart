import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../module/menu.dart';
class SideMenuController extends GetxController {
RxList<Menu> menuList=RxList<Menu>([]);
var loaded=false.obs;
@override
  void onInit() {
    super.onInit();
    readJson();
}
void readJson() async{
   await rootBundle.loadString('assets/menu.json').then((value) {
      List<dynamic> tempmap = json.decode(value);
      menuList.value = tempmap.map((e) => Menu.fromJson(e)).toList();
      if(menuList.value.isNotEmpty && menuList.value.length>0) loaded.value=true;
    });
  }
}