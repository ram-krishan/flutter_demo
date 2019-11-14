import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transactionList.dart';
import './newTransaction.dart';

class ExpenceApp extends StatefulWidget {
  @override
  _ExpenceAppState createState() => _ExpenceAppState();
}

class _ExpenceAppState extends State<ExpenceApp> {
  final List<Transaction> _transactions =
      Transaction.build(transactionCount: 1);

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
            TransactionList(transactions: _transactions),
          ]),
        ),
      ),
    );
  }
}
