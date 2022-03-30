import 'package:flutter/material.dart';

class PostagemScreen extends StatefulWidget {
  const PostagemScreen({Key? key}) : super(key: key);

  @override
  State<PostagemScreen> createState() => _PostagemScreenState();
}

class _PostagemScreenState extends State<PostagemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feed',
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
        centerTitle: true,
      ),
    );
  }
}
