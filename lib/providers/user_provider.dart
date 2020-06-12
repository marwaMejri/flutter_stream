import 'dart:async';
import 'package:flutterstream/enums/view_state.dart';
import 'package:flutterstream/providers/base_provider.dart';
import 'file:///C:/Users/marwa.mejri/AndroidStudioProjects/flutterstream/lib/services/user_service.dart';


class UserProvider extends BaseProvider{


  UserService _userService=UserService();
  String error;
  StreamController streamController=StreamController();


  Stream getUsers()  {
    this.setState(ViewState.Loading);
    var res=_userService.getUsers();
    res.listen((data) {
      if(!streamController.isClosed)
        streamController.add(data.user);
      this.disposeController(streamController);
    },onError: (error){
        error=error.toString();
        if(!streamController.isClosed)
        streamController.add(error);
        this.disposeController(streamController);

    }
    );
    this.setState(ViewState.Idle);
    return streamController.stream;
  }

}