import 'package:expense_app/bar%20graph/Mybar_graph.dart';
import 'package:expense_app/data/expense_data.dart';
import 'package:expense_app/datetime/datetime_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;
  ExpenseSummary({super.key, required this.startOfWeek});

  @override
  Widget build(BuildContext context) {
   
   String sunday=convertDateTimeToString(startOfWeek.add(Duration(days: 0)));
      String monday=convertDateTimeToString(startOfWeek.add(Duration(days: 1)));
         String tuesday=convertDateTimeToString(startOfWeek.add(Duration(days: 2)));
            String wednesday=convertDateTimeToString(startOfWeek.add(Duration(days: 3)));
               String thursday=convertDateTimeToString(startOfWeek.add(Duration(days: 4)));
                  String friday=convertDateTimeToString(startOfWeek.add(Duration(days:5)));
                     String saturday=convertDateTimeToString(startOfWeek.add(Duration(days: 6)));
    return Consumer<ExpenseData>(
        builder: (context, value, child) => SizedBox(
              height: 200,
              child: MyBarGraph(
                maxY: 100,
                sunAmount: value.CalculateDailyExpenseSummary()[sunday]??0,
                monAmount: value.CalculateDailyExpenseSummary()[monday]??0,
                tueAmount: value.CalculateDailyExpenseSummary()[tuesday]??0,
                wedAmount: value.CalculateDailyExpenseSummary()[wednesday]??0,
                thurAmount: value.CalculateDailyExpenseSummary()[thursday]??0,
                friAmount: value.CalculateDailyExpenseSummary()[friday]??0,
                satAmount: value.CalculateDailyExpenseSummary()[saturday]??0,
              ),
            ));
  }
}
