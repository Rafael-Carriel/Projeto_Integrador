// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_pi/widgets/auth_check.dart';

// ignore: duplicate_ignore
class AuthException implements Exception {
  // ignore: non_constant_identifier_names
  String _Message;

  // ignore: unnecessary_getters_setters
  String get Message => _Message;

  // ignore: unnecessary_getters_setters
  set Message(String Message) {
    _Message = Message;
  }

  AuthException(this._Message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        usuario = user;
      } else {
        usuario = null;
      }
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  Registrar(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('Senha tem que possuir 6 digitos ou mais!');
      } else if (e.email == 'email-alredy-in-use') {
        throw AuthException('Email já está em uso');
      }
    }
  }

  Login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email não cadastrado');
      } else if (e.email == 'wrong-password') {
        throw AuthException('Senha errada');
      }
    }
  }

  LogOut() async {
    _auth.signOut();
    _getUser();
    notifyListeners();
  }
}
