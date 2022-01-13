import '../../helpers/config.dart';
import '../../models/data_models/order.dart';
import 'order_item_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderListWidget extends StatefulWidget {
  List<Order> orders;
  final Function(int id) onPressed;
  final Future<void> Function() onRefresh;
  OrderListWidget(
      {Key? key,
      required this.orders,
      required this.onPressed,
      required this.onRefresh})
      : super(key: key);

  @override
  _OrderListWidgetState createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  int id = -1;

  @override
  void initState() {
    super.initState();
  }

  void selectItem(int id) {
    setState(() {
      if (this.id == id) {
        this.id = -1;
      } else {
        this.id = id;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: widget.onRefresh,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: Config.getShadow(),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: widget.orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return OrderItemWidget(
                    order: widget.orders[index],
                    selected: id == widget.orders[index].id,
                    onTap: (id, previewing) {
                      if (previewing) {
                        selectItem(id);
                      } else {
                        widget.onPressed(id);
                      }
                    },
                  );
                }),
          ),
        ));
  }
}
