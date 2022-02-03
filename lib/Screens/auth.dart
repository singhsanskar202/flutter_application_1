import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/user_data.dart';
import 'package:flutterfire_ui/auth.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
                providerConfigs: const [EmailProviderConfiguration()],
                headerBuilder: (context, constraints, _) {
                  return Center(
                    child: Image.asset(
                      "images/login.png",
                      height: 200,
                      width: double.infinity,
                    ),
                  );
                });
          }

          return const UserPage();
        });
  }
}
