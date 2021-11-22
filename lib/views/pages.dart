import 'package:dct_shipper/models/route_argument.dart';
import 'package:dct_shipper/route_generator.dart';
import 'package:dct_shipper/views/home.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PagesScreen extends StatefulWidget {
  dynamic currentTab;
  RouteArgument routeArgument;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late Widget currentPage;
  final screenMap = {
    '0': '/Home',
    '1': '/Order',
    '2': '/Notification',
    '3': '/Profile'
  };
  PagesScreen({Key? key, required this.currentTab, required this.routeArgument})
      : super(key: key) {
    if (currentTab != null) {
      if (currentTab is RouteArgument) {
        routeArgument = currentTab;
        currentTab = int.parse(currentTab.id);
      }
    } else {
      currentTab = 0;
    }
    currentTab = 0;
    currentPage = HomeScreen(parentScaffoldKey: scaffoldKey);
  }

  @override
  _PagesScreenState createState() => _PagesScreenState();
}

class _PagesScreenState extends State<PagesScreen> {
  void _onItemTapped(int index) {
    setState(() {
      widget.currentTab = index;
      widget.currentPage = RouteGenerator.generateScreen(
          widget.screenMap["$index"] ?? "",
          widget.scaffoldKey,
          widget.routeArgument);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      body: widget.currentPage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Container(
                height: 0,
              ),
              activeIcon: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color(0xff58B742),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: const Icon(Icons.home_outlined, color: Colors.white)),
              icon: const Icon(Icons.home, color: Colors.black)),
          BottomNavigationBarItem(
              title: Container(
                height: 0,
              ),
              activeIcon: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color(0xff58B742),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: const Icon(Icons.list_outlined, color: Colors.white)),
              icon: const Icon(Icons.list_alt_outlined, color: Colors.black)),
          BottomNavigationBarItem(
              title: Container(
                height: 0,
              ),
              activeIcon: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color(0xff58B742),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: const Icon(Icons.notifications_outlined,
                      color: Colors.white)),
              icon: const Icon(Icons.notifications, color: Colors.black)),
          BottomNavigationBarItem(
              title: Container(
                height: 0,
              ),
              activeIcon: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color(0xff58B742),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: const Icon(Icons.person_outline, color: Colors.white)),
              icon: const Icon(Icons.person, color: Colors.black)),
        ],
        currentIndex: widget.currentTab,
        // selectedItemColor: const Color(0xff58B742),
        // unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
