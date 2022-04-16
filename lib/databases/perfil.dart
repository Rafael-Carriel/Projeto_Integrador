import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_pi/databases/db_firestore.dart';

class Perfil extends ChangeNotifier {
  var uid;

  Perfil({this.uid});
  FirebaseFirestore db = DBFirestore.get();
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  Map<String, String> us = {
    'name': '',
    'cpf': ' ',
    'telefone': ' ',
    'cep': ' ',
    'email': ' ',
  };

  Future<String> registraDB(
      String name, String cpf, String phone, String cep, String email) async {
    try {
      final userDoc = user.doc(FirebaseAuth.instance.currentUser!.uid);
      await userDoc.get().then((doc) => {
            if (!doc.exists)
              {
                userDoc.set({
                  'name': name,
                  'cpf': cpf,
                  'telefone': phone,
                  'cep': cep,
                  'email': email,
                })
              }
          });
    } on Exception catch (e) {
      rethrow;
    }
    return '';
  }

  Future<Map<String, String>> getPerfil() async {
    Map<String, String> us = {
      'name': '',
      'cpf': ' ',
      'telefone': ' ',
      'cep': ' ',
      'email': ' ',
    };
    await user
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) => {
              if (value.exists)
                {
                  us['name'] = value.data()!['name'],
                  us['cpf'] = value.data()!['cpf'],
                  us['telefone'] = value.data()!['telefone'],
                  us['cep'] = value.data()!['cep'],
                  us['email'] = value.data()!['email'],
                }
            });
    return us;
  }
}
