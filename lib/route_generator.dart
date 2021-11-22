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
      // return HomeWidget(parentScaffoldKey: scaffoldKey);
      default:
        return SafeArea(child: Text('Screen Error'));
    }
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/Home':
      // return MaterialPageRoute(builder: (_) => HomeWidget());
      case '/Pages':
        return MaterialPageRoute(builder: (_) => PagesScreen(currentTab: args));
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
