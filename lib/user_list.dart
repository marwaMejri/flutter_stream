

import 'package:flutter/material.dart';
import 'package:flutterstream/user_model.dart';
import 'package:flutterstream/user_provider.dart';
import 'package:provider/provider.dart';


class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  List<User> userModel;
  @override
  Widget build(BuildContext context) {
    final userProvider=Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(),
        body:StreamBuilder(
            stream: userProvider.getUsers(),
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
