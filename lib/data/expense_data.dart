import 'dart:convert';

import 'package:expense_app/datetime/datetime_helper.dart';
import 'package:expense_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier {
  // list of all  expense

  List<ExpenseItems> overallExpenseList=[];

  //get expense list
  List<ExpenseItems>getAllExpenseLIst(){
    return overallExpenseList;
  }

  // add new list
  void addNewExpense(ExpenseItems addNewExpense){
    overallExpenseList.add(addNewExpense);
  }

  // delete expense

    void deletexpense(ExpenseItems addNewExpense){
    overallExpenseList.remove(addNewExpense);
  }

  //get weeday(mon,tue, wed,thur,fri,sat,sun)

  String getDayName(DateTime dateTime){
    switch(dateTime.weekday){

      case 1:
      return 'Mon';

      case 2:
      return 'Tue';

      case 3:
      return 'Wed';

      case 4:
      return 'Thu';

      case 5:
      return 'Fri';

      case 6:
      return 'Sat';

      case 7:
      return 'Sun';

      default:
      return '';
      

    }

  }



// get the date for the start of the week

DateTime startofWeekdate(){
DateTime startofWeek=DateTime.now();

//get todays date
DateTime today =DateTime.now();

//go backbackward from today to find sunday
for (int i =0; i<7;i++){

  if(getDayName(today.subtract(Duration(days:i))) == 'Sun'){
startofWeek =today.subtract(Duration(days: i));

  }
}
 return startofWeek;

}
  /*

  convert overall list of expense into a daily expense summary


  e.g,

  overallExpenseList = 
  [
    [food,2024/01/30/$10],   [food,2024/01/30/$10],   [food,2024/01/30/$10],   [food,2024/01/30/$10],   [food,2024/01/30/$10],
  ]


  daily expenseSummary =
   [
[2024/01/30:$25],
[2024/02/31:$25],
[2024/02/01:$25],
[2024/02/02:$25],

  ]

  */



  Map<String,double>CalculateDailyExpenseSummary(){
    Map<String,double>dailyExpenseSummaary = {
      //date(yymmdd) : amountTotalFortheDay)
    };

    for(var expense in overallExpenseList){
String date = convertDateTimeToString(expense.dateTime);
double amount = double.parse(expense.amount);

if(dailyExpenseSummaary.containsKey(date)){

  double currentAmount = dailyExpenseSummaary[date]!;
  currentAmount += amount;
  dailyExpenseSummaary[date]=currentAmount;


  
}

else{

  dailyExpenseSummaary.addAll({date:amount});
}

    }

    return dailyExpenseSummaary;
  }
}
