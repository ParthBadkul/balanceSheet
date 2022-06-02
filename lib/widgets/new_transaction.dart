// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './user_transaction.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  TextEditingController titleCont = TextEditingController();

  TextEditingController amountInput = TextEditingController();
  final fieldText = TextEditingController();
  final fieldamount = TextEditingController();
  DateTime _selectedDate;

  void submiData() {
    final eneteredTitle = titleCont.text;
    final eneteredAmount = double.parse(amountInput.text);

    if (eneteredTitle.isEmpty || eneteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(titleCont.text, eneteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void cleardata() {
    fieldText.clear();
    fieldamount.clear();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDtea) {
      setState(() {
        if (pickedDtea == null) {
          return;
        } else {
          _selectedDate = pickedDtea;
        }
        Navigator.of(context).mounted;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              onChanged: (value) {
                titleCont.text = value;
              },
              controller: fieldText,
              onSubmitted: (_) => submiData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              onChanged: (String value) {
                amountInput.text = value;
              },
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submiData(),
              controller: fieldamount,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'No Date Choosen!'
                      : 'Picked Date:${DateFormat.yMd().format(_selectedDate)}'),
                ),
                FlatButton(
                    onPressed: _presentDatePicker,
                    textColor: Colors.purple,
                    child: Text('Enter Date'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                  onPressed: () {
                    cleardata();
                  },
                  child: const Text('Clear'),
                  textColor: Colors.purple,
                ),
                FlatButton(
                  onPressed: () {
                    submiData();
                  },
                  child: Text('Add Transaction'),
                  textColor: Colors.purple,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
