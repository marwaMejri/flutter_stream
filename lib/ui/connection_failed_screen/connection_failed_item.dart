import 'package:flutter/material.dart';
class ConnectionFailedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(

      title: Center(
          child:CircleAvatar(
            backgroundColor: Colors.red,
            radius: 40,
            child: Icon(
              Icons.network_check,
              size: 35,
              color: Colors.white,

            ),
          )

      ),
      contentTextStyle: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w400,
          color: Colors.black
      ),

      content: Text("Please check Internet connection"),
    );
  }
}





