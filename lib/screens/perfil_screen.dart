import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Row(
            children: [
              Container(
                color: Colors.blue,
                height: 100,
                width: 100,
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text('Rafael Carriel de Oliveira'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('42 984429392'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('rafael@gmail.com'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(' I am Rafael'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
