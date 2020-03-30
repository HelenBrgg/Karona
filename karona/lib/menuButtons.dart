import 'package:flutter/material.dart';
import 'DetailPages/socializingDetail.dart';
import 'DetailPages/stayHealthyDetail.dart';
import 'DetailPages/pseudoDetail.dart';

import './globals.dart';

class MenuButton extends StatelessWidget {
  final String option;
  final Icon icon;
  MenuButton(this.option,this.icon, this.parentAction);

  final void Function() parentAction;
  
  pageSelector() {
    if (option == 'Stay healthy') {
      return StayHealthyDetail();
    }
    if (option == 'Socializing') {
      return SocializingDetail();
    }
    if (option == 'Pseudo') {
      return PseudoDetail();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 63.0,
        width: 133.0,
        margin:EdgeInsets.all(2),
        child: RaisedButton(color:Colors.green,child:
          Row(children:[ Text(option,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),icon],),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) {
              //return pageSelector();
            //}));
            parentAction();
          },
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ));
  }
}
