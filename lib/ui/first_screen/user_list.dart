


import 'package:flutter/material.dart';
import 'package:flutterstream/enums/connectivity_status.dart';
import 'package:flutterstream/providers/user_provider.dart';
import 'package:flutterstream/services/connectivity_service.dart';
import 'package:flutterstream/ui/first_screen/list_item.dart';
import 'package:provider/provider.dart';


class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  UserProvider userProvider;
  ConnectivityService connectivityService;
@override
  void dispose() {
    super.dispose();
    userProvider.streamController.close();
    connectivityService.connectionStatusController.close();
  }

  @override
  Widget build(BuildContext context) {
    userProvider=Provider.of<UserProvider>(context);
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    return Scaffold(
        appBar: AppBar(),
        body: (connectionStatus==ConnectivityStatus.WiFi || connectionStatus==ConnectivityStatus.Cellular)?
        StreamBuilder(
          stream:userProvider.getUsers(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting)
              return CircularProgressIndicator();
            else if(userProvider.error!=null)
              return Text(userProvider.error);
            return ListView.builder(
              itemBuilder: (context, index){
                return ListItem(user: snapshot.data[index]);
              },
              itemCount: snapshot.data.length,
            );
          },

        )
            :Text("nooo connection")

    );
  }
}
