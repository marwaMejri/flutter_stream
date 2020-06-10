import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterstream/user_model.dart';
import 'package:flutterstream/user_provider.dart';
import 'package:provider/provider.dart';


class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  UserProvider _userProvider;
  List<User> userModel;


  Stream getUser()async*{
    _userProvider=Provider.of<UserProvider>(context,listen: false);
    await _userProvider.getUsers().then((value) =>
        userModel=value
    );
    yield userModel;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:StreamBuilder(
            stream: getUser(),
            builder: (context, snapshot){
              if(snapshot.hasError)
                return Text("hey there is some error");
              else if (snapshot.connectionState == ConnectionState.waiting)
                return CircularProgressIndicator();
              return Text("${snapshot.data}", );
            },

        )

    );
  }
}
