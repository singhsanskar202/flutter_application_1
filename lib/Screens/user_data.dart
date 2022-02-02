import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/utils/drop_down_constituency.dart';
import 'package:flutter_application_1/utils/drop_down_religion.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int agevalue = 0;
  int sexvalue = 0;
  int religionval = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provide Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/hi.png",
              fit: BoxFit.cover,
              // width: double.infinity,
              height: 300,
            ),
            const Text(
              "Select your Constituency",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: DropDownwidgetConstituency(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Select your Sex",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Radio(
                            value: 1,
                            groupValue: sexvalue,
                            onChanged: (value) => setState(() => sexvalue = 1)),
                      ),
                      const Text(
                        "Male",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Transform.scale(
                  scale: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1.2,
                          child: Radio(
                              value: 2,
                              groupValue: sexvalue,
                              onChanged: (value) =>
                                  setState(() => sexvalue = 2)),
                        ),
                        const Text(
                          "Female",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Select your Age",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Radio(
                            value: 1,
                            groupValue: agevalue,
                            onChanged: (value) => setState(() => agevalue = 1)),
                      ),
                      const Text(
                        "18-35",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Radio(
                            value: 2,
                            groupValue: agevalue,
                            onChanged: (value) => setState(() => agevalue = 2)),
                      ),
                      const Text(
                        "36-50",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Radio(
                            value: 3,
                            groupValue: agevalue,
                            onChanged: (value) => setState(() => agevalue = 3)),
                      ),
                      const Text(
                        "50+",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Select your Religion",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const DropDownwidgetReligion(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (agevalue != 0 && sexvalue != 0) {
                    Navigator.pushNamed(context, MyRoutes.partyroute);
                  } else if (agevalue == 0 && sexvalue == 0) {
                    Alert(
                            context: context,
                            title: "Age and Sex cannot be empty",
                            desc: "Please select age and sex")
                        .show();
                  } else if (agevalue == 0) {
                    Alert(
                            context: context,
                            title: "Age cannot be empty",
                            desc: "Please select Age")
                        .show();
                  } else if (sexvalue == 0) {
                    Alert(
                            context: context,
                            title: "Sex cannot be empty",
                            desc: "Please select Sex")
                        .show();
                  }
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(250, 50)),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
