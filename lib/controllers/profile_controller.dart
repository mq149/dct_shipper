import 'package:dct_shipper/bases/base_controller.dart';
import 'package:dct_shipper/helpers/helper.dart';
import 'package:dct_shipper/models/data_models/shipper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dct_shipper/repositories/user_repository.dart' as user_repo;

class ProfileController extends BaseController {
  bool isLoading = false;

  ProfileController();

  String _getProfilePath(int userId) {
    return 'shipper/$userId/thong-tin-ca-nhan';
  }

  Future<void> getShipper() async {
    if (!user_repo.userAuthenticated()) {
      return;
    }

    Uri uri = Helper.getUri2(_getProfilePath(user_repo.currentUser.id));
    var client = http.Client();
    try {
      var response = await client.get(uri);
      var decodedResponse =
          json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      printL(decodedResponse);
      Shipper shipper = Shipper.fromJSON2(decodedResponse);
      user_repo.currentShipper = shipper;
      notifyListeners();
    } catch (e) {
      printL(e);
    }
  }

  void logOut() {
    user_repo.logOut();
  }
}
