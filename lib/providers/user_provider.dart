import 'dart:async';
import 'package:flutterstream/enums/view_state.dart';
import 'package:flutterstream/providers/base_provider.dart';
import 'file:///C:/Users/marwa.mejri/AndroidStudioProjects/flutterstream/lib/services/user_service.dart';


class UserProvider extends BaseProvider{



  UserService _userService=UserService();
  String _error;


  String get error => _error;

  StreamController streamController=StreamController.broadcast();

  Stream getUsers() {
    this.setState(ViewState.Loading);
    var res=_userService.getUsers();
    res.listen((data) {
      if(!streamController.isClosed)
        streamController.add(data.user);
    },onError: (error){
        _error=error.toString();
        if(!streamController.isClosed)
        streamController.add(_error);
    }
    );
    this.setState(ViewState.Idle);
    return streamController.stream;
  }


}