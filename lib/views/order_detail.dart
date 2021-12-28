import 'package:dct_shipper/helpers/config.dart';
import 'package:dct_shipper/helpers/helper.dart';
import 'package:dct_shipper/views/view_elements/circular_loading_widget.dart';
import 'package:dct_shipper/views/view_elements/order_cancel_widget.dart';
import 'package:dct_shipper/views/view_elements/order_comfirm_widget.dart';

import '../controllers/order_detail_controller.dart';
import '../models/navbar_button.dart';
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
    _con.orderId = widget.routeArgument.id;
    _con.getOrder();
    _con.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void _setOrderComfirmWidget(bool visible) {
    setState(() {
      _comfirmWidgetVisible = visible;
    });
  }

  void _setOrderCancelWidget(bool visible) {
    setState(() {
      _didPressCancel = visible;
    });
  }

  bool _acceptButtonVisible() {
    return !_con.orderAccepted();
  }

  bool _orderComfirmSliderVisible() {
    return _comfirmWidgetVisible && !_con.orderAccepted();
  }

  bool _orderCancelButtonVisible() {
    return _con.canCancelOrder();
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
              /// Order information
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

              /// Top bar
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
                      rightButton: _orderCancelButtonVisible()
                          ? NavbarButton(
                              icon: Icons.close,
                              iconColor: Theme.of(context).errorColor,
                              onPressed: () {
                                _setOrderCancelWidget(true);
                              })
                          : null,
                    ),
                  )),

              /// Order Accept Button
              _acceptButtonVisible()
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
                              _setOrderComfirmWidget(true);
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

              /// Order Comfirm Slider
              _orderComfirmSliderVisible()
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: OrderComfirmWidget(
                        event: (finished) => {
                          _con.comfirmOrder((success) {
                            setState(() {
                              _con.isLoading = false;
                            });
                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  Helper.getSnackBar(
                                      'Order comfirmed successfully'));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  Helper.getSnackBar(
                                      'Failed to comfirm order'));
                            }
                          })
                        },
                        cancel: (canceled) => {_setOrderComfirmWidget(false)},
                      ))
                  : Container(),

              /// Order Cancel Popup
              _didPressCancel
                  ? OrderCancelWidget(
                      didComfirmCancel: () {
                        _con.cancelOrder((success) {
                          setState(() {
                            _con.isLoading = false;
                          });
                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                Helper.getSnackBar('Order cancelled'));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                Helper.getSnackBar('Failed to cancel order'));
                          }
                          _setOrderCancelWidget(false);
                        });
                      },
                      didPressClose: () {
                        _setOrderCancelWidget(false);
                      },
                    )
                  : Container(),

              /// Loading Widget
              _con.isLoading ? const CircularLoadingWidget() : Container(),
            ],
          ),
        ));
  }
}
