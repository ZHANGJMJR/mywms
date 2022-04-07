import '/screens/homepage.dart';

import 'package:get/get.dart';
import 'controller/LoginController.dart';
import 'values/constants.dart';
import 'package:flutter/material.dart';
import 'widgets/myextension.dart';

import 'widgets/mysnackbar.dart';
import 'widgets/mywidgets.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameTxtController = TextEditingController();
  final TextEditingController passwordTxtController = TextEditingController();
  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.store,
                size: 30,
                color: GlobalConst.textGreyColor,
              ),
              Text(
                "Store Bar",
                style: TextStyle(
                    fontSize: GlobalConst.globalTitleTextSize,
                    color: GlobalConst.textGreyColor),
              ),
            ],
          ),
          backgroundColor: GlobalConst.primaryColor),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        color: GlobalConst.primaryColor,
                        height: 130,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 1,
                    child: ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        color: GlobalConst.primaryColor,
                        height: 110,
                      ),
                    ),
                  ),
                  Center(
                    heightFactor: 1,
                    child: '系统登录'
                        .toLabel(
                            bold: true,
                            fontsize: GlobalConst.globalTitleTextSize,
                            color: GlobalConst.textGreyColor)
                        .margin9,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3 < 350
                  ? 300
                  : MediaQuery.of(context).size.width * 0.35,
              child: Column(
                children: [
                  MyEdit(
                    controller: usernameTxtController,
                    hint: '请输入登录账号',
                  ).margin3,
                  MyEdit(
                    controller: passwordTxtController,
                    hint: '请输入密码',
                    password: true,
                  ).margin3,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyButton(
                        title: '注 册',
                        onTap: () =>
                            myGetSnackBar(title: '提示', message: '尚不允许公开注册～哟！'),
                        color: GlobalConst.primaryColor,
                        padding: EdgeInsets.all(
                            GlobalConst.globalPaddingSizeBase * 6),
                        icon: Icon(
                          Icons.edit,
                        ),
                      ).padding9,
                      MyButton(
                        title: '登 录',
                        onTap: () async {
                          bool islogin = await controller.login(
                              usernameTxtController.text,
                              passwordTxtController.text);
                          if (islogin) {
                            //TODO 需要替换成  Get.Off
                            Get.to(() => HomePage());
                          }
                        },
                        color: GlobalConst.globalGreen,
                        padding: EdgeInsets.all(
                            GlobalConst.globalPaddingSizeBase * 6),
                        icon: Icon(
                          Icons.vpn_key,
                          color: GlobalConst.textGreyColor,
                        ),
                      ).margin9,
                    ],
                  ),
                ],
              ).padding9.margin9.card.center,
            ),
          ],
        ).center,
      ),
    );
  }
}

//Costom CLipper class with Path
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, 0); //start path with this if you are making at bottom
    path.lineTo(0, size.height - 40);
    var firstStart = Offset(size.width / 4, size.height);
    var firstEnd = Offset(size.width / 2, size.height * 0.8);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width / 4 * 3, size.height * 0.5);
    var secondEnd = Offset(size.width, size.height * 0.8);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    //path.lineTo(size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
