import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Mystateful(),
    );
  }
}

class Mystateful extends StatefulWidget {
  const Mystateful({Key? key}) : super(key: key);

  @override
  _MystatefulState createState() => _MystatefulState();
}

class _MystatefulState extends State<Mystateful> {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [],
        // read about it in the PieChartData section
      ),
      swapAnimationDuration: Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, // Optional
    );
  }
}
