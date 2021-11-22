import 'package:dct_shipper/helpers/config.dart';
import 'package:dct_shipper/models/order.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderItemWidget extends StatefulWidget {
  Order order;
  final Function(String id) onTap;
  OrderItemWidget({Key? key, required this.order, required this.onTap})
      : super(key: key);

  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.order.id);
      },
      child: SizedBox(
          height: 80,
          child: Column(children: <Widget>[
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(18, 8, 0, 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Order' +
                                  widget.order.id +
                                  ': ' +
                                  widget.order.storeName,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            Text(
                              widget.order.storeAddress,
                              style: Theme.of(context).textTheme.subtitle2,
                            )
                          ],
                        ))),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: Config.getBorderRadius(),
                      // boxShadow: Config.getShadow()
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward,
                          color: Theme.of(context).primaryColor),
                      onPressed: () => {},
                    ),
                  ),
                )
              ],
            )),
            Container(height: 1, color: Colors.black.withOpacity(0.5))
          ])),
    );
  }
}
