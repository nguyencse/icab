import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthBloc {
  StreamController _authStreamController = StreamController();

  Stream get authStream => _authStreamController.stream;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  void signUp(String name, String phoneNumber, String email, String pass,
      Function success) {
    _auth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      success();
    }).catchError((error) {});
  }

  void _createUser(String userId, String userName, String email, Function success) {
    var user = {'username': userName, 'email': email};

    var ref = FirebaseDatabase.instance.reference().child('users');
    ref
        .child(userId)
        .set(user)
        .then((user) => success())
        .catchError((error) {});
  }
}
