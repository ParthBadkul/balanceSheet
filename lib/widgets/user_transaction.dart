import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import './main.dart';
import 'package:udemy2/models/transaction.dart';

class UserTransaction extends StatefulWidget {
  // UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // NewTransaction(_addNewT),
        // TransactionList(_usertrans),
      ],
    );
  }
}
