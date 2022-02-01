import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/login_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/login_page.dart';
import 'Screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      //home: HomePage(),
      theme: ThemeData(
          fontFamily: GoogleFonts.lato().fontFamily,
          primaryTextTheme: GoogleFonts.latoTextTheme()),
      themeMode: ThemeMode.light,

      darkTheme: ThemeData(brightness: Brightness.light),
      // initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeroute: (context) => const HomePage(),
        MyRoutes.loginroute: (context) => const LoginPage()
      },
    );
  }
}
