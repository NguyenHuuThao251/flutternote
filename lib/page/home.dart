import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutternote/components/money_title.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Query dbRef = FirebaseDatabase.instance.ref().child('note_money');

  void deleteTask(int index) {
    setState(() {});
  }

  void onChanged(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      child: FirebaseAnimatedList(
        query: dbRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map student = snapshot.value as Map;
          student['key'] = snapshot.key;
          return MoneyTitle(
              namePayment: student['namepayment'],
              numberPayment: student['numbermoney'],
              onChanged: (value) => onChanged(index),
              deleteFunction: (context) => deleteTask(index));
        },
      ),
    )
    );
  }
}
