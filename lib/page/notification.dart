import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  @override
  State<Notify> createState() => _NotifyState();

}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Notifiy"),
      ),
    );
  }
}