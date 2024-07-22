import 'package:flutter/material.dart';

class Resposta extends StatelessWidget{
  final String texto;

  Reposta(this.texto);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: Text(texto),
      );
  }
}