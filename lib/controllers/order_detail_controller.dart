import 'package:dct_shipper/helpers/helper.dart';

import '../models/data_models/address.dart';
import '../models/data_models/customer.dart';
import '../models/data_models/order.dart';
import '../models/data_models/order_status.dart';
import '../models/data_models/payment_method.dart';
import '../models/data_models/role.dart';
import '../models/data_models/shipper.dart';
import '../models/data_models/store.dart';

class OrderDetailController {
  Order? order;
  String? orderId;
  OrderDetailController();

  void getOrder(int id) {
    List<Order> orders = Helper.getDummyOrders(5);
    order = orders.elementAt(id);
  }

  bool orderAccepted() {
    return order != null && order?.shipper != null;
  }
}
