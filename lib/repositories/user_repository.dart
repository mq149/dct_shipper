import 'dart:convert';

import 'package:dct_shipper/helpers/helper.dart';
import 'package:dct_shipper/models/data_models/shipper.dart';
import 'package:dct_shipper/models/data_models/user.dart';
import 'package:http/http.dart' as http;

User currentUser = User.initEmpty();
Shipper currentShipper = Shipper.initEmpty();

bool userAuthenticated() {
  return currentUser.id != -1;
}

Future<void> getShipper() async {
  if (!userAuthenticated()) {
    return;
  }

  Uri uri = Helper.getUri2('shipper/${currentUser.id}/thong-tin-ca-nhan');
  var client = http.Client();
  try {
    var response = await client.get(uri);
    var decodedResponse =
        json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    printL(decodedResponse);
    Shipper shipper = Shipper.fromJSON2(decodedResponse);
    currentShipper = shipper;
  } catch (e) {
    printL(e);
  }
}

void logOut() {
  currentUser = User.initEmpty();
  currentShipper = Shipper.initEmpty();
}
