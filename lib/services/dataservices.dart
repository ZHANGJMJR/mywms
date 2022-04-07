import '/values/constants.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData(String apiUri) async {
    Response response = await get(GlobalConst.baseUrl + apiUri,
        headers: {'Content-type': 'application/json;charset=UTF-8'});
    return response;
  }

  Future<Response> postData(String apiUri, dynamic body) async {
    Response response = await post(GlobalConst.baseUrl + apiUri, body,
        headers: {'Content-type': 'application/json;charset=UTF-8'});
    return response;
  }
}
