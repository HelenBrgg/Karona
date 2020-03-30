import 'package:flutter/material.dart';
import 'package:karona/globals.dart';

class WifiNetworkManager extends StatefulWidget {
  @override
  _WifiNetworkManagerState createState() => _WifiNetworkManagerState();
}

class _WifiNetworkManagerState extends State<WifiNetworkManager> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Home Networks',
                style: Theme.of(context).textTheme.title,
              ),
              const SizedBox(height: 8),
              Container(
                height: 500.0,
                child: ListView(
                  //scrollDirection: Axis.horizontal,
                  children: wifiObserver
                      .getNetworkList()
                      .map((element) => Card(
                              child: ListTile(
                            leading: Icon(Icons.wifi),
                            title: Text(element.name),
                            //trailing: Icon(Icons.more_vert),
                            trailing: PopupMenuButton<int>(
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 0,
                                  child: Text("Info"),
                                ),
                                PopupMenuItem(
                                  value: 1,
                                  child: Text("Delete"),
                                ),
                              ],
                              onSelected: (value) {
                                switch (value) {
                                  case 0:
                                    {
                                      print(wifiObserver.getWifiSSID());
                                      break;
                                    }
                                  case 1:
                                    {
                                      wifiObserver.deleteWifi(element.ssid);
                                      Future.delayed(const Duration(milliseconds: 500), () {
                                        setState(() {});
                                      });
                                      break;
                                    }
                                }
                              },
                            ),
                          )))
                      .toList(),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text('Back'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text('Add current WIFI'),
                      onPressed: () {
                        wifiObserver.addCurrentNetworkToHomeList();
                        setState(() {});
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
}
