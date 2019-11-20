import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'package:expense_app/screens/transactionCard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransactoin;

  TransactionList(
      {@required this.transactions, @required this.removeTransactoin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) => TransactionCard(
          transaction: transactions[index],
          removeTransactoin: removeTransactoin,
        ),
      ),
    );
  }
}
