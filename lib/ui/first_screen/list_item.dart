import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstream/models/user_model.dart';

class ListItem extends StatelessWidget {

  final User user;

  const ListItem({@required this.user});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          width: MediaQuery.of(context).size.width,
          height: 75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
               Row(
                 children: <Widget>[
                   Text(
                       "UserName: ",
                     style: TextStyle(
                       fontSize: 20
                     ),
                   ),
                   Text(
                       user.username,
                     style: TextStyle(
                         fontSize: 20
                     ),
                   ),
                 ],
               ),
              Row(
                children: <Widget>[
                  Text(
                      "Email: ",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  Text(
                      user.email,
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ],
              )
            ],
          )
        ),
        Divider(
          height: 3,
          color: Colors.black,
        ),
      ],
    );
  }
}
