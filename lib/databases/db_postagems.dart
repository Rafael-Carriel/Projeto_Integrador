import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_pi/databases/db_firestore.dart';
import 'package:flutter_application_pi/databases/perfil.dart';
import 'package:flutter_application_pi/screens/new_post.dart';

class db_postagem extends ChangeNotifier {
  var uid = FirebaseAuth.instance.currentUser!.uid.toString();
  CollectionReference post = FirebaseFirestore.instance.collection('Postagens');
  Perfil perfil = Perfil();
  var postagens;
  Map us = {'name': '', 'telefone': '', 'email': '', 'cpf': '', 'phone': ''};

  void setPost(String title, String describe) async {
    Map _data = await perfil.getPerfil();
    us['name'] = _data['name'];
    us['cpf'] = _data['cpf'];
    us['telefone'] = _data['telefone'];
    us['cep'] = _data['cep'];
    us['email'] = _data['email'];

    await post.add({
      'title': title,
      'Describe': describe,
      'name': us['name'],
      'email': us['email'],
      'phone': us['telefone']
    });
  }
}
