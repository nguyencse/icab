import 'package:flutter/material.dart';
import 'package:icab/src/commons/configs.dart';
import 'package:icab/src/resources/login_page.dart';
import 'package:icab/src/resources/signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: Configs.fontFamily),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}