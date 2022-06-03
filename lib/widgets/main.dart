//Parth Badkul
//Expense Planner

// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:nakama/api.dart';
import 'package:udemy2/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:udemy2/widgets/chart.dart';
import 'package:udemy2/widgets/new_transaction.dart';
import 'package:udemy2/widgets/transaction_list.dart';
import 'package:udemy2/widgets/user_transaction.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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

  List<Transaction> get recentTransaction {
    return _usertrans.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  int count = 0;
  void _addNewT(String newTitile, double newAmount, DateTime datetimenow) {
    final newtx = Transaction(
        id: DateTime.now().toString(),
        title: newTitile,
        amount: newAmount,
        date: datetimenow);
    print('object');
    setState(() {
      _usertrans.add(newtx);
    });
    ;
  }

  void deleteTransaction(String id) {
    // print('deletfrom function');
    setState(() {
      _usertrans.removeWhere((e) {
        return (e.id == id);
      });
    });
  }

  bool _showchart = false;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      title: Text(
        'KhataBook',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Color.fromARGB(255, 229, 173, 6),
          errorColor: Colors.red,
        ),
        home: Container(
          child: Scaffold(
            appBar: appBar,
            body: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Show Chart'),
                      Switch(
                          value: _showchart,
                          onChanged: (value) {
                            setState(() {
                              _showchart = value;
                            });
                          })
                    ],
                  ),
                  Column(
                    children: [
                      _showchart == true
                          ? Chart(recentTransaction)
                          : SizedBox(
                              height: 10,
                            )
                    ],
                  ),
                  Card(
                      borderOnForeground: true,
                      shadowColor: Color.fromARGB(255, 245, 144, 178),
                      child: Container(
                          height: 600,
                          child:
                              TransactionList(_usertrans, deleteTransaction))),
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
          ),
        ));
  }
}
