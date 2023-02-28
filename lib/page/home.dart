import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutternote/components/money_title.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? idUser;
  late Query dbRef;
  List<String> listImage = [
    "assets/icon/icon_change.svg",
    "assets/icon/icon_transfer.svg",
    "assets/icon/icon_incoming.svg",
    "assets/icon/icon_recei.svg",
    "assets/icon/icon_change.svg",
    "assets/icon/icon_transfer.svg",
    "assets/icon/icon_incoming.svg",
    "assets/icon/icon_recei.svg",
  ];

  List<String> listTitle = [
    "Change",
    "Transfer",
    "Incoming",
    "Receipt",
    "Change",
    "Transfer",
    "Incoming",
    "Receipt",
  ];

  void deleteTask(int index) {
    setState(() {});
  }

  void onChanged(int index) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    idUser = FirebaseAuth.instance.currentUser!.uid;
    dbRef = FirebaseDatabase.instance.ref().child('note_money').child(idUser!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildWelcome(),
          buildEasyOperations(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Previous Transactions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          buildListMoney(),
        ],
      ),
    );
  }

  Container buildWelcome() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome,",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
          Text(
            "Indigo Violet",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.grey,
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 10),
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Image.asset("assets/images/Card.png"),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Image.asset("assets/images/Card.png"),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Image.asset("assets/images/Card.png"),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Image.asset("assets/images/Card.png"),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Image.asset("assets/images/Card.png"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildEasyOperations() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Easy Operation",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
          ),
          Container(
            height: 90,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listImage.length.toInt(),
              itemBuilder: (context, index) {
                return MaterialButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(listImage[index]),
                      Text(listTitle[index])
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container buildListMoney() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: FirebaseAnimatedList(
        shrinkWrap: true,
        query: dbRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map student = snapshot.value as Map;
          student['key'] = snapshot.key;
          return MoneyTitle(
            namePayment: student['namepayment'],
            numberPayment: student['numbermoney'],
            typePayment: student['typepayment'],
            kindPayment: student['kindpayment'],
            onChanged: (value) => onChanged(index),
            deleteFunction: (context) => deleteTask(index),

          );
        },
      ),
    );
  }
}
