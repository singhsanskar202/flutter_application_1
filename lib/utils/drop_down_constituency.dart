import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constituency_list.dart';

class DropDownwidgetConstituency extends StatefulWidget {
  const DropDownwidgetConstituency({Key? key}) : super(key: key);

  @override
  State<DropDownwidgetConstituency> createState() => _DropDownwidgetState();
}

class _DropDownwidgetState extends State<DropDownwidgetConstituency> {
  String dropdownValue = 'Aligarh';

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
      items:
          ConstituencyList.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
