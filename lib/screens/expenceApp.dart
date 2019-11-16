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

  void _handleActionClickButton(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(
            handleAddTransaction: _handleAddTransaction,
          );
        });
  }

  void _handleAddTransaction(title, amount) {
    DateTime createdAt = DateTime.now();
    String id = createdAt.millisecondsSinceEpoch.toString();

    setState(() {
      _transactions.add(Transaction(
          id: id, title: title, amount: amount, createdAt: createdAt));
    });
  }

  List<Transaction> get _recentTransactions {
    return _transactions
        .where((tx) =>
            tx.createdAt.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expence App"),
        actions: <Widget>[
          IconButton(
              onPressed: () => _handleActionClickButton(context),
              icon: Icon(Icons.add))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _handleActionClickButton(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(children: [
            ExpenceChart(_recentTransactions),
            TransactionList(transactions: _transactions),
          ]),
        ),
      ),
    );
  }
}
