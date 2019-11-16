import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double totalSpending, amountSpending;
  final String label;

  ChartBar(
      {@required this.totalSpending,
      @required this.amountSpending,
      @required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FittedBox(
            child: Text(
              "\$${amountSpending.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: 1 - (amountSpending / totalSpending),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(211, 211, 211, 1),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(label),
        ],
      ),
    );
  }
}
