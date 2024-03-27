import 'package:flutter/material.dart';

class ExpensionTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTIme;

  const ExpensionTile(
      {super.key,
      required this.name,
      required this.amount,
      required this.dateTIme});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(name),
        trailing: Text(dateTIme.day.toString() +
            '/' +
            dateTIme.month.toString() +
            '/' +
            dateTIme.year.toString()));
  }
}
