import 'package:flutter/material.dart';
import 'DetailPages/SocializingDetail.dart';
import 'DetailPages/stayHealthyDetail.dart';
import 'DetailPages/pseudoDetail.dart';

class MenuButton extends StatelessWidget {
  final String option;
  pageSelector(){
    if(option == 'Stay healthy'){
      return StayHealthyDetail();
    }
    if (option == 'Socializing'){
      return SocializingDetail();
  }
    if (option == 'Pseudo'){
      return PseudoDetail();
  }
  }

  MenuButton( this.option);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63.0,
      width:133.0,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
             style: BorderStyle.solid, width: 1.0,),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: RaisedButton(
        child: Text(option, 
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,)),
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder:(context){
                          return pageSelector();
                        }
      ));
  }));
}
}