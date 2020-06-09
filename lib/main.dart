import 'package:flutter/material.dart';
import 'package:flutterstream/user_list.dart';
import 'package:flutterstream/user_provider.dart';
import 'package:provider/provider.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          ),
        ],
        child: MaterialApp(
          home: UserList(),
        )


    );
  }
}
