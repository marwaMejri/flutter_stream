
import 'package:flutter/material.dart';
import 'package:flutterstream/view_state.dart';

class BaseProvider extends ChangeNotifier {

  ViewState _state = ViewState.Loading;

  ViewState get state => _state;

  void setState(ViewState value) {
    _state = value;
  }

  void setStateAndNotifyListeners(ViewState value) {
    _state = value;
    notifyListeners();
  }

}