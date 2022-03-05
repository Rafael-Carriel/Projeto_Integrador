import 'package:flutter/material.dart';
import 'package:flutter_application_pi/databases/postagem.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<postagem> post = [];
  postagem p = postagem("zeca ", "Oreia");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Postagens"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
      body: ListView.builder(
        itemCount: post.length,
        itemBuilder: (context, index) => post[index],
      ),
    );
  }
}
