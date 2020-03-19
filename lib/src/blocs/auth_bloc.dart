import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthBloc {
  StreamController _authStreamController = StreamController();

  Stream get authStream => _authStreamController.stream;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  void signIn(String email, String pass, Function(FirebaseUser) onSuccess,
      Function(String) onError) {
    _auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((res) => onSuccess(res.user))
        .catchError((error) => onError(error));
  }

  void signUp(String name, String phone, String email, String pass,
      Function(String) onSuccess, Function(String) onError) {
    _auth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((res) => onSuccess(res.user.uid))
        .catchError((error) => onError('Sign up error ' + error.code));
  }

  void createUser(String userId, String name, String phone, String email,
      Function onSuccess) {
    var user = {'name': name, 'phone': phone, 'email': email};
    var ref = _database.reference().child('users');
    ref.child(userId).set(user).then((res) => onSuccess).catchError((error) {});
  }

  void dispose() {
    _authStreamController.close();
  }
}
