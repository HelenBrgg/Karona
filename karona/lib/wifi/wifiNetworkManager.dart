import 'package:flutter/material.dart';

class WifiNetworkManager extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Second page - Payload:',
            style: Theme.of(context).textTheme.title,
          ),
          const SizedBox(height: 8),
          Text(
            'Hello There',
            style: Theme.of(context).textTheme.subtitle,
          ),
          const SizedBox(height: 8),
          RaisedButton(
            child: Text('Back'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    ),
  );
}