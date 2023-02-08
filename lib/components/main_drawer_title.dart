import 'package:flutter/material.dart';

class MainDrawerTitle extends StatelessWidget {
  const MainDrawerTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        ListTile(
          onTap: (){},
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
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}
