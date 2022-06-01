// ignore_for_file: avoid_print, dead_code

import 'package:flutter/material.dart';
import 'package:udemy2/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:udemy2/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  // const Chart({Key? key}) : super(key: key);
  final List<Transaction> recent;

  Chart(this.recent);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      // return {'day': DateFormat.E().format(weekDay), 'amount': 9.99};
      double sum = 0;
      for (int i = 0; i < recent.length; i++) {
        if (recent[i].date.day == weekDay.day &&
            recent[i].date.month == weekDay.month &&
            recent[i].date.year == weekDay.year) {
          sum = recent[i].amount + sum;
        }
      }
      print(sum);
      print(DateFormat.E().format(weekDay));
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': sum
      };
    }).toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      child: Container(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupedTransactionValues.map((e) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    e['day'],
                    e['amount'],
                    totalSpending == 0.0
                        ? 0
                        : (e['amount'] as double) / totalSpending),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
