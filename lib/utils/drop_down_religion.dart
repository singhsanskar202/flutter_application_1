import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownwidgetReligion extends StatefulWidget {
  const DropDownwidgetReligion({Key? key}) : super(key: key);

  @override
  State<DropDownwidgetReligion> createState() => _DropDownwidgetState();
}

class _DropDownwidgetState extends State<DropDownwidgetReligion> {
  String dropdownValue = 'Hindu';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
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
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        "Hindu",
        "Muslim",
        "Sikh",
        "Christian",
        "Jain",
        "Any other",
        "Prefer Not to say"
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
