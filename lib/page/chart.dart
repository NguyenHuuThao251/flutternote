import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutternote/model/money_manager.dart';

class Chart extends StatefulWidget {
  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  int indexCurrent = 0;
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('note_money');

  final List<ManagerMoney> listMoneyManager = [];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    _getMoney();
  }

  _getMoney() async {
    final snapshot = await FirebaseDatabase.instance.ref().child('note_money').get();
    print(snapshot);
    final map = snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final money = ManagerMoney.fromMap(value);
      listMoneyManager.add(money);
    });
    print(listMoneyManager.length);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Statistics',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
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
                          borderRadius: BorderRadius.circular(8)
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }


}
