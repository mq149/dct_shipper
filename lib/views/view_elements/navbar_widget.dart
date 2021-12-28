import '../../helpers/config.dart';
import '../../models/navbar_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavbarWidget extends StatelessWidget {
  NavbarButton? leftButton;
  NavbarButton? rightButton;
  String title;
  bool floatingTitle;
  NavbarWidget({
    Key? key,
    this.leftButton,
    this.rightButton,
    required this.title,
    this.floatingTitle = true,
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
                        color: leftButton?.iconColor ??
                            Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        leftButton!.onPressed();
                      }),
                )
              : const Padding(padding: EdgeInsets.all(20)),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 40,
              decoration: floatingTitle
                  ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: Config.getShadow())
                  : null,
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
                        color: rightButton?.iconColor ??
                            Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        rightButton!.onPressed();
                      }),
                )
              : const Padding(padding: EdgeInsets.all(20)),
        ]);
  }
}
