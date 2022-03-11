import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  late String label;
  late IconData iconData;
  late Function fn;
  late TextEditingController tc;

  setFunction(Function fn) {
    this.fn = fn;
  }

  TextBox(
      {required String label,
      required IconData iconData,
      required TextEditingController tc}) {
    {
      this.label = label;
      this.iconData = iconData;
      this.tc = tc;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      child: TextField(
        onChanged: (String value) {
          if (this.fn != null){ fn(int.parse(value));}
        },
        controller: tc,
        decoration: InputDecoration(
            suffixIcon: Icon(iconData),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            label: Text(label),
            hintText: 'Type $label'),
      ),
    );
  }
}
