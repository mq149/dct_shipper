import 'order.dart';

class OrderStatus {
  int id;
  String name;
  OrderStatus({required this.id, required this.name});

  factory OrderStatus.fromJSON(Map<String, dynamic> parsedJSON) {
    return OrderStatus(id: parsedJSON['Id'], name: parsedJSON['Ten']);
  }
}
