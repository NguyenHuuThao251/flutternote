import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  @override
  State<Chart> createState() => _ChartState();

}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Chart"),
      ),
    );
  }
}