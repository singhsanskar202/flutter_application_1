import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Results.dart';
import 'package:flutter_application_1/Screens/auth.dart';
import 'package:flutter_application_1/Screens/graph.dart';
import 'package:flutter_application_1/Screens/login_page.dart';
import 'package:flutter_application_1/Screens/party.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/login_page.dart';
import 'Screens/main_page.dart';
import 'Screens/user_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          fontFamily: GoogleFonts.kalam().fontFamily,
          primaryTextTheme: GoogleFonts.kalamTextTheme()),
      themeMode: ThemeMode.light,

      darkTheme: ThemeData(brightness: Brightness.light),
      // initialRoute: "/",
      home: HomePage(),
      routes: {
        // "/": (context) => const LoginPage(),
        MyRoutes.homeroute: (context) => HomePage(),
        MyRoutes.loginroute: (context) => const LoginPage(),
        MyRoutes.userdataroute: (context) => UserPage(),
        MyRoutes.partyroute: (context) => SelectParty(),
        MyRoutes.resultroute: (context) => ResultPage(),
        MyRoutes.graphroute: (context) => graph()
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) => StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const UserPage();
        } else {
          return const Auth();
          // return MaterialApp(
          //   theme: ThemeData(
          //     inputDecorationTheme: InputDecorationTheme(
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(30))),
          //     outlinedButtonTheme: OutlinedButtonThemeData(
          //       style: ButtonStyle(
          //         padding: MaterialStateProperty.all<EdgeInsets>(
          //           const EdgeInsets.all(24),
          //         ),
          //         textStyle:
          //             MaterialStateProperty.all(const TextStyle(fontSize: 20)),
          //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //           RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(30.0)),
          //         ),
          //         backgroundColor:
          //             MaterialStateProperty.all<Color>(Colors.white),
          //         foregroundColor:
          //             MaterialStateProperty.all<Color>(Colors.black),
          //       ),
          //     ),
          //   ),
          //   home: const SignInScreen(
          //     providerConfigs: [
          //       EmailProviderConfiguration(),
          //     ],
          //   ),
          // );
        }
      });
}
