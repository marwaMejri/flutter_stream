import 'dart:async';
import 'package:flutterstream/base_provider.dart';
import 'package:flutterstream/user_model.dart';
import 'package:flutterstream/user_service.dart';
import 'package:flutterstream/view_state.dart';

class UserProvider extends BaseProvider {

  UserService _userService=UserService();
  List<User> userModel;
  String error;


  Stream getUsers() async*{
    this.setState(ViewState.Loading);
    try{
      var res=await _userService.getUsers();
      userModel=res.user;
    }catch(Error){
      error=Error.toString();
      userModel=null;
    }
    this.setState(ViewState.Idle);
    yield userModel;
  }
}