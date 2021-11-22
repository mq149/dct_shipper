import 'package:dct_shipper/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/Order',
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        // localizationsDelegates: [
        //   S.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        // ],
        // supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.green,
          // accentColor: const Color(0xFFC4C4C4),
          fontFamily: 'OpenSans',
          textTheme: const TextTheme(
              headline4: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              headline5: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              headline6: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              subtitle1: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey),
              subtitle2: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey)),
        ));
  }
}
