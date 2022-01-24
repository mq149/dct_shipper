import 'package:dct_shipper/models/data_models/address.dart';
import 'package:dct_shipper/models/data_models/customer.dart';
import 'package:dct_shipper/models/data_models/order_status.dart';
import 'package:dct_shipper/models/data_models/payment_method.dart';
import 'package:dct_shipper/models/data_models/product.dart';
import 'package:dct_shipper/models/data_models/role.dart';
import 'package:dct_shipper/models/data_models/shipper.dart';
import 'package:dct_shipper/models/data_models/store.dart';
import 'package:flutter/material.dart';

import '../models/data_models/order.dart';
import 'config.dart';

void printL(Object object) {
  // ignore: avoid_print
  print(object);
}

class Helper {
  static Role getShipperRole() {
    return Role(id: 1, name: 'Shipper');
  }

  static List<Product> getDummyProducts(int numberOfProducts) {
    List<Product> products = [];
    for (var i = 0; i < numberOfProducts; i++) {
      Product product = Product(i, 'Tên sản phẩm', 10000, 500, 1);
      products.add(product);
    }
    return products;
  }

  static List<Order> getDummyOrders(int numberOfOrders) {
    List<Order> orders = [];
    final pm = PaymentMethod(id: 1, name: "Tiền mặt");
    final status = OrderStatus(id: 1, name: "Đang chờ xác nhận");
    final role = Role(id: 1, name: "CuaHang");
    final address = Address(
        id: 1,
        number: "189C",
        street: "Cong Quynh",
        subdistrict: "Nguyen Cu Trinh",
        district: "Quan 1",
        city: "TP. HCM");
    final customer = Customer(1, role, "0123456778", "someemail@email.com",
        "KhachHang A", address, 1, "294125324");
    final store = Store(2, role, "3951251414", "storeemail@email.com",
        "Co-op Mart Cong Quynh", address, 1, "Co-op Mart Cong Quynh", true);
    final shipper = Shipper(
        3,
        role,
        "8519255214",
        "shipperemail@email.com",
        "Bui Minh Quan",
        address,
        1,
        "214128452",
        true,
        "00A0-00000",
        "Honda Wave");

    final status2 = OrderStatus(id: 2, name: "Cửa hàng đã xác nhân");
    final status3 = OrderStatus(id: 3, name: "Đang lấy hàng");
    final status4 = OrderStatus(id: 3, name: "Đang giao hàng");
    final products = getDummyProducts(5);
    for (var i = 0; i < numberOfOrders; i++) {
      Order order;
      if (i == 1) {
        order = Order(i, store, customer, null, status3, pm, 45000.0, address,
            DateTime.now(), DateTime.now(), products);
      } else {
        order = Order(i, store, customer, shipper, status2, pm, 45000.0,
            address, DateTime.now(), DateTime.now(), products);
      }
      orders.add(order);
    }
    return orders;
  }

  static Uri getUri(String path) {
    String _path = Uri.parse(Config.baseURL()).path;
    if (!_path.endsWith('/')) {
      _path += '/';
    }
    Uri uri = Uri(
        scheme: Uri.parse(Config.baseURL()).scheme,
        host: Uri.parse(Config.baseURL()).host,
        port: Uri.parse(Config.baseURL()).port,
        path: _path + path);
    return uri;
  }

  static getData(Map<String, dynamic> data) {
    return data['data'] ?? [];
  }

  static double getOpacity(bool visible) {
    return visible ? 1.0 : 0.0;
  }

  static SnackBar getSnackBar(String text) {
    return SnackBar(content: Text(text), backgroundColor: Config.primaryColor);
  }
}
