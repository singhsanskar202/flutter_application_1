import 'package:flutter/material.dart';
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

  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "images/login.png",
                fit: BoxFit.cover,
                height: 200,
              ),
              Text(
                "Welcome $name",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Username can't be empty";
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter your E-mail",
                            label: Text("E-mail")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6";
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      shadowColor: Colors.black,
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changebutton ? 70 : 10),
                      child: InkWell(
                        onTap: () => movetohome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          decoration: const BoxDecoration(),
                          width: changebutton ? 42 : 150,
                          height: 40,
                          alignment: Alignment.center,
                          child: changebutton
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.lightGreen,
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                        ),
                      ),
                    )
                    // ElevatedButton(
                    //   onPressed: () {
                    //

                    //   },
                    //   child: const Text("Login"),
                    //   style: TextButton.styleFrom(minimumSize: Size(100, 50)),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
