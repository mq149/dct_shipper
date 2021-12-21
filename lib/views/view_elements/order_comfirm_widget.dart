import 'package:dct_shipper/helpers/config.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:slide_button/slide_button.dart';

class OrderComfirmWidget extends StatefulWidget {
  final Function(bool finished) event;
  final Function(bool canceled) cancel;
  const OrderComfirmWidget(
      {Key? key, required this.event, required this.cancel})
      : super(key: key);

  @override
  _OrderComfirmWidgetState createState() => _OrderComfirmWidgetState();
}

class _OrderComfirmWidgetState extends State<OrderComfirmWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration:
            BoxDecoration(color: Colors.white, boxShadow: Config.getShadow()),
        child: Column(children: <Widget>[
          Text('Slide to comfirm the order',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Theme.of(context).errorColor,
                    borderRadius: Config.getBorderRadius(),
                    boxShadow: Config.getShadow()),
                child: IconButton(
                  onPressed: () => {widget.cancel(true)},
                  icon: const Icon(Icons.close),
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: SlideButton(
                  borderRadius: 25.0,
                  height: 40,
                  backgroundColor: Theme.of(context).unselectedWidgetColor,
                  slidingBarColor: Theme.of(context).primaryColor,
                  onButtonOpened: () => widget.event(true),
                  slidingChild: Icon(Icons.arrow_forward_ios,
                      color: Theme.of(context).accentColor),
                ),
              ))
            ],
          )
        ]));
  }
}
