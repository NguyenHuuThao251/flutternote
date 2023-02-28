import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoneyTitle extends StatelessWidget {
  final String namePayment;
  final String numberPayment;
  final String typePayment;
  final String kindPayment;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  MoneyTitle({Key? key,
    required this.namePayment,
    required this.numberPayment,
    required this.typePayment,
    required this.kindPayment,
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
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/icon/icon_buy.svg",
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          namePayment,
                          maxLines: 200,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          kindPayment,
                          maxLines: 200,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  typePayment == "Income" ? "+${numberPayment}" : "-${numberPayment}",
                  maxLines: 200,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: typePayment == "Income" ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ]),
        ),
      ),
    );
  }
}
