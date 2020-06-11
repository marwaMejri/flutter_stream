import 'dart:async';
import 'package:flutterstream/base_provider.dart';
import 'package:flutterstream/user_service.dart';
import 'package:flutterstream/view_state.dart';

class UserProvider extends BaseProvider {

  UserService _userService=UserService();
  String error;
  StreamController streamController=StreamController();

  Stream getUsers()  {
    this.setState(ViewState.Loading);
    var res=_userService.getUsers();
    res.listen((data) {
      if(!streamController.isClosed)
        streamController.add(data.user);
    },onError: (error){
        error=error.toString();
        if(!streamController.isClosed)
        streamController.add(error);
    }
    );
    this.setState(ViewState.Idle);
    return streamController.stream;
  }

}