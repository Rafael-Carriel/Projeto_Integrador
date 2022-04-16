import 'dart:ui';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_pi/databases/db_postagems.dart';
import 'package:flutter_application_pi/services/auth_service.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

bool loading = false;

class _NewPostState extends State<NewPost> {
  final _fk = GlobalKey<FormState>();
  final title = TextEditingController();
  final describe = TextEditingController();
  db_postagem post = db_postagem();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Postagem'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _fk,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextFormField(
                  controller: title,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Obrigatório";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextFormField(
                  controller: describe,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descrição',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Obrigatório";
                    } else if (value.length > 150) {
                      return "Tamanho do texto excedido";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (_fk.currentState!.validate()) {
                        post.setPost(title.text, describe.text);
                        Navigator.pop(context);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (loading)
                          ? [
                              const Padding(
                                padding: EdgeInsets.all(16),
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ]
                          : [
                              const Padding(
                                padding: EdgeInsets.all(24),
                                child: Text(
                                  "Adicionar Postagens",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
