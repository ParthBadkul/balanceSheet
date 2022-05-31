//Parth Badkul
//Expense Planner

// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:udemy2/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:udemy2/widgets/new_transaction.dart';
import 'package:udemy2/widgets/transaction_list.dart';
import 'package:udemy2/widgets/user_transaction.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  // Myapp({Key? key}) : super(key: key);
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          ModalBarrier(
            dismissible: true,
          );
          return NewTransaction(_addNewT);
        });
  }

  final List<Transaction> _usertrans = [
    // Transaction(
    //     id: 't1', title: 'Airforce 1', amount: 10000, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'AirJordans 1', amount: 20000, date: DateTime.now()),
  ];
  int count = 0;
  void _addNewT(String newTitile, double newAmount) {
    count++;
    final newtx = Transaction(
        id: count.hashCode.toString(),
        title: newTitile,
        amount: newAmount,
        date: DateTime.now());
    setState(() {
      _usertrans.add(newtx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Color.fromARGB(255, 227, 213, 172),
        ),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('KhataBook'),
            // actions: <Widget>[
            //   IconButton(
            //       onPressed: () => _startAddNewTransaction(context),
            //       icon: Icon(
            //         Icons.add_box,
            //       ))
            // ],
          ),
          body: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  color: Theme.of(context).primaryColorLight,
                  elevation: 7,
                  child: Container(
                    width: double.infinity,
                    // ignore: prefer_const_constructors
                    child: Text(
                      'Charts!s',
                    ),
                  ),
                ),
                TransactionList(_usertrans),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Builder(
            builder: (cx) => FloatingActionButton(
                onPressed: () => _startAddNewTransaction(cx),
                child: Icon(Icons.add)),
          ),
        ));
  }
}
