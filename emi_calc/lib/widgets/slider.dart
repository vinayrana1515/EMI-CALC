import 'package:flutter/material.dart';

class MySlider extends StatelessWidget {
  Function fn;
  int value;
  // const MySlider({Key? key}) : super(key: key);
  MySlider(this.fn,this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slider(
        value: value.toDouble(), 
        min: 1,
        max: 12,
        onChanged: (double value) {
          fn(value.toInt());
        },
      ),
    );
  }
}
