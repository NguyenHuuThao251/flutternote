import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternote/page/food_recipe.dart';

import '../page/currency_converter.dart';
import 'info_card.dart';
import 'main_drawer_title.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 288,
        height: double.infinity,
        color: Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            children: [
              const InfoCard(
                name: "HTNGUYEN",
                profession: "FACEBOOKER",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white70),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Divider(
                      color: Colors.white24,
                      height: 1,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: SizedBox(
                      height: 34,
                      width: 34,
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Divider(
                      color: Colors.white24,
                      height: 1,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: SizedBox(
                      height: 34,
                      width: 34,
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Divider(
                      color: Colors.white24,
                      height: 1,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: SizedBox(
                      height: 34,
                      width: 34,
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Divider(
                      color: Colors.white24,
                      height: 1,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CurrencyConverter()),
                      );
                    },
                    leading: SizedBox(
                      height: 34,
                      width: 34,
                      child: Icon(
                        Icons.currency_exchange,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "Currency converter",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Divider(
                      color: Colors.white24,
                      height: 1,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FoodRecipe()),
                      );
                    },
                    leading: SizedBox(
                      height: 34,
                      width: 34,
                      child: Icon(
                        Icons.fastfood,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "Food",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
