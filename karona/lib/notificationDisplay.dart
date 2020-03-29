import 'package:flutter/material.dart';

class NotificationDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(left:7,right:7,top:7),
        width: double.infinity,
        height:430,
        child: 
          Column(children:[ Row(children: [
            Image.network(
              'https://png2.cleanpng.com/sh/5291ae8e6fd8be965b0c80e89930e23d/L0KzQYm3V8EzN5DnR91yc4Pzfri0gB9ueKZ5feQ2aXPyfsS0hP94dp10edY2Y3zsgH7okwQudpD5gdhyY3H3ebF1Tflkd58yTdQ9NnbnSISAVfFlaWIzT6I6MEG1R4e4VcMyO2gASKkANEi1PsH1h5==/kisspng-computer-icons-download-clip-art-notification-icon-5b46fd8375ada1.701012761531379075482.png',
                width: 40,
                height: 40,
                color:Colors.grey[800],
                alignment: Alignment.centerLeft),
            Text(
            'Challenges',
            style: TextStyle(fontFamily: 'Montserrat',
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),textAlign: TextAlign.left,)
          ]),
          Container(child: Column(children:
[            Text('Bla'),Text('Bla'),]
          )

          )
        ]));
  }
}
