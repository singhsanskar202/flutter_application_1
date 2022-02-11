import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/user_data.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(24),
            ),
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
        ),
      ),
      home: SignInScreen(
        providerConfigs: const [
          EmailProviderConfiguration(),
          GoogleProviderConfiguration(
              clientId:
                  '683642339193-ero8aljkfh3don9eiak9ed545odsankf.apps.googleusercontent.com'),
        ],
        subtitleBuilder: (context, action) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              action == AuthAction.signIn
                  ? 'Welcome to Voting App ! Please sign in to continue.'
                  : 'Welcome to Voting App ! Please create an account to continue',
            ),
          );
        },
        footerBuilder: (context, _) {
          return const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              'By signing in, you agree to our terms and conditions.',
              style: TextStyle(color: Colors.grey),
            ),
          );
        },
        sideBuilder: (context, constraints) {
          return Image.asset(
            "assets/images/hi.png",
            fit: BoxFit.cover,
          );
        },
        headerBuilder: (context, constraints, shrinkOffset) {
          return Image.asset(
            "assets/images/hi.png",
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }
}
