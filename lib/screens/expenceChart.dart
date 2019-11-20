import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/screens/chartBar.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class ExpenceChart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  ExpenceChart(this.recentTransactions);

  Map<String, Map<String, Object>> get _barData {
    return recentTransactions.fold<Map<String, Map<String, Object>>>({},
        (data, tx) {
      var date = DateFormat.yMd().format(tx.createdAt).toString();
      print(date);
      if (data[date] != null) {
        data[date]['amount'] = (data[date]['amount'] as double) + tx.amount;
      } else {
        data[date] = {};
        data[date]['amount'] = tx.amount;
        data[date]['wday'] =
            DateFormat.E().format(tx.createdAt).substring(0, 1);
      }
      return data;
    });
  }

  double get totalSpending {
    return recentTransactions.fold(0, (result, tx) => result += tx.amount);
  }

  List<Widget> get chartRow {
    print(_barData);
    List<Widget> chartBars = [];

    _barData.forEach((key, value) {
      chartBars.add(
        Flexible(
          flex: 1,
          child: ChartBar(
              totalSpending: totalSpending,
              amountSpending: value['amount'],
              label: value['wday']),
        ),
      );
    });

    return chartBars;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: chartRow,
        ),
      ),
    );
  }
}
