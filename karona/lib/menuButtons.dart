import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String option;
  final Function selectHandler;

  MenuButton(this.selectHandler, this.option);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63.0,
      width:133.0,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        
        color: Colors.green,
        border: Border.all(
             style: BorderStyle.solid, width: 1.0,color: Colors.green),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(option, 
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,)),
      ),
    );
  }
}
