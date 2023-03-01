import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'info_card.dart';

class SlideMenu extends StatefulWidget {
  const SlideMenu({super.key});

  @override
  State<SlideMenu> createState() => _SlideMenuState();

}

class _SlideMenuState extends State<SlideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Color.fromARGB(255, 21, 115, 254),
        child: SafeArea(
          child: Column(
            children: [
              const InfoCard(name: "HTNGUYEN", profession: "FACEBOOKER",),
              ListTile(
                leading: SizedBox(
                  height: 34,
                  width: 34,
                  child: Container(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

