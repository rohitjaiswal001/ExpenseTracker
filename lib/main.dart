import 'package:expense_app/data/expense_data.dart';
import 'package:expense_app/views/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ExpenseData(), 
      builder: (context, child)=>MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
  
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    ),
    
    
    );
  }
}
