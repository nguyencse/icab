import 'package:flutter/material.dart';
import 'package:icab/src/blocs/auth_bloc.dart';
import 'package:icab/src/commons/configs.dart';
import 'package:icab/src/resources/app.dart';
import 'package:icab/src/resources/pages/login_page.dart';
import 'package:icab/src/resources/pages/map_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    AuthBloc(),
    MaterialApp(
      theme: ThemeData(fontFamily: Configs.fontFamily),
      home: MapPage(),
    ),
  ));
}
