import 'dart:convert';
import 'package:dct_shipper/bases/base_controller.dart';
import 'package:dct_shipper/helpers/helper.dart';
import 'package:dct_shipper/models/data_models/order.dart';
import 'package:http/http.dart' as http;

class OrderController extends BaseController {
  List<Order> orders = [];
  final availableOrderPath = 'DonHang/ChoXacNhan';

  OrderController() {
    // orders = orders = Helper.getDummyOrders(2);
  }

  Future<void> getAvailableOrders() async {
    Uri uri = Helper.getUri(availableOrderPath);
    var client = http.Client();
    try {
      var response = await client.get(uri);
      var decodedResponse =
          json.decode(utf8.decode(response.bodyBytes)) as List;
      for (var item in decodedResponse) {
        Order order = Order.fromJSON(item as Map<String, dynamic>);
        if (!orders.contains(order)) {
          orders.add(order);
        }
      }
      notifyListeners();
    } catch (e) {
      printL(e);
    }
  }
}
