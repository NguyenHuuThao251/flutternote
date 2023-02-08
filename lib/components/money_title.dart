import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MoneyTitle extends StatelessWidget {
  final String namePayment;
  final String numberPayment;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  MoneyTitle(
      {Key? key,
      required this.namePayment,
      required this.numberPayment,
      required this.onChanged,
      required this.deleteFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.star_border_outlined,
              backgroundColor: Colors.yellow.shade300,
            ),
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)
            ),
            color: Colors.greenAccent,
          ),
          child: Row(children: <Widget>[
            Column(
              children: [
                Text(namePayment,
                    maxLines: 200,
                    overflow: TextOverflow.ellipsis,
                ),
                Text(numberPayment,
                    maxLines: 200,
                    overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
