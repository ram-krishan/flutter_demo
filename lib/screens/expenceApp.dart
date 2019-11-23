import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transactionList.dart';
import './newTransaction.dart';
import './expenceChart.dart';

// Why we created new My Home Page widget
// This is because the context you are passing into the showModalBottomSheet method is a context that doesn't yet have a MaterialLocalizations widget in the widget tree, the MaterialLocalizations and MediaQuery widget gets added implicitly by the MaterialApp widget.

class ExpenceApp extends StatefulWidget {
  @override
  _ExpenceAppState createState() => _ExpenceAppState();
}

class _ExpenceAppState extends State<ExpenceApp> {
  final List<Transaction> _transactions =
      Transaction.build(transactionCount: 10);
  bool chartView = false;

  void _handleActionClickButton(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(
            handleAddTransaction: _handleAddTransaction,
          );
        });
  }

  void _handleAddTransaction(title, amount, date) {
    DateTime createdAt = date;
    String id = date.toString() + DateTime.now().toString();

    setState(() {
      _transactions.add(Transaction(
          id: id, title: title, amount: amount, createdAt: createdAt));
    });
  }

  List<Transaction> get _recentTransactions {
    List<Transaction> latestTransactions = _transactions
        .where((tx) =>
            tx.createdAt.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();

    latestTransactions.sort((a, b) => a.createdAt.isAfter(b.createdAt) ? 1 : 0);
    return latestTransactions;
  }

  void _removeTransactoin(id) {
    print(_transactions.toString());

    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  double appBarHeight(AppBar appBar) => appBar.preferredSize.height;
  double statusBarHeidth(MediaQueryData mediaQuery) => mediaQuery.padding.top;

  Widget renderLandScapView(mediaQuery, appBar) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Chart View"),
            Switch(
              value: chartView,
              onChanged: (value) {
                setState(() {
                  chartView = value;
                });
              },
            )
          ],
        ),
        if (chartView)
          Container(
            child: ExpenceChart(_recentTransactions),
          ),
        if (!chartView)
          Container(
            height: mediaQuery.size.height -
                mediaQuery.padding.top -
                appBarHeight(appBar) -
                48 -
                mediaQuery.viewInsets.bottom,
            child: TransactionList(
              transactions: _transactions,
              removeTransactoin: _removeTransactoin,
            ),
          ),
      ],
    );
  }

  Widget renderPotraitView(mediaQuery, appBar) {
    return Container(
      width: double.infinity,
      child: Column(children: [
        Container(
          height: mediaQuery.size.height * 0.3,
          child: ExpenceChart(_recentTransactions),
        ),
        Container(
          height: mediaQuery.size.height * 0.7 -
              mediaQuery.padding.top -
              appBarHeight(appBar) -
              mediaQuery.viewInsets.bottom,
          child: TransactionList(
            transactions: _transactions,
            removeTransactoin: _removeTransactoin,
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text("Expence App"),
      actions: <Widget>[
        IconButton(
            onPressed: () => _handleActionClickButton(context),
            icon: Icon(Icons.add))
      ],
    );

    return Scaffold(
        appBar: appBar,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _handleActionClickButton(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: (mediaQuery.orientation == Orientation.portrait
            ? renderPotraitView(mediaQuery, appBar)
            : renderLandScapView(mediaQuery, appBar)));
  }
}
