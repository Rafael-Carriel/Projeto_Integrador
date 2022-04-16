import 'package:flutter/material.dart';

class postagem extends StatelessWidget {
  String nome, title, describe, phone, email;

  postagem(this.title, this.describe, this.nome, this.phone, this.email,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.yellow[200],
          border: Border.all(color: Colors.blue, width: 3)),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
          SizedBox(height: 5),
          Container(
            height: 80,
            width: 400,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)),
            child: Text(
              describe,
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Autor: ' + nome,
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
          SizedBox(height: 5),
          Text(
            'Phone: ' + phone,
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
          SizedBox(height: 5),
          Text(
            'Email: ' + email,
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
