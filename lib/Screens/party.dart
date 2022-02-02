import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SelectParty extends StatelessWidget {
  const SelectParty({Key? key}) : super(key: key);

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
  int partyval = 0;
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
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
                        width: 200,
                        height: 200,
                        child: Image.asset("images/yogi.jpeg")),
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
                        width: 200,
                        height: 200,
                        child: Image.asset("images/gandhi.jpeg")),
                    const Text("Indian National Congress")
                  ],
                )
              ],
            ),
          ],
        ),
        Row(
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
                        width: 200,
                        height: 200,
                        child: Image.asset("images/maya.jpeg")),
                    const Text("Bahujan samaj party")
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
                        value: 4,
                        groupValue: partyval,
                        onChanged: (value) => setState(() => partyval = 4))),
                Column(
                  children: [
                    SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset("images/akhilesh.jpeg")),
                    const Text("Samajwadi Party")
                  ],
                )
              ],
            ),
          ],
        ),
        Row(
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
                        width: 200,
                        height: 200,
                        child: Image.asset("images/apna.png")),
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
                        width: 200,
                        height: 200,
                        child: Image.asset("images/owasi.jpeg")),
                    const Text("AIMIM")
                  ],
                )
              ],
            ),
          ],
        ),
        Row(
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
                        width: 200,
                        height: 200,
                        child: Image.asset("images/hi.png")),
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
                        width: 200,
                        height: 200,
                        child: Image.asset("images/nota.png")),
                    const Text("NOTA")
                  ],
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              if (partyval != 0) {
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
