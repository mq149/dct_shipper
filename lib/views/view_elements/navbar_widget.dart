import 'package:dct_shipper/helpers/config.dart';
import 'package:dct_shipper/models/navbar_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavbarWidget extends StatelessWidget {
  NavbarButton? leftButton;
  NavbarButton? rightButton;
  String title;
  NavbarWidget({
    Key? key,
    this.leftButton,
    this.rightButton,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          leftButton != null
              ? Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: Config.getShadow()),
                  child: IconButton(
                      icon: Icon(
                        leftButton?.icon,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () => {}),
                )
              : const Padding(padding: EdgeInsets.all(20)),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: Config.getShadow()),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              )),
          rightButton != null
              ? Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: Config.getShadow()),
                  child: IconButton(
                      icon: Icon(
                        rightButton?.icon,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () => {}),
                )
              : const Padding(padding: EdgeInsets.all(20)),
        ]);
  }
}
