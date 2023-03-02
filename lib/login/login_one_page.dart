import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutternote/home_main.dart';

import 'authentication.dart';
class LoginOnePage extends StatefulWidget {
  const LoginOnePage({super.key});

  @override
  State<LoginOnePage> createState() => _LoginOnePageState();
}

class _LoginOnePageState extends State<LoginOnePage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late double screenHeight, screenWidth;
  bool _obscureText = false;

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth > 500 ? 30 : 10),
        child: ListView(
          shrinkWrap: true,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  padding: EdgeInsets.all(20),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_backspace_sharp,
                    size: screenWidth > 400 ? 60.0 : 30.0,
                  )),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: const Text("Welcome back",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: const Text("Enter your credential to continue",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                controller: _emailController,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: "Email or Username",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_box_outlined)),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                controller: _passwordController,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _toggle();
                      },
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    )),
                keyboardType: TextInputType.text,
                obscureText: _obscureText,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                  textAlign: TextAlign.right,
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 202, 66),
                  borderRadius: BorderRadius.circular(30)),
              child: MaterialButton(
                onPressed: () {
                  AuthenticationHelper()
                      .signIn(email: _emailController.text, password: _passwordController.text)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomeMain()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result),
                        ),
                      );
                    }
                  });
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
                  color: const Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(30)),
              child: MaterialButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: SvgPicture.asset("assets/icon/icon_apple.svg"),
                    ),
                    const Text("Log in using Apple",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 213, 231, 212),
                  borderRadius: BorderRadius.circular(30)),
              child: MaterialButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: SvgPicture.asset("assets/icon/icon_google.svg"),
                    ),
                    const Text("Log in using Google",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),
              ),
            ),
           SizedBox(
             height: double.infinity,
           ),
            const Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: 'Don’t have account? ',
                style: TextStyle(fontSize: 16),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Sign up',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromARGB(255, 255, 197, 66),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
