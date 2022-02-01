import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "images/login.png",
              fit: BoxFit.cover,
              height: 200,
            ),
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter your E-mail", label: Text("E-mail")),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter your Password",
                        label: Text("Password")),
                    validator: (value) {
                      if (value!.isEmpty == false) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeroute);
                    },
                    child: const Text("Login"),
                    style: TextButton.styleFrom(minimumSize: Size(100, 50)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
