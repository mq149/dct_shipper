// import 'package:flutter/material.dart';

class Order {
  String id;
  String storeName;
  String storeAddress;
  double storeLongitude;
  double storeLatitude;

  Order(
      {required this.id,
      required this.storeName,
      required this.storeAddress,
      required this.storeLatitude,
      required this.storeLongitude});
}
