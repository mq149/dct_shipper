import 'package:dct_shipper/bases/base_controller.dart';
import 'package:dct_shipper/helpers/helper.dart';
import '../models/data_models/order.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderDetailController extends BaseController {
  final currentShipperId = 1;
  Order? order;
  String? orderId;

  bool isLoading = false;

  OrderDetailController({this.orderId});

  String _getOrderPath(int orderId) {
    return 'DonHang/$orderId';
  }

  String _getOrderComfirmPath(int orderId, int shipperId) {
    return 'DonHang/$orderId/ShipperXacNhan/$shipperId';
  }

  String _getOrderCancelPath(int orderId, int shipperId) {
    return 'DonHang/$orderId/ShipperHuy/$shipperId';
  }

  void getOrderLocal(int id) {
    List<Order> orders = Helper.getDummyOrders(2);
    order = orders.elementAt(id);
  }

  Future<void> getOrder() async {
    if (orderId == null) {
      return;
    }
    Uri uri = Helper.getUri(_getOrderPath(int.parse(orderId!)));
    var client = http.Client();
    try {
      var response = await client.get(uri);
      var decodedResponse =
          json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      printL(decodedResponse);
      order = Order.fromJSON(decodedResponse);
      notifyListeners();
    } catch (e) {
      printL(e);
    }
  }

  Future<void> comfirmOrder(Function(bool success) success) async {
    if (orderId == null) {
      return;
    }
    var didCallBack = false;
    isLoading = true;
    notifyListeners();
    Uri uri = Helper.getUri(
        _getOrderComfirmPath(int.parse(orderId!), currentShipperId));
    var client = http.Client();
    try {
      var response = await client.post(uri);
      if (response.statusCode == 200) {
        var decodedResponse =
            json.decode(response.body) as Map<String, dynamic>;
        var data = Map<String, dynamic>.from(decodedResponse);
        order = Order.fromJSON(data);
        printL(decodedResponse);
        // To prevent showing snackbar multiple times
        if (!didCallBack) {
          didCallBack = !didCallBack;
          success(true);
        }
      }
    } catch (e) {
      printL(e);
      if (!didCallBack) {
        didCallBack = !didCallBack;
        success(false);
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> cancelOrder(Function(bool success) success) async {
    if (orderId == null && isLoading) {
      return;
    }
    isLoading = true;
    notifyListeners();
    Uri uri = Helper.getUri(
        _getOrderCancelPath(int.parse(orderId!), currentShipperId));
    var client = http.Client();
    try {
      var response = await client.post(uri);
      if (response.statusCode == 200) {
        var decodedResponse =
            json.decode(response.body) as Map<String, dynamic>;
        var data = Map<String, dynamic>.from(decodedResponse);
        printL(decodedResponse);
        order = Order.fromJSON(data);
        success(true);
      } else if (response.statusCode == 403) {
        printL("403");
      } else {
        printL("500");
      }
      return;
    } catch (e) {
      printL(e);
      success(false);
    }

    isLoading = false;
    notifyListeners();
  }

  bool orderAccepted() {
    return order?.status.id != 2 && order?.shipper != null;
  }

  bool canCancelOrder() {
    return order != null && order?.status.id == 3;
  }
}
