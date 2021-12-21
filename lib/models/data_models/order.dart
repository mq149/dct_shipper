import 'package:dct_shipper/models/data_models/address.dart';
import 'package:dct_shipper/models/data_models/customer.dart';
import 'package:dct_shipper/models/data_models/order_status.dart';
import 'package:dct_shipper/models/data_models/payment_method.dart';
import 'package:dct_shipper/models/data_models/shipper.dart';
import 'package:dct_shipper/models/data_models/store.dart';

class Order {
  int id;
  Store store;
  Customer customer;
  Shipper? shipper;
  OrderStatus status;
  PaymentMethod paymentMethod;
  double total;
  Address orderAddress;
  DateTime orderDate;
  DateTime deliveryDate;

  Order(
      this.id,
      this.store,
      this.customer,
      this.shipper,
      this.status,
      this.paymentMethod,
      this.total,
      this.orderAddress,
      this.orderDate,
      this.deliveryDate);

  //     factory Category.fromJson2(Map<String, dynamic> parsedJson) {
  //   return Category.init(
  //       id: parsedJson['id'].toString(),
  //       name: parsedJson['name'] ?? '',
  //       image: config.DefaultData.foodMedia);
  // }

  // Category.fromJSON(Map<String, dynamic> jsonMap) {
  //   try {
  //     id = jsonMap['id'].toString();
  //     name = jsonMap['name'];
  //     image = config.DefaultData.categoryMedia;
  //     // jsonMap['media'] != null && (jsonMap['media'] as List).length > 0
  //     //     ? Media.fromJSON(jsonMap['media'][0])
  //     //     : new Media();
  //   } catch (e) {
  //     id = '';
  //     name = '';
  //     image = new Media();
  //     print(CustomTrace(StackTrace.current, message: e));
  //   }
  // }
}
