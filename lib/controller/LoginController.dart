import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import '../module/person.dart';
import '../utils/utils.dart';
import '../widgets/mysnackbar.dart';

class LoginController extends GetxController {
  bool checkByLogin = true;
  final box = GetStorage();

  @override
  void onInit() async {
    super.onInit();

    if (box.hasData('personid') && box.hasData('personlocked') &&
        box.read('personid') > 0 && box.read('personlocked') == 0) {
      final dio = DioSigle().dio;
      var response = await dio.get('user/' + box.read('personid').toString());
      //print(response.data['msg']+" checkWhetherLogin");
      if (response.data['code'] == 200 && response.data['data']['id'] > 0) {
        // print( response.data) ;
        Person p = Person.fromJson(response.data['data']);
        box.write('personlocked', p.locked);
        box.write('personrealname', p.realname);
        box.write('personusername', p.username);
        box.write('personid', p.id);
        box.write('personphoe', p.phone);
        if (p.locked == 0) checkByLogin = false;
        update();
      }
    }
  }

  // var checkByLogin = Rx<bool>(true);

  Future<bool> login(String username, String password) async {
    bool ret = false;
    if (username.isEmpty || password.isEmpty) {
      myGetSnackBar(title: '提示', message: '请输入用户密码信息');
      return ret;
    }
    final dio = DioSigle().dio;
    var response = await dio.post('login',
        queryParameters: {'username': username, 'password': password});
    if (response.statusCode == 200 && response.data['code'] == 200) {
      Person p = Person.fromJson(response.data['data']);
      if (p.locked == 0) {
        myGetSnackBar(
            title: '👍👍👍🚀🚀🚀🎉🎉🎉',
            message: response.data['msg'],
            icon: Icon(
              Icons.check_circle,
              color: Colors.lightGreenAccent,
              size: 40,
            ));
        //TODO 存储登录用户信息
        box.write('personusername', p.username);
        box.write('personrealname', p.realname);
        box.write('personid', p.id);
        box.write('personlocked', p.locked);
        box.write('personphone', p.phone);
        checkByLogin = false;
        //checkByLogin.value=false;
        //update();
        ret = true;
      } else {
        myGetSnackBar(
            title: '警告',
            message: '用户状态异常请与管理人员联系！',
            icon: Icon(
              Icons.cancel,
              color: Colors.redAccent,
              size: 40,
            ));
      }
      return ret;
    } else {
      myGetSnackBar(title: '提示', message: response.data['msg']);
    }
    return ret;
    //}
  }
//
// Future<bool> setPesonPerfer(Person p) async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   pref.setString("personusername", p.username);
//   pref.setString("personrealname", p.realname);
//   pref.setInt("personid", p.id);
//   pref.setString('personphone', p.phone);
//   return pref.setInt('personlocked', p.locked);
// }
//
// Future<int> getPersonPrefer() async {
//   /// 用于检查 存在缓存的用户并且，未锁定状态
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   if (pref.containsKey('personid') && pref.containsKey('personlocked')) {
//     int perId = pref.getInt('personid') ?? 0;
//     int locked = pref.getInt('personlocked') ?? 0;
//     if (locked == 0 && perId > 0) {
//       return perId;
//     }
//   }
//   return 0;
// }
//
// Future<bool> checkWhetherLogin() async {
//   bool ret = false;
//   int perId =
//       await getPersonPrefer(); //await checkLocalPersonInfo();//0;//getPersonPerfer();
//   if (perId > 0) {
//     //TODO 取用户缓存并判断
//     final dio = DioSigle().dio;
//     var response = await dio.get('user/' + perId.toString());
//     //print(response.data['msg']+" checkWhetherLogin");
//     if (response.data['code'] == 200 && response.data['data']['id'] > 0) {
//       Person p = Person.fromJson(response.data['data']);
//       setPesonPerfer(p);
//       if (p.locked != 0) return true;
//
//       /// 锁定状态需要再次登录。
//     }
//   }
//   return ret;
// }
//
// Future<int> checkLocalPersonInfo() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   int perid = await pref.getInt("personid") ?? 0;
//   int locked = await pref.getInt('personlocked') ?? 0;
//   if (locked == 0 && perid > 0) {
//     return perid;
//   } else
//     return 0;
// }
//
// Future<bool> removePersonPrefer() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   print('reomove');
//   pref.remove("personphone");
//   pref.remove("personusername");
//   pref.remove("personrealname");
//   pref.remove("personid");
//   return pref.remove('personlocked');
// }
//

}

//
// // Future<String> login({String email, String password}) async {
// //   error = "";
// //   try {
// //     loginProcess(true);
// //     List loginResp = await CQAPI.login(email: email, password: password);
// //     if (loginResp[0] != "") {
// //       //success
// //       final prefs = await SharedPreferences.getInstance();
// //       prefs.setString("token", loginResp[0]);
// //     } else {
// //       error = loginResp[1];
// //     }
// //   } finally {
// //     loginProcess(false);
// //   }
// //   return error;
// // }
// //
// setPersonPrefer(Person p) {
//   SharePreferUtil.savePreference("personid", p.id);
//   SharePreferUtil.savePreference("personusername", p.username);
//   SharePreferUtil.savePreference("personrealname", p.realname);
//   SharePreferUtil.savePreference("personphone", p.phone);
//   SharePreferUtil.savePreference("personlocked", p.locked);
//   // StorageUtil()
//   //   ..setItem("person.id", p.id)
//   //   ..setItem("person.username", p.username)
//   //   ..setItem("person.realname", p.realname)
//   //   ..setItem("person.phone", p.phone)
//   //   ..setItem("person.locked", p.locked);
// }
//

//   // int perId = StorageUtil().getItem('person.id') ?? 0;
//   // int locked = StorageUtil().getItem('person.locked')??0;
//   // if (locked == 0 &&perId>0) {
//   //   return perId;
//   // } else {
//   //   return 0;
//   // }
// }
// //
// // Future<bool> setPrefer(Person p) async {
// //   bool temp = false;
// //   try {
// //     SharePreferUtil().savePreference("person.id", p.id).then((value) => temp);
// //     SharePreferUtil()
// //         .savePreference("person.username", p.username)
// //         .then((value) => temp);
// //     SharePreferUtil()
// //         .savePreference("person.realname", p.realname)
// //         .then((value) => temp);
// //     SharePreferUtil()
// //         .savePreference("person.phone", p.phone)
// //         .then((value) => temp);
// //     SharePreferUtil()
// //         .savePreference("person.locked", p.locked)
// //         .then((value) => temp);
// //     return temp;
// //   } catch (e) {
// //     return temp;
// //   }
// // }
// //
// // Future<int> getPersonPreferStatus() async {
// //
// //   int perid = await SharePreferUtil().getPreference('person.id', 0);
// //   String perUsername =
// //       await SharePreferUtil().getPreference('person.username', '');
// //   String perRealname =
// //       await SharePreferUtil().getPreference('person.realname', '');
// //   String perPhone = await SharePreferUtil().getPreference('person.phone', '');
// //   int perLocked = await SharePreferUtil().getPreference('person.locked', 0);
// //   if (perid > 0 && perLocked == 0) {
// //     return perid;
// //   }
// //   return 0;
// // }
// //
// // removePersonPreference() {
// //   SharePreferUtil()
// //     ..removePreference('person.id')
// //     ..removePreference('person.username')
// //     ..removePreference('person.realname')
// //     ..removePreference('person.phone')
// //     ..removePreference('person.locked');
// // }
