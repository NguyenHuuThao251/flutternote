import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              Text("Animated ToDo App"),
              Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Fkhotenmien.vn%2Fcach-de-lay-lien-ket-url-cua-hinh-anh%2F&psig=AOvVaw1EruupXVJgl-izQs2_CoYf&ust=1675758963924000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCIDajeC-gP0CFQAAAAAdAAAAABAh'),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: 60,
          items: <Widget>[
            Icon(Icons.home, size: 30,),
            Icon(Icons.mark_as_unread, size: 30,),
            Icon(Icons.add, size: 30,),
            Icon(Icons.notifications, size: 30,),
            Icon(Icons.settings, size: 30,),
          ],
        ),
      ),
    );
  }
}