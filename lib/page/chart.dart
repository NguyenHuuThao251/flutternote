import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/money_manager.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:fl_chart/fl_chart.dart';

class Chart extends StatefulWidget {
  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = Color(0xff1a73e8);
  final _unselectedColor = Color(0xff5f6368);
  final _tabs = [
    Tab(text: 'Day'),
    Tab(text: 'Week'),
    Tab(text: 'Month'),
    Tab(text: 'Year'),
  ];

  final _iconTabs = [
    Tab(icon: Icon(Icons.home)),
    Tab(icon: Icon(Icons.search)),
    Tab(icon: Icon(Icons.settings)),
    Tab(icon: Icon(Icons.settings)),
  ];

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
    _tabController = TabController(length: 4, vsync: this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    _getMoney();
    for (var i = 0; i < listMoneyManager.length; i++) {
      if (listMoneyManager[i].typepayment == "Income") {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Half yearly sales analysis'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<ManagerMoney, String>>[
                LineSeries<ManagerMoney, String>(
                    dataSource: listMoneyManager,
                    xValueMapper: (ManagerMoney sales, _) => sales.date ,
                    yValueMapper: (ManagerMoney sales, _) => sales.numberpayment,
                    name: 'Sales',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ],
            ),
            _barChart(),
            _columnChart(),
          ],
        ),
        buildTablayout(),
      ],
    ));
  }

  Container buildTablayout() {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          TabBar(
            controller: _tabController,
            tabs: _tabs,
            unselectedLabelColor: Colors.black,
            labelColor: _selectedColor,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              color: _selectedColor.withOpacity(0.2),
            ),
          ),
        ]
            .map((item) => Column(
                  children: [
                    item,
                    const Divider(
                      color: Colors.transparent,
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
  Widget _barChart() {
    return SfCartesianChart(
        title: ChartTitle(text: "Bar Chart"),
        series: <ChartSeries>[
          // Renders bar chart
          BarSeries<ManagerMoney, double>(
              dataSource: listMoneyManager,
              xValueMapper: (ManagerMoney sales, _) => 0,
              yValueMapper: (ManagerMoney sales, _) => sales.numberpayment)
        ]);
  }
  Widget _columnChart() {
    return SfCartesianChart(
      title: ChartTitle(text: "Column Chart"),
      series: <ChartSeries>[
        ColumnSeries<ManagerMoney, double>(
            dataSource: listMoneyManager,
            xValueMapper: (ManagerMoney sales, _) => 0,
            yValueMapper: (ManagerMoney sales, _) => sales.numberpayment)
      ]);
  }
}
