import 'package:flutter/material.dart';

class postagem extends StatelessWidget {
  String nome;
  String title;

  postagem(this.nome, this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Row(
        children: [
          const SizedBox(
            width: 50,
            height: 100,
          ),
          Column(
            children: [
              Text(nome),
              Text(title),
            ],
          )
        ],
      ),
    );
  }
}
