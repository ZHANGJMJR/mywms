import '/services/dataservices.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  Future<void> getData(String apiUri) async {
    _isLoading = true;
    Response response = await service.getData(apiUri);
    if (response.statusCode == 200) {
      _myData = response.body;
      print('success');
      update();
    } else {
      print('error');
    }
    _isLoading = false;
  }

  Future<void> postData(String apiUri, dynamic body) async {
    _isLoading = true;
    Response response = await service.postData(apiUri, body);
    if (response.statusCode == 200) {
      _myData = response.body;
      print('success');
      update();
    } else {
      print('error');
    }
    _isLoading = false;
  }
}
