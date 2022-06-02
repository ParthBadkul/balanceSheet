// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({Key? key}) : super(key: key);

  Function deleteTx;
  List<Transaction> trans;

  TransactionList(this.trans, this.deleteTx) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: trans.isEmpty
            ? Container(
                width: double.infinity,
                height: 400,
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
                itemCount: trans.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: FittedBox(
                                child:
                                    Text('₹${trans[index].amount.toString()}')),
                          ),
                        ),
                        title: Text(trans[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle:
                            Text(DateFormat.yMMMEd().format(trans[index].date)),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            print('delete');
                            deleteTx;
                          },
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}
