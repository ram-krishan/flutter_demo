import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final Function removeTransactoin;

  TransactionCard(
      {@required this.transaction, @required this.removeTransactoin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.only(top: 5, left: 5, right: 5),
          leading: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "\$${transaction.amount.toStringAsFixed(2)}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          title: Text(transaction.title.toUpperCase()),
          subtitle: Text(DateFormat.yMMMd().format(transaction.createdAt)),
          trailing: IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            onPressed: () {
              removeTransactoin(transaction.id);
            },
          ),
        ),
        Divider(
          thickness: 5,
          color: Colors.grey[200],
        ),
      ],
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
