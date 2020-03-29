//imports the package for checking connectivity
import 'package:connectivity/connectivity.dart';
import 'dart:async';

import 'package:flutter/services.dart';

class WifiObserver {
  var _currentSSID;
  var _currentName;
  var _subscription;
  final String _homeSSID = "02:00:00:00:01:00";
  bool _reminderFlag = false;
  bool _alertedFlag = false;
  final StreamController<bool> _streamControllerGotHome = new StreamController<bool>.broadcast();
  Stream<bool> _streamGotHome;

  final Connectivity _connectivity = Connectivity();


  WifiObserver(){
    _obtainWifiInfo();
    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result){_testForHomeNetwork(result);});
    _streamGotHome = _streamControllerGotHome.stream;
    }

  void _testForHomeNetwork(ConnectivityResult result){
    if(result == ConnectivityResult.wifi){
      _obtainWifiInfo();
      if(_currentSSID == _homeSSID && !_alertedFlag){
        _streamControllerGotHome.add(true);
        _alertedFlag = true;
        _reminderFlag = true;
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

  bool getReminderStatus() {
    return _reminderFlag;
  }

  Stream<bool> getStreamGotHome() {
    return _streamGotHome;
  }

  void setReminderStatus(bool status) {
    _reminderFlag = status;
  }

  void setAlertFlag(bool) {
    _alertedFlag = bool;
  }

  bool getAlertFlag() {
    return _alertedFlag;
  }

}