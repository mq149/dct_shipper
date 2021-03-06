import 'package:dct_shipper/extensions/hex_color.dart';
import 'package:dct_shipper/helpers/config.dart';
import 'package:flutter/material.dart';

class OrderCancelWidget extends StatefulWidget {
  final Function(String) didComfirmCancel;
  final Function() didPressClose;
  const OrderCancelWidget(
      {Key? key, required this.didComfirmCancel, required this.didPressClose})
      : super(key: key);

  @override
  _OrderCancelWidgetState createState() => _OrderCancelWidgetState();
}

class _OrderCancelWidgetState extends State<OrderCancelWidget> {
  late String reason;

  _OrderCancelWidgetState() {
    reason = "";
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.black.withOpacity(0.3),
      child: Center(
          child: Wrap(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Vui lòng nêu rõ lý do',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: HexColor.fromHex('#E9E9E9'),
                    borderRadius: BorderRadius.circular(10.0)),
                child: TextField(
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: InputBorder.none,
                    hintText: 'Lý do',
                  ),
                  onChanged: (value) {
                    reason = value;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: Config.getBorderRadius(),
                    boxShadow: Config.getShadow(),
                    color: Theme.of(context).errorColor),
                child: TextButton(
                    onPressed: () {
                      widget.didComfirmCancel(reason);
                    },
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          'Xác nhận huỷ',
                          style: TextStyle(color: Colors.white),
                        ))),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 40,
                  width: 150,
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
                          'Quay lại',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ))),
            ],
          ),
        )
      ])),
    );
  }
}
