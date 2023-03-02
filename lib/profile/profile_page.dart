import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternote/home_main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  final fullName = TextEditingController();
  final email = TextEditingController();
  final numberPhone = TextEditingController();

  Future<void> _updateProfile() async {
    await user?.updateDisplayName(fullName.text);
  }

  Future<void> _getProfile() async {
    if (user != null) {
      fullName.text = FirebaseAuth.instance.currentUser!.displayName!;
      email.text = FirebaseAuth.instance.currentUser!.email!;
    }
  }

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Edit profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: fullName,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full name',
                  hintText: 'Enter full name'),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: email,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Input Email'),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
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
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Payment name',
                  hintText: 'Enter payment name'),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2 - 20,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Payment name',
                        hintText: 'Enter payment name'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/2 - 20,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Payment name',
                        hintText: 'Enter payment name'),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                _updateProfile();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 21, 115, 254),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "SUBMIT",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
