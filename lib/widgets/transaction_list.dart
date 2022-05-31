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
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.purple, width: 3)),
                          padding: EdgeInsets.all(12),
                          child: Text(
                            '₹${widget.trans[index].amount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.5,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.trans[index].title.toString(),
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              DateFormat.yMMMd()
                                  .format(widget.trans[index].date),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ));
  }
}
