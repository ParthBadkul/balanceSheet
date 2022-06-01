// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './user_transaction.dart';

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

  void submiData() {
    final eneteredTitle = titleCont.text;
    final eneteredAmount = double.parse(amountInput.text);

    if (eneteredTitle.isEmpty || eneteredAmount <= 0) {
      return;
    }

    widget.addTx(titleCont.text, eneteredAmount);
    Navigator.of(context).pop();
  }

  void cleardata() {
    fieldText.clear();
    fieldamount.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
    ;
  }
}
