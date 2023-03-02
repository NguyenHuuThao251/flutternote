import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/money_manager.dart';

class ChartDetail extends StatefulWidget {
  const ChartDetail({Key? key}) : super(key: key);

  @override
  State<ChartDetail> createState() => _ChartDetailState();
}

class _ChartDetailState extends State<ChartDetail> {
  final user = FirebaseAuth.instance.currentUser;
  List day = ['Day', 'Week', 'Month', 'Year'];
  int indexCurrent = 0;
  double totalIncome = 0;
  double totalExpense = 0;
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('note_money');

  final List<ManagerMoney> listMoneyManager = [];


  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    _getMoney();
    for(var i = 0; i < listMoneyManager.length; i++ ) {
      if(listMoneyManager[i].typepayment == "Income") {
        totalIncome += listMoneyManager[i].numberpayment;
      } else {
        totalExpense += listMoneyManager[i].numberpayment;
      }
    }
  }

  _getMoney() async {
    final snapshot = await FirebaseDatabase.instance
        .ref()
        .child('note_money')
        .child(user!.uid)
        .get();
    print(snapshot);
    final map = snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final money = ManagerMoney.fromMap(value);
      listMoneyManager.add(money);
    });
    print(listMoneyManager[0].numberpayment*10);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          Text(
            'Statistics',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        indexCurrent = index;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: indexCurrent != index
                            ? Color.fromARGB(255, 143, 141, 141)
                            : Color.fromARGB(255, 47, 125, 121),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        day[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 120,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Expense',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_downward_sharp,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
