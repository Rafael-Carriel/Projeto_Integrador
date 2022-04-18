import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_pi/databases/db_postagems.dart';
import 'package:flutter_application_pi/screens/new_post.dart';

class PostagemScreen extends StatefulWidget {
  const PostagemScreen({Key? key}) : super(key: key);

  @override
  State<PostagemScreen> createState() => _PostagemScreenState();
}

class _PostagemScreenState extends State<PostagemScreen> {
  @override
  final db = FirebaseFirestore.instance;
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
        body: StreamBuilder<QuerySnapshot>(
            stream: db.collection('Postagens').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.yellow[200],
                              border: Border.all(color: Colors.blue, width: 3)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                doc.data()['title'],
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: 400,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2)),
                                child: Text(
                                  doc.data()['Describe'],
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Autor: ' + doc.data()['name'],
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Phone: ' + doc.data()['phone'],
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Email: ' + doc.data()['email'],
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              }
            }));
  }
}
