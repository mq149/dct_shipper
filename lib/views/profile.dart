import 'package:dct_shipper/helpers/config.dart';
import 'package:dct_shipper/models/navbar_button.dart';
import 'package:dct_shipper/repositories/user_repository.dart' as userRepo;
import 'package:dct_shipper/views/view_elements/navbar_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState>? parentScaffoldKey;
  // ignore: prefer_const_constructors_in_immutables
  ProfileScreen({Key? key, this.parentScaffoldKey}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Config.primaryColor,
        key: widget.parentScaffoldKey,
        body: SafeArea(
            child: Stack(
          children: <Widget>[
            /// Top bar
            Positioned(
                top: 8,
                left: 0,
                right: 0,
                height: 50,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: NavbarWidget(
                    title: 'Profile',
                    leftButton: NavbarButton(
                        icon: Icons.arrow_back,
                        iconColor: Theme.of(context).primaryColor,
                        onPressed: () => {}),
                    rightButton: NavbarButton(
                        icon: Icons.edit,
                        iconColor: Theme.of(context).primaryColor,
                        onPressed: () => {}),
                  ),
                )),

            /// Profile information
            Positioned(
                top: 200,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                    padding: const EdgeInsets.only(top: 80),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: Config.getShadow2()),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(userRepo.currentUser.fullname,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
                                  Text(userRepo.currentUser.address.city)
                                ],
                              )),
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Phone number',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(userRepo.currentUser.phoneNumber),
                                  Text('Password',
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  Text('*********'),
                                  Text('Email address',
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  Text(userRepo.currentUser.email),
                                  Text('Social number',
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  Text(userRepo.currentShipper.socialId),
                                  Text('**********123'),
                                  Text('Address',
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  Text(userRepo.currentUser.address
                                      .getAddress()),
                                ]),
                          )
                        ],
                      ),
                    ))),

            /// Profile image
            Positioned(
                top: 70,
                left: 0,
                right: 0,
                child: Center(
                    child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: Config.getBorderRadius(),
                      boxShadow: Config.getShadow2()),
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/img/default-profile-image.png'),
                )))
          ],
        )));
  }
}
