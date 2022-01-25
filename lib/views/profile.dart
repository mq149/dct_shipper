import 'package:dct_shipper/controllers/profile_controller.dart';
import 'package:dct_shipper/helpers/config.dart';
import 'package:dct_shipper/models/navbar_button.dart';
import 'package:dct_shipper/repositories/user_repository.dart' as user_repo;
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
  late ProfileController _con;

  _ProfileScreenState() {
    _con = ProfileController();
  }

  @override
  void initState() {
    _con.getShipper();
    _con.addListener(() {
      setState(() {});
    });
    super.initState();
  }

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
                      leftButton: null,
                      // NavbarButton(
                      //     icon: Icons.arrow_back,
                      //     iconColor: Theme.of(context).primaryColor,
                      //     onPressed: () => {}),
                      rightButton: null
                      // NavbarButton(
                      //     icon: Icons.edit,
                      //     iconColor: Theme.of(context).primaryColor,
                      //     onPressed: () => {}),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                            // height: 50,
                            padding: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: Config.getShadow2()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(user_repo.currentShipper.fullname,
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(user_repo.currentShipper.address.city)
                              ],
                            )),
                        Expanded(
                            // padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Giới tính',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(user_repo.currentShipper.gender),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Ngày sinh',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(user_repo.currentShipper
                                      .getBirthDate()
                                      .toString()),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Số điện thoại',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(user_repo.currentShipper.phoneNumber),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text('Mật khẩu',
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  const Text('*********'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text('Địa chỉ email',
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  Text(user_repo.currentShipper.email),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text('CMND/CCCD/Hộ chiếu',
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  Text(user_repo.currentShipper.socialId),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text('Địa chỉ',
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  Text(user_repo.currentShipper.address
                                      .getAddress()),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text('Dòng xe',
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  Text(user_repo.currentShipper.vehicleName),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text('Biển số',
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  Text(user_repo.currentShipper.plateNumber),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: Config.getShadow()),
                                      child: TextButton(
                                        onPressed: () {
                                          _con.logOut();
                                          Navigator.pushReplacementNamed(
                                              context, "/Login");
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  backgroundColor:
                                                      Config.primaryColor,
                                                  content: const Text(
                                                      'Bạn đã đăng xuất',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white))));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: const Text('Đăng xuất',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0)),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Theme.of(context)
                                                        .errorColor)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ]),
                          ),
                        ))
                      ],
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
