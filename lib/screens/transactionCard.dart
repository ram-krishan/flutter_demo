import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  TransactionCard({@required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(10),
            decoration:
                BoxDecoration(border: Border.all(width: 3, color: Colors.blue)),
            child: Text(
              "\$${transaction.amount.toStringAsFixed(2)}",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(transaction.title.toUpperCase()),
          subtitle: Text(DateFormat.yMMMd().format(transaction.createdAt)),
        ),
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return Container(
  //     width: double.infinity,
  //     margin: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
  //     child: Card(
  //         elevation: 10,
  //         child: Row(
  //           children: <Widget>[
  //             Container(
  //               padding: EdgeInsets.all(10),
  //               margin: EdgeInsets.all(10),
  //               decoration: BoxDecoration(
  //                   border: Border.all(width: 3, color: Colors.blue)),
  //               child: Text(
  //                 "\$${transaction.amount.toStringAsFixed(2)}",
  //                 style: TextStyle(
  //                     color: Colors.blue,
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.bold),
  //               ),
  //             ),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: <Widget>[
  //                 Text(
  //                   transaction.title.toUpperCase(),
  //                   style: TextStyle(
  //                       color: Colors.blue,
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //                 Text(
  //                   DateFormat.yMMMd().format(transaction.createdAt),
  //                   style: TextStyle(
  //                       color: Colors.grey,
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //               ],
  //             )
  //           ],
  //         )),
  //   );
  // }
}
