// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:emi_calc/widgets/slider.dart';
import 'package:flutter/material.dart';
import '/widgets/textbox.dart';
import 'package:pie_chart/pie_chart.dart';

class Emi extends StatefulWidget {
  const Emi({Key? key}) : super(key: key);

  @override
  State<Emi> createState() => _EmiState();
}

class _EmiState extends State<Emi> {
  late Map<String, double> pieData={
       "Principal Loan Amount":totalPay-totalInt,
    "Total Interest": totalInt,

    };   

  int _value = 1;
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  double emi = 0.0;
  double totalInt = 0.0;
  double totalPay = 0.0;
  takeSliderValue(int value) {
    _value = value;
    print('Rec Value from Slider $value');
    t3.text = _value.toString();
    setState(() {});
  }

  _compute() {
    int loanAmount = int.parse(t1.text);
    int roi = int.parse(t2.text);
    int tenure = int.parse(t3.text);
    double monthlyPr = (loanAmount / tenure);
    double monthlyroi = (loanAmount * (roi / 100)) / tenure;
    emi = monthlyPr + monthlyroi;
    totalPay = (emi * tenure);
    totalInt = totalPay - loanAmount;
 

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextBox tb = TextBox(label: 'Tenure', iconData: Icons.timer, tc: t3);
    tb.setFunction(takeSliderValue);
    return Scaffold(
      appBar: AppBar(
        title: Text('EMI Calc'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextBox(label: 'Loan Amount', iconData: Icons.attach_money, tc: t1),
            TextBox(label: 'ROI', iconData: Icons.percent, tc: t2),
            tb,
            MySlider(takeSliderValue,
                _value), // pass fn as an arguement to the Const
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange)),
                onPressed: () {
                  _compute();
                },
                child: Text(
                  'Compute',
                  style: TextStyle(fontSize: 20),
                )),
            Text('Emi $emi', style: TextStyle(fontSize: 30)),
            Text(
              'Total Interest $totalInt',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Total Payment $totalPay',
              style: TextStyle(fontSize: 30),
            ),
            
            PieChart(dataMap: pieData)
          ],
        ),
      ),
    );
  }
}
