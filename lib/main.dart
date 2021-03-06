
import '/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '/controller/LoginController.dart';
import '/values/lib_color_schemes.g.dart';
import 'controller/sidemenu_controller.dart';
import 'login_page.dart';
// LoginController loginController =  Get.put(LoginController());


void main() async{
  await GetStorage.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  final appPages=[
    GetPage(
      name: '/',
      page: () => LoginPage(),
    ),
    GetPage(
      name: '/home',
      page: () => HomePage(),
    ),
  ];
  // This widget is the root of your application.
  final LoginController _logincontroller = Get.put(LoginController());
  final SideMenuController sideMenuController= Get.put(SideMenuController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'zxf Design-项目',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(colorScheme: lightColorScheme),
      darkTheme: ThemeData(colorScheme: darkColorScheme),
      // theme: ThemeData(
      //   primarySwatch: Colors.deepOrange,
      // ),

      // getPages: appPages,
      // initialRoute: _logincontroller.checkByLogin?'/':'/home',
      home: GetBuilder<LoginController>(builder: (_){
        return _.checkByLogin?LoginPage():HomePage();
      },)


       // Obx(()=>_logincontroller.checkByLogin.value?LoginPage():HomePage()),
      // LoginPage(),
      //_logincontroller.checkByLogin?HomePage():LoginPage()


      // GetBuilder<LoginController>(builder:(_)=>Text('aaaaa')
      // // _logincontroller.checkByLogin?LoginPage():HomePage()
      // )

      // Getx(() {
      //   if (true)
      //     return Container();
      //    // return LoginPage();
      //   else
      //     return Container();
      //     //return HomePage();
      // },
      // ),

        //Obx(()=> loginController.checkByLogin.value?  LoginPage(): HomePage() ),

      // FutureBuilder(future: _logincontroller.checkWhetherLogin() ,
      //   builder: (cont,snapshot){
      //   print(snapshot.data);
      //     if(snapshot.data as bool){
      //       return LoginPage();
      //     }else{
      //       return HomePage();
      //     }
      //   }),
    );
  }
}
