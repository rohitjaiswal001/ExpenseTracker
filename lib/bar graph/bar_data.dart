import 'package:expense_app/bar%20graph/individula_bar.dart';

class BarData{
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarData({required this.sunAmount, required this.monAmount, required this.tueAmount, required this.wedAmount, required this.thurAmount, required this.friAmount, required this.satAmount});

List<IndividualBar>barData = [];


//initialize bar Data
void initializeBArData(){

  barData =[
    //sun 
    IndividualBar(x: 0, y: sunAmount),

    //mon
    IndividualBar(x: 0, y: monAmount),

    //tue
    IndividualBar(x: 0, y: tueAmount),

    //wed
    IndividualBar(x: 0, y: wedAmount),

    //thur
    IndividualBar(x: 0, y: thurAmount),

    //Fri
    IndividualBar(x: 0, y: friAmount),

    //sat
    IndividualBar(x: 0, y: satAmount)

  ];
}
}