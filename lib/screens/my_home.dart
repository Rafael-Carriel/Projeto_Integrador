import 'package:flutter/material.dart';
import 'package:flutter_application_pi/screens/perfil_screen.dart';
import 'package:flutter_application_pi/screens/postagem_screen.dart';

import 'configure_screen.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _Index = 0;
  final List<Widget> _screens = [
    const PostagemScreen(),
    const PerfilScreen(),
    const ConfigureScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_Index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _Index,
        onTap: (int index) => setState(() {
          (_Index = index);
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.all_inbox_rounded,
              size: 30,
            ),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              size: 30,
              color: Colors.blue,
            ),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.build_rounded,
              size: 30,
              color: Colors.blue,
            ),
            label: " ",
          ),
        ],
      ),
    );
  }
}
