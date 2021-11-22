import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState>? parentScaffoldKey;
  // ignore: prefer_const_constructors_in_immutables
  HomeScreen({Key? key, this.parentScaffoldKey}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: widget.parentScaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(children: <Widget>[]),
    );
  }
}
