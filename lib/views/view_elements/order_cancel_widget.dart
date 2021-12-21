import 'package:dct_shipper/helpers/config.dart';
import 'package:flutter/material.dart';

class OrderCancelWidget extends StatefulWidget {
  final Function() didComfirmCancel;
  final Function() didPressClose;
  const OrderCancelWidget(
      {Key? key, required this.didComfirmCancel, required this.didPressClose})
      : super(key: key);

  @override
  _OrderCancelWidgetState createState() => _OrderCancelWidgetState();
}

class _OrderCancelWidgetState extends State<OrderCancelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: Center(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Please write down the reason',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        labelText: 'Reason', border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: Config.getBorderRadius(),
                        boxShadow: Config.getShadow(),
                        color: Theme.of(context).errorColor),
                    child: TextButton(
                        onPressed: () {},
                        child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              'Comfirm cancel',
                              style: TextStyle(color: Colors.white),
                            ))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: Config.getBorderRadius(),
                          boxShadow: Config.getShadow(),
                          color: Colors.white),
                      child: TextButton(
                          onPressed: () {
                            widget.didPressClose();
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              'Back',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ))),
                ],
              ))),
    );
  }
}
