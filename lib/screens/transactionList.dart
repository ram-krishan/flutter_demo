import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'package:expense_app/screens/transactionCard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({@required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) =>
            TransactionCard(transaction: transactions[index]),
      ),
    );
  }
}
