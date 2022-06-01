// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  // const TransactionList({Key? key}) : super(key: key);

  List<Transaction> trans;
  TransactionList(this.trans) {}

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: widget.trans.isEmpty
            ? Container(
                width: double.infinity,
                height: 300,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 209, 128, 224)),
                      child: const Text(
                        'No Transaction Yet',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 32),
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/pig.jpg',
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
              )
            : ListView.builder(
                //List View has unlimited Height
                itemCount: widget.trans.length,
                itemBuilder: (ctx, index) {
                  return Flexible(
                    fit: FlexFit.tight,
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: FittedBox(
                                child: Text(
                                    '₹${widget.trans[index].amount.toString()}')),
                          ),
                        ),
                        title: Text(widget.trans[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(DateFormat.yMMMEd()
                            .format(widget.trans[index].date)),
                      ),
                    ),
                  );
                },
              ));
  }
}
