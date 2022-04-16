import 'dart:html';

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

class _PostagemScreenState extends State<PostagemScreen> {
  late db_postagem posts;
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
        body: StreamBuilder(
            stream: posts.get().snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return ListView();
                }),
              );
            }));
  }
}
