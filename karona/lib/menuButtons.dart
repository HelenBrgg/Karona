import 'package:flutter/material.dart';
import 'DetailPages/socializingDetail.dart';
import 'DetailPages/stayHealthyDetail.dart';
import 'DetailPages/pseudoDetail.dart';
import 'globals.dart';
import 'package:karona/wifi/wifiNetworkManager.dart';

import './globals.dart';

class MenuButton extends StatelessWidget {
  final String option;
  final Icon icon;
  MenuButton(this.option,this.icon, this.parentAction, this.parentActionArgs);

  final void Function(String) parentAction;
  final String parentActionArgs;
  
  pageSelector() {
    if (option == 'Stay healthy') {
      return StayHealthyDetail();
    }
    if (option == 'Socializing') {
      return SocializingDetail();
    }
    if (option == 'Home Networks') {
      return WifiNetworkManager();
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
            parentAction(parentActionArgs);
            //Navigator.push(context, MaterialPageRoute(builder: (context) {return pageSelector();}
            //));
          },
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ));
  }
}
