import 'package:dct_shipper/extensions/hex_color.dart';
import 'package:dct_shipper/helpers/config.dart';
import 'package:flutter/material.dart';

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

  _LoginScreenState() {
    phoneNumber = "";
    password = "";
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: widget.parentScaffoldKey,
      body: SafeArea(
          child: Center(
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
                    hintText: 'Số điện thoại',
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
                    hintText: 'Mật khẩu',
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
                      // _setOrderComfirmWidget(true);
                      print(phoneNumber + password);
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: const Text('Đăng nhập',
                          style: TextStyle(color: Colors.white)),
                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
      )),
    );
  }
}
