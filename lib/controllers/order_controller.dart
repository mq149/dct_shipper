import 'dart:convert';

import 'package:dct_shipper/bases/base_controller.dart';
import 'package:dct_shipper/helpers/config.dart';
import 'package:dct_shipper/helpers/helper.dart';
import 'package:dct_shipper/models/data_models/order.dart';
import 'package:http/http.dart' as http;

class OrderController extends BaseController {
  List<Order> orders = [];
  final availableOrderPath = 'DonHang/ChoXacNhan';

  OrderController();

  Future<void> getAvailableOrders() async {
    Uri uri = Helper.getUri(availableOrderPath);
    print(uri);
    var client = http.Client();
    try {
      var response = await client.get(uri);
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      print(decodedResponse);
    } catch (e) {
      print('error');
      print(e);
    }
  }
}
