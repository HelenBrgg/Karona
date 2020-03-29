import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String option;
  final Function selectHandler;

  MenuButton(this.selectHandler, this.option);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          color: Colors.blue, child: Text(''),
          onPressed: selectHandler),
    );
  }
}
