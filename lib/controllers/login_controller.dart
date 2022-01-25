import 'dart:convert';
import 'package:dct_shipper/bases/base_controller.dart';
import 'package:dct_shipper/helpers/helper.dart';
import 'package:dct_shipper/models/data_models/user.dart';
import 'package:http/http.dart' as http;
import 'package:dct_shipper/repositories/user_repository.dart' as user_repo;

class LoginController extends BaseController {
  bool isLoading = false;

  LoginController();

  Future<void> login(String phoneNumber, String password,
      Function(bool success) success) async {
    if (phoneNumber == "" || password == "") {
      success(false);
      return;
    }
    var didCallBack = false;
    isLoading = true;
    notifyListeners();
    Uri uri = Helper.getUri('Authenticate/Login');
    var data = <String, String>{'username': phoneNumber, 'password': password};
    var client = http.Client();
    try {
      var response = await client.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(data));
      if (response.statusCode == 200) {
        var decodedResponse =
            json.decode(response.body) as Map<String, dynamic>;
        var resData = Map<String, dynamic>.from(decodedResponse);
        User user = User.fromJSON(resData);
        user_repo.currentUser = user;
        await user_repo.getShipper();

        printL(decodedResponse);
        // To prevent showing snackbar multiple times
        if (!didCallBack) {
          didCallBack = !didCallBack;
          success(true);
        }
      } else {
        didCallBack = !didCallBack;
        success(false);
      }
    } catch (e) {
      if (!didCallBack) {
        didCallBack = !didCallBack;
        success(false);
      }
      printL(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
