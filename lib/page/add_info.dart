import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddInfor extends StatefulWidget {
  @override
  State<AddInfor> createState() => _AddInforState();
}

class _AddInforState extends State<AddInfor> {
  final time = TextEditingController();
  final nameMoney = TextEditingController();
  final numberMoney = TextEditingController();
  final contentMoney = TextEditingController();
  DateTime date = DateTime.now();
  late DatabaseReference dbRef;
  int selectedItem = 0;
  final List<String> _item = [
    "Food",
    "Transfer",
    "Transportation",
    "Education"
  ];

  final List<String> _itemImage = [
    "assets/icon/icon_add_food.svg",
    "assets/icon/icon_add_transfer.svg",
    "assets/icon/icon_add_transportation.svg",
    "assets/icon/icon_add_transportation.svg"
  ];

  final List<int> _itemInt = [0, 1, 2, 3];

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
      body: ListView(
        children: [
          Center(
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
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: Colors.black38,
                      ),
                    ),
                    child: DropdownButton<int>(
                        value: selectedItem,
                        items: _itemInt
                            .map((e) => DropdownMenuItem(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        _itemImage[e],
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Text(_item[e])
                                    ],
                                  ),
                                ),
                                value: e))
                            .toList(),
                        hint: Text('Payment Type'),
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        underline: Container(),
                        onChanged: ((value) {
                          setState(() {
                            selectedItem = value!;
                          });
                        }),
                        selectedItemBuilder: (BuildContext context) => _itemInt
                            .map(
                              (e) => Row(
                                children: [
                                  SvgPicture.asset(
                                    _itemImage[e],
                                    height: 20,
                                    width: 20,
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(_item[e]),
                                ],
                              ),
                            )
                            .toList()),
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
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: Colors.black38,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: date,
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2100));
                          if(newDate == null) return;
                          setState(() {
                            date = newDate;
                          });
                        },
                        child: Text('Date: ${date.year}/${date.month}/${date.day}'),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Map<String, String> money = {
                        'typepayment': _item[selectedItem],
                        'namepayment': nameMoney.text,
                        'numbermoney': numberMoney.text,
                        'contentmoney': contentMoney.text,
                        'date': date.toString()
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
        ],
      ),
    );
  }
}
