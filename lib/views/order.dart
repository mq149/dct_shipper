import 'package:dct_shipper/models/navbar_button.dart';
import 'package:dct_shipper/models/order.dart';
import 'package:dct_shipper/views/view_elements/navbar_widget.dart';
import 'package:dct_shipper/views/view_elements/order_list_widget.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState>? parentScaffoldKey;
  // ignore: prefer_const_constructors_in_immutables
  OrderScreen({Key? key, this.parentScaffoldKey}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order> orders = [
    Order(
        id: '#1',
        storeName: 'Co-op Mart',
        storeAddress: '227 Nguyen Van Cu',
        storeLatitude: 0.0,
        storeLongitude: 0.0),
    Order(
        id: '#2',
        storeName: 'Co-op Mart',
        storeAddress: '227 Nguyen Van Cu',
        storeLatitude: 0.0,
        storeLongitude: 0.0),
    Order(
        id: '#3',
        storeName: 'Co-op Mart',
        storeAddress: '227 Nguyen Van Cu',
        storeLatitude: 0.0,
        storeLongitude: 0.0),
    Order(
        id: '#4',
        storeName: 'Co-op Mart',
        storeAddress: '227 Nguyen Van Cu',
        storeLatitude: 0.0,
        storeLongitude: 0.0),
    Order(
        id: '#5',
        storeName: 'Co-op Mart',
        storeAddress: '227 Nguyen Van Cu',
        storeLatitude: 0.0,
        storeLongitude: 0.0),
    Order(
        id: '#6',
        storeName: 'Co-op Mart',
        storeAddress: '227 Nguyen Van Cu',
        storeLatitude: 0.0,
        storeLongitude: 0.0),
    Order(
        id: '#7',
        storeName: 'Co-op Mart',
        storeAddress: '227 Nguyen Van Cu',
        storeLatitude: 0.0,
        storeLongitude: 0.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      key: widget.parentScaffoldKey,
      body: Stack(
        children: <Widget>[
          Column(children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(color: Colors.grey.withOpacity(0.3)),
            ),
            Expanded(
              flex: 1,
              child: OrderListWidget(
                orders: orders,
              ),
            )
          ]),
          Positioned(
              top: 24,
              left: 0,
              right: 0,
              height: 50,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: NavbarWidget(
                  title: 'Order',
                  leftButton: NavbarButton(
                      icon: Icons.arrow_back,
                      iconColor: Theme.of(context).primaryColor,
                      onPressed: () => {}),
                ),
              ))
        ],
      ),
    );
  }
}
