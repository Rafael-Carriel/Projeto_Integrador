import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_pi/screens/my_home.dart';
import 'package:flutter_application_pi/widgets/auth_check.dart';

class AuthException implements Exception {
  String Message;
  AuthException(this.Message);
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
}
