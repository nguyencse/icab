import 'package:flutter/material.dart';
import 'package:icab/src/blocs/auth_bloc.dart';

class MyApp extends InheritedWidget {
  final AuthBloc authBlock;
  final Widget child;

  MyApp(this.authBlock, this.child): super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget old) {
    return false;
  }

  static MyApp of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<MyApp>();
}
