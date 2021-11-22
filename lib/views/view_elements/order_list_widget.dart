import 'package:dct_shipper/models/order.dart';
import 'package:dct_shipper/views/view_elements/order_item_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderListWidget extends StatefulWidget {
  List<Order> orders;
  OrderListWidget({Key? key, required this.orders}) : super(key: key);

  @override
  _OrderListWidgetState createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: widget.orders.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderItemWidget(
            order: widget.orders[index],
            onTap: (id) => {
              print(id),
            },
          );
        });
  }
}
