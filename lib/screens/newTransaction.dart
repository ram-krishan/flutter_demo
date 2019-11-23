import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
  DateTime date;

  void _handleAddNewTransaction() {
    if (_titleInput.text.isEmpty || _amountInput.text.isEmpty || date == null) {
      return;
    }

    widget.handleAddTransaction(
        _titleInput.text, double.parse(_amountInput.text), date);

    // in state class we are having context, widget available by default. So no need to pass context from method call.
    Navigator.of(context).pop();
  }

  void presentDatePicker() async {
    DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now());

    setState(() {
      date = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 30,
              left: 30,
              right: 30,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(date == null
                        ? "No Date Choosen"
                        : DateFormat.yMMMd().format(date)),
                  ),
                  FlatButton(
                    child: Text(
                      "Select Date",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    onPressed: presentDatePicker,
                    textColor: Colors.blue,
                  )
                ],
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
      ),
    );
  }
}
