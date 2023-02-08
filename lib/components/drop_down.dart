import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customDropDown(List<String> items, String value, void onChage(val)) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: DropdownButton<String>(
      value: value,
      onChanged: (String? value) {
        onChage(value);
      },
      items: items.map<DropdownMenuItem<String>>((String valu) =>
          DropdownMenuItem<String>(
            value: valu,
            child: Text(valu),
          )
      ).toList(),
    ),
  );
}