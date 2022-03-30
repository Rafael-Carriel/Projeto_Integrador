import 'package:flutter/material.dart';
import 'package:flutter_application_pi/services/auth_service.dart';
import 'package:provider/src/provider.dart';

class ConfigureScreen extends StatefulWidget {
  const ConfigureScreen({Key? key}) : super(key: key);

  @override
  State<ConfigureScreen> createState() => _ConfigureScreenState();
}

class _ConfigureScreenState extends State<ConfigureScreen> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  LogOut() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().LogOut();
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.Message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: LogOut,
              child: Text("Sair"),
            )
          ],
        ),
      ),
    );
  }
}
