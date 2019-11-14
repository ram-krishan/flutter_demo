import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function handleAddTransaction;

  NewTransaction({
    @required this.handleAddTransaction,
  });

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInput = TextEditingController();

  final _amountInput = TextEditingController();

  void _handleAddNewTransaction() {
    if (_titleInput.text.isEmpty || _amountInput.text.isEmpty) {
      return;
    }

    widget.handleAddTransaction(
        _titleInput.text, double.parse(_amountInput.text));

    // in state class we are having context, widget available by default. So no need to pass context from method call.
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _titleInput,
              decoration: InputDecoration(labelText: "Title"),
              onSubmitted: (_) {
                _handleAddNewTransaction();
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _amountInput,
              decoration: InputDecoration(labelText: "Amount"),
              onSubmitted: (_) {
                _handleAddNewTransaction();
              },
            ),
            FlatButton(
              child: Text(
                "Add New Transaction",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              onPressed: _handleAddNewTransaction,
              textColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
