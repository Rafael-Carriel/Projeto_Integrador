import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_pi/databases/db_firestore.dart';
import 'package:flutter_application_pi/widgets/auth_check.dart';

class perfil extends ChangeNotifier {
  FirebaseFirestore db = DBFirestore.get();
  late AuthCheck auth;

  void registraDB(String name, String cpf, String phone, String cep,
      String describe, String email) async {
    await db.collection("user").add({
      "name": name,
      "cpf": cpf,
      "telefone": phone,
      "cep": cep,
      "email": email,
      "describe": "Uhull"
    });
  }

  /* void getPerfil() async {
    await db.collection("user").
  }*/
}
