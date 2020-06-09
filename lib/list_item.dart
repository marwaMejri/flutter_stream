import 'package:flutter/material.dart';
import 'package:flutterstream/user_model.dart';

class ListItem extends StatelessWidget {
  final User user;

  const ListItem({@required this.user});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          color: Colors.blue,
          width: 100,
          height: 100,
          child: Text(
              user.username
          ),
        ),
        Divider(
          height: 5,
        ),
      ],
    );
  }
}
