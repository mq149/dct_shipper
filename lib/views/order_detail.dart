import 'package:dct_shipper/helpers/config.dart';
import 'package:dct_shipper/helpers/helper.dart';
import 'package:dct_shipper/views/view_elements/circular_loading_widget.dart';
import 'package:dct_shipper/views/view_elements/order_cancel_widget.dart';
import 'package:dct_shipper/views/view_elements/order_comfirm_widget.dart';

import '../controllers/order_detail_controller.dart';
import '../models/navbar_button.dart';
import '../models/data_models/order.dart';
import '../models/route_argument.dart';
import 'view_elements/navbar_widget.dart';
import 'package:flutter/material.dart';

class OrderDetailScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState>? parentScaffoldKey;
  final RouteArgument routeArgument;
  // ignore: prefer_const_constructors_in_immutables
  OrderDetailScreen(
      {Key? key, this.parentScaffoldKey, required this.routeArgument})
      : super(key: key);

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  late OrderDetailController _con;
  bool _didPressAccept = false;
  bool _didPressCancel = false;
  bool _comfirmWidgetVisible = false;
  bool _loading = false;

  _OrderDetailScreenState() {
    _con = OrderDetailController();
  }

  @override
  void initState() {
    _con.getOrder(int.parse(widget.routeArgument.id));

    super.initState();
  }

  void setOrder(bool accept) {
    setState(() {
      _didPressAccept = accept;
    });
  }

  void setCancelWidget(bool visible) {
    setState(() {
      _didPressCancel = visible;
    });
  }

  Future<void> doSomeLoading() async {
    setState(() {
      _loading = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _loading = false;
        setOrder(false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        key: widget.parentScaffoldKey,
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: _con.order == null
                            ? []
                            : <Widget>[
                                Text(_con.order!.store.name),
                                Text(_con.order!.customer.fullname),
                                Text(_con.order!.total.toString()),
                                Text(_con.order!.orderAddress.getAddress()),
                              ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  height: 40,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: NavbarWidget(
                      floatingTitle: false,
                      title: 'Order Detail',
                      leftButton: NavbarButton(
                          icon: Icons.arrow_back,
                          iconColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      rightButton: _con.orderAccepted()
                          ? null
                          : NavbarButton(
                              icon: Icons.close,
                              iconColor: Theme.of(context).errorColor,
                              onPressed: () {
                                setCancelWidget(true);
                              }),
                    ),
                  )),
              _con.orderAccepted()
                  ? Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: Config.getShadow()),
                          child: TextButton(
                            onPressed: () {
                              setOrder(true);
                            },
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: const Text('Accept',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor)),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedOpacity(
                    duration: Config.animationDuration,
                    opacity: Helper.getOpacity(_didPressAccept),
                    child: _comfirmWidgetVisible
                        ? OrderComfirmWidget(
                            event: (finished) => {doSomeLoading()},
                            cancel: (canceled) => {setOrder(false)},
                          )
                        : Container(),
                    onEnd: () => {_comfirmWidgetVisible = _didPressAccept},
                  )),
              _loading ? const CircularLoadingWidget() : Container(),
              _didPressCancel
                  ? OrderCancelWidget(
                      didComfirmCancel: () {},
                      didPressClose: () {
                        setCancelWidget(false);
                      },
                    )
                  : Container()
            ],
          ),
        ));
  }
}
