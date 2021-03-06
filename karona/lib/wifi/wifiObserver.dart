//imports the package for checking connectivity
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import 'package:karona/persistency/network_classes.dart';
import 'package:karona/persistency/network_sql_interface.dart';

import 'package:flutter/services.dart';

class WifiObserver {

  //some variables for the wifi observer class
  var _currentSSID;
  var _currentName;

  //subscription for the connectivity topic
  var _subscription;

  //list for networks
  List<String> _networkSSIDList = List<String>();
  List<Network> _networkList;

  //some flags for functionality
  bool _alertedFlag = false;
  bool _discardAsFirst = true;

  //controller and stream to publish info to other topics
  final StreamController<bool> _streamControllerGotHome = new StreamController<bool>.broadcast();
  Stream<bool> _streamGotHome;

  Networks_SQL_Interface networks_sql_interface = new Networks_SQL_Interface();

  //the connectivity
  final Connectivity _connectivity = Connectivity();

  void init() async{
    _obtainWifiInfo();
    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result){_testForHomeNetwork(result);});
    _streamGotHome = _streamControllerGotHome.stream;
    await networks_sql_interface.Init_SQL_Interface();
    updateNetworkList();
  }

  void updateNetworkList() async{
    _networkSSIDList.clear();
    _networkList = await networks_sql_interface.networks();
    _networkList.forEach((n){
      _networkSSIDList.add(n.ssid);
    });
  }

  void _testForHomeNetwork(ConnectivityResult result){
    if(_discardAsFirst){
      _discardAsFirst = false;
    }
    else{
      if(result == ConnectivityResult.wifi){
        _obtainWifiInfo();
        if(_networkSSIDList.contains(_currentSSID) && !_alertedFlag){
          _streamControllerGotHome.add(true);
          _alertedFlag = true;
        }
      }
      else{
        _alertedFlag = false;
      }
    }
  }

  void printNetworkDB() async{
    print(await networks_sql_interface.networks());
  }

  void clearNetworkDB() async{
    (await networks_sql_interface.networks()).forEach((n) async{
      await networks_sql_interface.deleteNetwork(n.ssid);
    });
  }

  void addCurrentNetworkToHomeList() async{
    if(!_networkSSIDList.contains(_currentSSID)){
      var network = Network(
          id: 0,
          ssid: _currentSSID,
          name: _currentName
      );
      await networks_sql_interface.insertNetwork(network);
    }
    updateNetworkList();
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

  List<Network> getNetworkList() {
    return _networkList;
  }

  void deleteWifi(String SSID) async{
    StreamController<bool> _streamControllerDeletedWlan = StreamController<bool>.broadcast();
    Stream<bool> streamDeletedWlan;
    await networks_sql_interface.deleteNetwork(SSID);
    _streamControllerDeletedWlan.add(true);
    updateNetworkList();
  }

}