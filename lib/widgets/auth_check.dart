import 'package:flutter/material.dart';
import 'package:flutter_application_pi/screens/My_App.dart';
import 'package:flutter_application_pi/screens/login_page.dart';
import 'package:flutter_application_pi/services/auth_service.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return const LoginPage();
    } else {
      return const MyApp();
    }
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}