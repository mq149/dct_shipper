import '../../helpers/config.dart';
import '../../models/data_models/order.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderItemWidget extends StatefulWidget {
  Order order;
  final Function(int id, bool previewing) onTap;
  bool selected;
  OrderItemWidget(
      {Key? key,
      required this.order,
      required this.selected,
      required this.onTap})
      : super(key: key);

  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.order.id, true);
      },
      child: Container(
          color:
              widget.selected ? Theme.of(context).primaryColor : Colors.white,
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          height: 80,
          child: Column(children: <Widget>[
            Container(
              height: 1,
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Order#' +
                          widget.order.id.toString() +
                          ': ' +
                          widget.order.store.name,
                      style: widget.selected
                          ? Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.white)
                          : Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      widget.order.store.address.getAddress(),
                      style: widget.selected
                          ? Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(color: Colors.white)
                          : Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                )),
                const SizedBox(
                  width: 10,
                ),
                widget.selected
                    ? Container(
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
                          onPressed: () {
                            widget.onTap(widget.order.id, false);
                          },
                        ),
                      )
                    : const SizedBox(
                        width: 40,
                        height: 40,
                      )
              ],
            )),
            Container(
                height: 1,
                color: widget.selected
                    ? Colors.transparent
                    : Colors.black.withOpacity(0.2))
          ])),
    );
  }
}
