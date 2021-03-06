import 'package:dct_shipper/controllers/login_controller.dart';
import 'package:dct_shipper/helpers/config.dart';
import 'package:dct_shipper/helpers/helper.dart';
import 'package:dct_shipper/views/view_elements/circular_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:dct_shipper/repositories/user_repository.dart' as user_repo;

class LoginScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState>? parentScaffoldKey;
  // ignore: prefer_const_constructors_in_immutables
  LoginScreen({Key? key, this.parentScaffoldKey}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String phoneNumber;
  late String password;
  late LoginController _con;

  _LoginScreenState() {
    phoneNumber = "";
    password = "";
    _con = LoginController();
  }

  @override
  void initState() {
    _con.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: widget.parentScaffoldKey,
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              // height: 200,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white, // HexColor.fromHex('#E9E9E9'),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: Config.getTextFieldShadow()),
                    child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: InputBorder.none,
                        hintText: 'S??? ??i???n tho???i',
                      ),
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white, // HexColor.fromHex('#E9E9E9'),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: Config.getTextFieldShadow()),
                    child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: InputBorder.none,
                        hintText: 'M???t kh???u',
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: Config.getShadow()),
                      child: TextButton(
                        onPressed: () {
                          _con.login(
                              phoneNumber,
                              password,
                              (success) => {
                                    if (success)
                                      {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor:
                                                    Config.primaryColor,
                                                content: const Text(
                                                    '????ng nh???p th??nh c??ng',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                        Navigator.pushNamed(context, '/Pages'),
                                      }
                                    else
                                      {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor:
                                                    Config.primaryColor,
                                                content: const Text(
                                                    '????ng nh???p kh??ng th??nh c??ng, vui l??ng ki???m tra l???i',
                                                    style: TextStyle(
                                                        color: Colors.white)))),
                                      }
                                  });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: const Text('????ng nh???p',
                              style: TextStyle(color: Colors.white)),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _con.isLoading ? const CircularLoadingWidget() : Container(),
        ],
      )),
    );
  }
}
