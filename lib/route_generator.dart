import 'package:dct_shipper/views/home.dart';
import 'package:dct_shipper/views/order.dart';

import '../models/route_argument.dart';
import 'package:flutter/material.dart';

import 'views/pages.dart';

class RouteGenerator {
  static Widget generateScreen(String routeName,
      GlobalKey<ScaffoldState> scaffoldKey, RouteArgument args) {
    switch (routeName) {
      case '/':
      // return HomeWidget(parentScaffoldKey: scaffoldKey);
      case '/Home':
        return HomeScreen(parentScaffoldKey: scaffoldKey);
      case '/Order':
        return OrderScreen(parentScaffoldKey: scaffoldKey);
      default:
        return const SafeArea(child: Text('Screen Error'));
    }
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/Home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/Pages':
        return MaterialPageRoute(
            builder: (_) => PagesScreen(
                  currentTab: args,
                  routeArgument: RouteArgument(id: "", heroTag: ""),
                ));

      case '/Order':
        return MaterialPageRoute(builder: (_) => OrderScreen());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
