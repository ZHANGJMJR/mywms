import '/widgets/myextension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/constants.dart';

dynamic myGetSnackBar(
    {String title = '',
    String message = '',
    double fontSizeMsg = 16,
    double fontSizeTitle = 20,
    Icon icon = const Icon(Icons.info_outline,color: Colors.orange,size: 40,)}) {
  return Get.snackbar('提示', '请输入用户密码信息',
      backgroundColor: GlobalConst.mySecondColor,
      shouldIconPulse: false,
      icon: icon,
      padding: EdgeInsets.all(  20),
      //margin: EdgeInsets.only(left: 60),
      titleText: title.toLabel(
        fontsize: fontSizeTitle,
        color: GlobalConst.myOnSecondColor,
      ),
      messageText: message.toLabel(
        fontsize: fontSizeMsg,
        color: GlobalConst.myOnSecondColor,
      ),
      snackPosition: SnackPosition.BOTTOM);
}
