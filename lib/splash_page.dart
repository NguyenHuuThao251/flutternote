import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutternote/login/login_one_page.dart';
import 'package:flutternote/login/signup_page.dart';
import 'package:hive_flutter/adapters.dart';

import 'home_main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late double screenHeight, screenWidth;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 50),
      color: const Color.fromARGB(255, 65, 111, 113),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: const Text("Manager Money",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: screenWidth > 1200 ? 800 :(screenWidth > 500 ? 200 : 100)),
            child: Image.asset(
              "assets/images/img_splash.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: const Text("Let’s get started",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: const Text("Everything start from here",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white)),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 202, 66),
                borderRadius: BorderRadius.circular(30)),
            child: MaterialButton(
              onPressed: () {
                if(FirebaseAuth.instance.currentUser == null)  {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginOnePage()),
                  );
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeMain()));
                }

              },
              child: const Text("Login",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),

          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 213, 231, 212),
                borderRadius: BorderRadius.circular(30)),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
              child: const Text("Signed Up",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),

          ),
        ],
      ),
    );
  }
}
