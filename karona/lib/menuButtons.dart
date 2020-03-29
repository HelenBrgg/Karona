import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String option;
  final Function selectHandler;

  MenuButton(this.selectHandler, this.option);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      width:137.0,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey, style: BorderStyle.solid, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(option),
      ),
    );
  }
}
