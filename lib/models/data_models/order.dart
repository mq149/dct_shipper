import 'package:dct_shipper/helpers/helper.dart';
import 'package:dct_shipper/models/data_models/address.dart';
import 'package:dct_shipper/models/data_models/customer.dart';
import 'package:dct_shipper/models/data_models/order_status.dart';
import 'package:dct_shipper/models/data_models/payment_method.dart';
import 'package:dct_shipper/models/data_models/product.dart';
import 'package:dct_shipper/models/data_models/shipper.dart';
import 'package:dct_shipper/models/data_models/store.dart';
import 'package:dct_shipper/extensions/number_separator.dart';

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
  List<Product> products;

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
      this.deliveryDate,
      this.products);

  factory Order.fromJSON(Map<String, dynamic> parsedJSON) {
    Store store = Store.fromJSON(parsedJSON['CuaHang']);
    Customer customer = Customer.fromJSON(parsedJSON['KhachHang']);
    OrderStatus status = OrderStatus.fromJSON(parsedJSON['TTDH']);
    PaymentMethod paymentMethod = PaymentMethod.fromJSON(parsedJSON['PTTT']);
    Address orderAddress = Address.fromJSON(parsedJSON['DiaChiGiao']);
    Shipper shipper = Shipper.initEmpty();
    if (parsedJSON['Shipper'] != null) {
      shipper = Shipper.fromJSON(parsedJSON['Shipper']);
    }
    DateTime orderDate = DateTime.parse(parsedJSON['NgayMuaHang']);
    DateTime deliveryDate = DateTime.parse(parsedJSON['NgayGiao']);
    final dummyProducts = Helper.getDummyProducts(5);
    return Order(
        parsedJSON['Id'],
        store,
        customer,
        shipper,
        status,
        paymentMethod,
        parsedJSON['TongTien'],
        orderAddress,
        orderDate,
        deliveryDate,
        dummyProducts);
  }

  String getOrderTitle() {
    return '????n H??ng#' + id.toString() + ': ' + store.name;
  }

  String getTotalPrice() {
    return 'T???ng: ' + total.toStringWithSeparators() + '??';
  }

  String getNumberOfItems() {
    return 'S??? m??n: ' + products.length.toString();
  }

  String getDescription() {
    String description = 'Ghi ch??: ';
    for (var product in products) {
      description += product.name + ' (x' + product.unit.toString() + '), ';
    }
    return description.substring(0, description.lastIndexOf(','));
  }

  String getStoreAddress() {
    return '?????a ch??? c???a h??ng: ' + store.address.getAddress();
  }

  String getOrderAddress() {
    return '?????a ch??? kh??ch h??ng: ' + orderAddress.getAddress();
  }
}
