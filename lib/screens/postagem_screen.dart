import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_pi/databases/db_postagems.dart';
import 'package:flutter_application_pi/databases/postagem.dart';
import 'package:flutter_application_pi/screens/new_post.dart';

class PostagemScreen extends StatefulWidget {
  const PostagemScreen({Key? key}) : super(key: key);

  @override
  State<PostagemScreen> createState() => _PostagemScreenState();
}

db_postagem a = db_postagem();
Map us = {
  'title': '',
  'describe': '',
  'name': '',
  'phone': '',
  'email': '',
};

getPost() async {
  Map<String, String> _data = await a.getPost();
  us['tile'] = _data['title'];
  us['describe'] = _data['describe'];
  us['name'] = _data['name'];
  us['phone'] = _data['phone'];
  us['email'] = _data['email'];
}

class _PostagemScreenState extends State<PostagemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Feed',
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NewPost())),
                icon: const Icon(Icons.add_outlined))
          ],
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) =>
                postagem(getPost(), getPost(), getPost(), getPost(), getPost()),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  height: 8,
                ),
            itemCount: 0));
  }
}
