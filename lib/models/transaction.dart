import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final double amount;
  final DateTime createdAt;
  final String title;

  Transaction({
    @required this.id,
    @required this.amount,
    @required this.createdAt,
    @required this.title,
  });

  static List<Transaction> build({int transactionCount = 1}) {
    List<Transaction> list = [];
    for (var i = 1; i <= transactionCount; i++) {
      list.add(Transaction(
          amount: 10.599 * i,
          createdAt: DateTime.now().subtract(Duration(days: i - 1)),
          id: i.toString(),
          title: "transaction $i"));
    }

    return list;
  }
}
