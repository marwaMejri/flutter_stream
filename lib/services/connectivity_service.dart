import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutterstream/enums/connectivity_status.dart';

class ConnectivityService{

  StreamController<ConnectivityStatus> connectionStatusController = StreamController<ConnectivityStatus>();

  ConnectivityService() {
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      var connectionStatus=_getStatus(connectivityResult);
      connectionStatusController.add(connectionStatus);
    });
  }

  ConnectivityStatus _getStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}
