import 'package:expense_app/components/expanse_summary.dart';
import 'package:expense_app/components/expension_tile.dart';
import 'package:expense_app/data/expense_data.dart';
import 'package:expense_app/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final newExpenseNameCoontroller = TextEditingController();
  final newExpenseAmountCoontroller = TextEditingController();

  void addNewExpense() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add New Expense "),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //expense name
                  TextField(
                    controller: newExpenseNameCoontroller,
                  ),

                  // expese amount
                  TextField(
                    controller: newExpenseAmountCoontroller,
                  )
                ],
              ),
              actions: [
                //save Button
                MaterialButton(
                  onPressed: save,
                  child: Text('Save'),
                ),

                //cancel Button
                MaterialButton(
                  onPressed: cancel,
                  child: Text('Cancel'),
                ),
              ],
            ));
  }

  // SAve
  void save() {
    //create expense item
    ExpenseItems newExpense = ExpenseItems(
        name: newExpenseNameCoontroller.text,
        amount: newExpenseAmountCoontroller.text,
        dateTime: DateTime.now());
    //add the New expense
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
  }

  //cancel
  void cancel() {
    
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addNewExpense();
          },
          child: Icon(Icons.add),
        ),
        body: ListView(

          children: [
            //weeklly summary
ExpenseSummary(startOfWeek: value.startofWeekdate()),

            //expense list 
            ListView.builder(
            itemCount: value.getAllExpenseLIst().length,
            itemBuilder: (context, index) =>

                // ListTile(
                //       title: Text(value.getAllExpenseLIst()[index].name),
                //       trailing: Text('\$'+ value.getAllExpenseLIst()[index].amount),
                //     )

                ExpensionTile(
                    name: value.getAllExpenseLIst()[index].name,
                    amount: value.getAllExpenseLIst()[index].amount,
                    dateTIme: value.getAllExpenseLIst()[index].dateTime)),
          ],
        )
      ),
    );
  }
}
