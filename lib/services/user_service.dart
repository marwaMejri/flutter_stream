import 'dart:convert';

import 'package:flutterstream/models/user_model.dart';
import 'package:flutterstream/services/base_service.dart';



class UserService extends BaseService {

  Stream<UserModel> getUsers() async* {

    var value;
    final response = await this.getWS(uri: 'users');
    try {
      var decodedJson = jsonDecode(response.body);
      var users = UserModel.fromJson(decodedJson);
      value = users;
    } catch (error) {
      value = error;
    }
    yield value;
  }
}
