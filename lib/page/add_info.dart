import 'package:firebase_auth/firebase_auth.dart';
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
  var kindPayment = TextEditingController();
  DateTime date = DateTime.now();
  late DatabaseReference dbRef;
  int? selectedItem;
  String? typePayment;
  String? idUser;
  final List<String> _itemTextExpense = [
    "Grocery",
    "Gifts",
    "Bar & Cafe",
    "Health",
    "Commute",
    "Electronics",
    "Laundry",
    "Liqour",
    "Restaurant",
    "Flue",
    "Education",
    "Maitenance"
  ];

  final List<String> _itemImageExpense = [
    "assets/icon/icon_kind_groceries.svg",
    "assets/icon/icon_kind_gifts.svg",
    "assets/icon/icon_kind_cafe.svg",
    "assets/icon/icon_kind_health.svg",
    "assets/icon/icon_kind_transportation.svg",
    "assets/icon/icon_kind_electronics.svg",
    "assets/icon/icon_kind_laundry.svg",
    "assets/icon/icon_kind_liquor.svg",
    "assets/icon/icon_kind_restaurant.svg",
    "assets/icon/icon_kind_fuel.svg",
    "assets/icon/icon_kind_education.svg",
    "assets/icon/icon_kind_maintenance.svg"
  ];

  final List<String> _itemTextIncome = [
    "Salary",
    "Gifts",
    "Wages",
    "Interest",
    "Savings",
    "Allowance",
  ];

  final List<String> _itemImageIncome = [
    "assets/icon/icon_kind_money.svg",
    "assets/icon/icon_kind_gifts.svg",
    "assets/icon/icon_kind_donate.svg",
    "assets/icon/icon_kind_institute.svg",
    "assets/icon/icon_kind_savings.svg",
    "assets/icon/icon_kind_electronics.svg",
  ];

  final List<String> _listTypePayment = [
    "Income",
    "Expense",
  ];

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('note_money');
    idUser = FirebaseAuth.instance.currentUser!.uid;
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
                    child: DropdownButton<String>(
                        value: typePayment,
                        items: _listTypePayment
                            .map((e) => DropdownMenuItem(
                                child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(e)),
                                value: e))
                            .toList(),
                        hint: Text('Payment Type'),
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        underline: Container(),
                        onChanged: ((value) {
                          setState(() {
                            typePayment = value!;
                            selectedItem = null;
                            kindPayment.text = "";
                          });
                        }),
                        selectedItemBuilder: (BuildContext context) =>
                            _listTypePayment
                                .map(
                                  (e) => Row(
                                    children: [
                                      Text(e),
                                    ],
                                  ),
                                )
                                .toList()),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    onTap: () {
                      if (typePayment == "Income") {
                        _settingModalBottomSheetIncome(context);
                      } else {
                        _settingModalBottomSheetExpense(context);
                      }

                    },
                    readOnly: true,
                    showCursor: false,
                    keyboardType: TextInputType.none,
                    controller: kindPayment,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        hintText: "Payment kind",
                        fillColor: Colors.white,
                        filled: false,
                        contentPadding: EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: selectedItem != null
                              ? SvgPicture.asset(
                                  typePayment == "Income" ? _itemImageIncome[selectedItem!] : _itemImageExpense[selectedItem!],
                                  height: 20,
                                  width: 20,
                                )
                              : Icon(Icons.add),
                        )),
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
                          if (newDate == null) return;
                          setState(() {
                            date = newDate;
                          });
                        },
                        child: Text(
                            'Date: ${date.year}/${date.month}/${date.day}'),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Map<String, String> money = {
                        'typepayment': typePayment!,
                        'kindpayment': selectedItem != null
                            ? (typePayment == "Income" ? _itemTextIncome[selectedItem!] : _itemTextExpense[selectedItem!])
                            : "",
                        'namepayment': nameMoney.text,
                        'numbermoney': numberMoney.text,
                        'contentmoney': contentMoney.text,
                        'date': date.toString()
                      };

                      dbRef.child(idUser!).push().set(money);
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

  void _settingModalBottomSheetExpense(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 350,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: _itemImageExpense.length, // <-- required
              itemBuilder: (_, i) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedItem = i;
                    kindPayment.text = _itemTextExpense[i];
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          _itemImageExpense[i],
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(_itemTextExpense[i]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
  void _settingModalBottomSheetIncome(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 200,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: _itemImageIncome.length, // <-- required
              itemBuilder: (_, i) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedItem = i;
                    kindPayment.text = _itemTextIncome[i];
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          _itemImageIncome[i],
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(_itemTextIncome[i]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
