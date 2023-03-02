import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutternote/components/money_title.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutternote/page/food_recipe.dart';

import '../profile/profile_page.dart';
import 'currency_converter.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? idUser;
  String? userName = "You";
  String? imageUrl;
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

  final List<Widget> screen = [
    CurrencyConverter(),
    FoodRecipe(),
    CurrencyConverter(),
    CurrencyConverter(),
    CurrencyConverter(),
    CurrencyConverter(),
    CurrencyConverter(),
    CurrencyConverter(),
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    idUser = FirebaseAuth.instance.currentUser!.uid;
    if (FirebaseAuth.instance.currentUser!.displayName != null) {
      userName = FirebaseAuth.instance.currentUser!.displayName;
      imageUrl = FirebaseAuth.instance.currentUser?.photoURL;
    }
    dbRef = FirebaseDatabase.instance.ref().child('note_money').child(idUser!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildWelcome(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 20,
                child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  alignment: Alignment.center,
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.arrow_right),
                  style: ButtonStyle(

                  ),
                ),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 20,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: Image.network(
                  imageUrl != null ? imageUrl! : 'https://canthoplus.com/wp-content/uploads/2022/04/2-tinh-nghe-an-thuoc-mien-nao-cua-viet-nam-bien-dien-thanh.jpg',
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome,",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
              Text(
                userName!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              )
            ],
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => screen[index]),
                    );
                  },
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

  FirebaseAnimatedList buildListMoney() {
    return FirebaseAnimatedList(
      shrinkWrap: true,
      query: dbRef,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
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
    );
  }
}
