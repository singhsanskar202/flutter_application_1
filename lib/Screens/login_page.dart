import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/auth.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  bool changebutton = false;
  String name = "User";
  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });

      {
        await Future.delayed(const Duration(seconds: 1));
        await Navigator.pushNamed(context, MyRoutes.userdataroute);
        setState(() {
          changebutton = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Auth();
  }
}
