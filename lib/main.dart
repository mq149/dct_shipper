import 'dart:io';

import 'package:google_fonts/google_fonts.dart';

import 'helpers/http_override.dart';
import 'package:dct_shipper/helpers/config.dart';

import 'route_generator.dart';
import 'package:flutter/material.dart';

import 'package:dct_shipper/repositories/user_repository.dart' as userRepo;

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/Pages',
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Config.primaryColor,
          accentColor: Config.accentColor,
          errorColor: Config.errorColor,
          unselectedWidgetColor: Config.unselectedWidgetColor,
          fontFamily: GoogleFonts.openSans().fontFamily,
          textTheme: const TextTheme(
              headline4: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              headline5: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              headline6: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              subtitle1: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.grey),
              subtitle2: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Colors.grey),
              caption: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
        ));
  }
}
