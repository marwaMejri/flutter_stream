import 'dart:convert';

import 'package:flutterstream/base_service.dart';
import 'package:flutterstream/user_model.dart';

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
