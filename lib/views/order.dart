import 'package:dct_shipper/controllers/order_controller.dart';
import 'package:dct_shipper/helpers/helper.dart';

import '../models/navbar_button.dart';
import '../models/data_models/order.dart';
import '../models/route_argument.dart';
import 'view_elements/navbar_widget.dart';
import 'view_elements/order_list_widget.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState>? parentScaffoldKey;
  // ignore: prefer_const_constructors_in_immutables
  OrderScreen({Key? key, this.parentScaffoldKey}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order> orders = Helper.getDummyOrders(2);

  late OrderController _con;

  _OrderScreenState() {
    _con = OrderController();
  }

  @override
  void initState() {
    _con.getAvailableOrders();
    _con.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        key: widget.parentScaffoldKey,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(color: Colors.white.withOpacity(0.3)),
                ),
                Expanded(
                  flex: 1,
                  child: OrderListWidget(
                    orders: _con.orders,
                    onRefresh: () {
                      return _con.getAvailableOrders();
                    },
                    onPressed: (id) {
                      Navigator.pushNamed(context, "/OrderDetail",
                          arguments: RouteArgument(
                              id: id.toString(), heroTag: id.toString()));
                    },
                  ),
                )
              ]),
              Positioned(
                  top: 8,
                  left: 0,
                  right: 0,
                  height: 50,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: NavbarWidget(
                      title: 'Đơn Hàng',
                      leftButton: NavbarButton(
                          icon: Icons.arrow_back,
                          iconColor: Theme.of(context).primaryColor,
                          onPressed: () => {}),
                    ),
                  ))
            ],
          ),
        ));
  }
}
