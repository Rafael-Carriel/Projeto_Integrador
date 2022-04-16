import 'package:flutter/material.dart';
import 'package:flutter_application_pi/databases/perfil.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  Perfil p = Perfil();

  Map us = {
    'name': '',
    'cpf': '',
    'telefone': '',
    'cep': '',
    'email': '',
  };

  getPerfil() async {
    Map _data = await p.getPerfil();
    if (this.mounted) {
      us['name'] = _data['name'];
      us['cpf'] = _data['cpf'];
      us['telefone'] = _data['telefone'];
      us['cep'] = _data['cep'];
      us['email'] = _data['email'];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    getPerfil();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Perfil",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                image: AssetImage('assets/a.jpeg'),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 4),
              ),
              child: Column(
                children: [
                  Text(
                    us['name'],
                    style: TextStyle(fontSize: 25.0, color: Colors.blue[400]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(us['cpf'],
                      style:
                          TextStyle(fontSize: 25.0, color: Colors.blue[400])),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(us['cep'],
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.blue[400],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(us['telefone'],
                      style:
                          TextStyle(fontSize: 25.0, color: Colors.blue[400])),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(us['email'],
                      style:
                          TextStyle(fontSize: 25.0, color: Colors.blue[400])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
