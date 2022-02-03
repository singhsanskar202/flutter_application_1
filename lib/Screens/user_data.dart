import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/party.dart';
import 'package:flutter_application_1/utils/constituency_list.dart';
import 'package:flutter_application_1/utils/drop_down_constituency.dart';
import 'package:flutter_application_1/utils/drop_down_religion.dart';
import 'package:flutter_application_1/utils/religion_list.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/data/user_data.dart';
import 'package:flutter_application_1/data/user_dao.dart';

int agevalue = 0;
int sexvalue = 0;
int religionval = 0;
String dropdownValuereligion = 'Hindu';
String dropdownValueplace = 'Aligarh';
String sex = "Male";
String age = '18-35';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final fb = FirebaseDatabase.instance;

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
            DropdownButton<String>(
              value: dropdownValueplace,
              icon: const Icon(Icons.arrow_downward),
              elevation: 24,
              style: const TextStyle(
                  fontFamily: "Kalam",
                  color: Colors.indigo,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValueplace = newValue!;
                });
              },
              items: ConstituencyList.items
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
            DropdownButton<String>(
              value: dropdownValuereligion,
              icon: const Icon(Icons.arrow_downward),
              elevation: 24,
              style: const TextStyle(
                  fontFamily: "Kalam",
                  color: Colors.indigo,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValuereligion = newValue!;
                  if (newValue == 'Muslim') {
                    religionval = 1;
                  } else if (newValue == 'Sikh') {
                    religionval = 2;
                  } else if (newValue == 'Christian') {
                    religionval = 3;
                  } else if (newValue == 'Jain') {
                    religionval = 4;
                  } else if (newValue == 'Any other')
                    religionval = 5;
                  else if (newValue == 'Prefer Not to say') religionval = 6;
                });
              },
              items: ReligionList.items
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (agevalue != 0 && sexvalue != 0) {
                    if (sexvalue == 1) {
                      sex = "Male";
                    } else if (sexvalue == 2) {
                      sex = 'Female';
                    }
                    if (agevalue == 1) {
                      age = '18-35';
                    } else if (agevalue == 2) {
                      age = '36-50';
                    } else if (agevalue == 3) {
                      age = '50+';
                    }
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
