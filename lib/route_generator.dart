import 'package:dct_shipper/views/login.dart';
import 'package:dct_shipper/views/profile.dart';
import 'views/home.dart';
import 'views/order.dart';
import 'views/order_detail.dart';
import '../models/route_argument.dart';
import 'package:flutter/material.dart';
import 'views/pages.dart';
import 'package:dct_shipper/repositories/user_repository.dart' as user_repo;

class RouteGenerator {
  static Widget generateScreen(String routeName,
      GlobalKey<ScaffoldState> scaffoldKey, RouteArgument args) {
    if (!user_repo.userAuthenticated()) {
      return LoginScreen(parentScaffoldKey: scaffoldKey);
    }
    switch (routeName) {
      case '/':
      case '/Home':
        return HomeScreen(parentScaffoldKey: scaffoldKey);
      case '/Order':
        return OrderScreen(parentScaffoldKey: scaffoldKey);

      case '/Profile':
        return ProfileScreen(parentScaffoldKey: scaffoldKey);
      case '/Login':
        return LoginScreen(parentScaffoldKey: scaffoldKey);
      default:
        return const SafeArea(child: Text('Screen Error'));
    }
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    if (!user_repo.userAuthenticated()) {
      return MaterialPageRoute(builder: (_) => LoginScreen());
    }
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
      case '/OrderDetail':
        return MaterialPageRoute(
            builder: (_) =>
                OrderDetailScreen(routeArgument: args as RouteArgument));
      case '/Profile':
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case '/Login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
