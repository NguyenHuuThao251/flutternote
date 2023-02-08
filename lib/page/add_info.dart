import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class AddInfor extends StatefulWidget {
  @override
  State<AddInfor> createState() => _AddInforState();
}

class _AddInforState extends State<AddInfor> {
  final time = TextEditingController();
  final nameMoney = TextEditingController();
  final numberMoney = TextEditingController();
  final contentMoney = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('note_money');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Row(
          children: [
            Text("Add Information"),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Inserting data in Firebase Realtime Database',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: nameMoney,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Payment name',
                    hintText: 'Enter payment name'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: numberMoney,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Amount spent',
                    hintText: 'Enter amount spent'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: contentMoney,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Payment content',
                    hintText: 'Enter payment content'),
              ),
              MaterialButton(
                onPressed: () {
                  Map<String, String> money = {
                    'namepayment': nameMoney.text,
                    'numbermoney': numberMoney.text,
                    'contentmoney': contentMoney.text
                  };

                  dbRef.push().set(money);
                  Navigator.pop(context);
                },
                child: const Text('Insert Data'),
                color: Colors.blue,
                textColor: Colors.white,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
