import 'package:dct_shipper/models/route_argument.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PagesScreen extends StatefulWidget {
  dynamic currentTab;
  late RouteArgument routeArgument;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PagesScreen({Key? key, required this.currentTab}) : super(key: key) {
    if (currentTab != null) {
      if (currentTab is RouteArgument) {
        routeArgument = currentTab;
        currentTab = int.parse(currentTab.id);
      }
    } else {
      currentTab = 0;
    }
    currentTab = 0;
  }

  @override
  _PagesScreenState createState() => _PagesScreenState();
}

class _PagesScreenState extends State<PagesScreen> {
  void _onItemTapped(int index) {
    setState(() {
      widget.currentTab = index;
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
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Container(
                height: 5,
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
                height: 5,
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
                height: 5,
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
                height: 5,
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
