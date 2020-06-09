import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterstream/user_provider.dart';
import 'package:provider/provider.dart';


class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  UserProvider _userProvider;
  StreamController streamController=StreamController();

  Future getUsers(UserProvider userProvider)async{
    await userProvider.getUsers().then((value) =>
     streamController.add(value)
    );
  }



  @override
  void initState() {
    super.initState();
    _userProvider=Provider.of<UserProvider>(context,listen: false);
    getUsers(_userProvider);

  }
  @override
  void dispose() {
    super.dispose();
    streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:StreamBuilder(
            stream: streamController.stream,
            builder: (context, snapshot){
              if(snapshot.hasError)
                return Text("hey there is some error");
              else if (snapshot.connectionState == ConnectionState.waiting)
                return CircularProgressIndicator();
              return Text("${snapshot.data}");
            },
        )

    );
  }
}
