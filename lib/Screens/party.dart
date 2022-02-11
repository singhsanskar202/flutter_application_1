import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/user_data.dart';
import 'package:flutter_application_1/data/user_dao.dart';
import 'package:flutter_application_1/data/user_data_toshow.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

int partyval = 0;
String party = 'BJP';

class SelectParty extends StatelessWidget {
  final userDao = UserDao();

  SelectParty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Party Prefernce"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [Mystateful()],
        ),
      ),
    );
  }
}

class Mystateful extends StatefulWidget {
  const Mystateful({Key? key}) : super(key: key);

  @override
  _MystatefulState createState() => _MystatefulState();
}

class _MystatefulState extends State<Mystateful> {
  showAlert() async {
    Alert(
            context: context,
            title: "No Party Selected",
            desc: "Please Select Any Party")
        .show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                      scale: 1.2,
                      child: Radio(
                          value: 1,
                          groupValue: partyval,
                          onChanged: (value) => setState(() => partyval = 1))),
                  Column(
                    children: [
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset("assets/images/yogi.jpeg")),
                      const Text("BJP")
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Row(
                children: [
                  Transform.scale(
                      scale: 1.2,
                      child: Radio(
                          value: 2,
                          groupValue: partyval,
                          onChanged: (value) => setState(() => partyval = 2))),
                  Column(
                    children: [
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset("assets/images/gandhi.jpeg")),
                      const Text("Congress")
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Transform.scale(
                      scale: 1.2,
                      child: Radio(
                          value: 3,
                          groupValue: partyval,
                          onChanged: (value) => setState(() => partyval = 3))),
                  Column(
                    children: [
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset("assets/images/maya.jpeg")),
                      const Text("Bahujan samaj party")
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 30,
                height: 30,
              ),
              Row(
                children: [
                  Transform.scale(
                      scale: 1.2,
                      child: Radio(
                          value: 4,
                          groupValue: partyval,
                          onChanged: (value) => setState(() => partyval = 4))),
                  Column(
                    children: [
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset("assets/images/akhilesh.jpeg")),
                      const Text("Samajwadi Party")
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Transform.scale(
                      scale: 1.2,
                      child: Radio(
                          value: 5,
                          groupValue: partyval,
                          onChanged: (value) => setState(() => partyval = 5))),
                  Column(
                    children: [
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset("assets/images/apna.png")),
                      const Text("Apna Dal")
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Row(
                children: [
                  Transform.scale(
                      scale: 1.2,
                      child: Radio(
                          value: 6,
                          groupValue: partyval,
                          onChanged: (value) => setState(() => partyval = 6))),
                  Column(
                    children: [
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset("assets/images/owasi.jpeg")),
                      const Text("AIMIM")
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Radio(
                        value: 7,
                        groupValue: partyval,
                        onChanged: (value) => setState(() => partyval = 7)),
                  ),
                  Column(
                    children: [
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset("assets/images/hi.png")),
                      const Text("Others")
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Radio(
                        value: 8,
                        groupValue: partyval,
                        onChanged: (value) => setState(() => partyval = 8)),
                  ),
                  Column(
                    children: [
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset("assets/images/nota.png")),
                      const Text("NOTA")
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              if (partyval != 0) {
                if (partyval == 1) {
                  party = "BJP";
                }
                if (partyval == 2) {
                  party = "INC";
                }
                if (partyval == 3) {
                  party = "BSP";
                }
                if (partyval == 4) {
                  party = "SP";
                }
                if (partyval == 5) {
                  party = "AP";
                }
                if (partyval == 6) {
                  party = "AIMIM";
                }
                if (partyval == 7) {
                  party = "others";
                }
                if (partyval == 8) {
                  party = "nota";
                }
                // _senddata();
                Navigator.pushNamed(context, MyRoutes.resultroute);
              } else {
                showAlert();
              }
            },
            style: ElevatedButton.styleFrom(fixedSize: const Size(250, 50)),
            child: const Text(
              "Show Results",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          height: 70,
        )
      ],
    );
  }
}

void _senddata() {
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
      FirebaseFirestore.instance.collection('users').snapshots();

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// final CollectionReference _mainCollection = _firestore.collection('users');
//   // final snapShot = await Firestore.instance.collection('cart').document("LIihBLtbfuJ8Dy640DPd").get();

//   final data = UserPref(
//       DateTime.now(),
//       dropdownValueplace.toString(),
//       sexvalue.toString(),
//       agevalue.toString(),
//       religionval.toString(),
//       partyval.toString());

//   UserDao().saveMessage(data);
}
