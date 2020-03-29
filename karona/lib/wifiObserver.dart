//imports the package for checking connectivity
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import 'persistency/network_classes.dart';
import 'persistency/network_sql_interface.dart';

import 'package:flutter/services.dart';

class WifiObserver {

  //some variables for the wifi observer class
  var _currentSSID;
  var _currentName;

  //subscription for the connectivity topic
  var _subscription;

  //list for networks
  List<Network> networkList;
  //final String _homeSSID = "02:00:00:00:01:00";

  //some flags for functionality
  bool _alertedFlag = false;
  bool _discardAsFirst = true;

  //controller and stream to publish info to other topics
  final StreamController<bool> _streamControllerGotHome = new StreamController<bool>.broadcast();
  Stream<bool> _streamGotHome;

  //the connectivity
  final Connectivity _connectivity = Connectivity();

  void init() async{
    _obtainWifiInfo();
    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result){_testForHomeNetwork(result);});
    _streamGotHome = _streamControllerGotHome.stream;
    Networks_SQL_Interface networks_sql_interface = new Networks_SQL_Interface();
    await networks_sql_interface.Init_SQL_Interface();
    networkList =  await networks_sql_interface.networks();
    networkList.forEach((element) => element.toMap());
    print(networkList);
  }

  void _testForHomeNetwork(ConnectivityResult result){
    if(_discardAsFirst){
      _discardAsFirst = false;
    }
    else{
      if(result == ConnectivityResult.wifi){
        _obtainWifiInfo();
        if(_currentSSID == _currentSSID && !_alertedFlag){
          _streamControllerGotHome.add(true);
          _alertedFlag = true;
        }
      }
      else{
        _alertedFlag = false;
      }
    }
  }

  void _stopConnectivityListener() {
    _subscription.cancel();
  }

  Future<void> _obtainWifiInfo() async {

    try {
      _currentSSID = await _connectivity.getWifiBSSID();
      _currentName = await _connectivity.getWifiName();
    } on PlatformException catch (e) {
      print(e.toString());
      _currentSSID = "Failed to get Wifi BSSID";

    }
  }


  String getWifiName() {
    return _currentName;
  }

  String getWifiSSID() {
    return _currentSSID;
  }

  Stream<bool> getStreamGotHome() {
    return _streamGotHome;
  }

  void setAlertFlag(bool) {
    _alertedFlag = bool;
  }

  bool getAlertFlag() {
    return _alertedFlag;
  }

}