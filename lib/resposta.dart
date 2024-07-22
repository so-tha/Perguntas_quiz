import 'package:flutter/material.dart';

class Resposta extends StatelessWidget{
  final String texto;
  final void Function() onSelected;

  Resposta(this.texto, this.onSelected);

      @override
      Widget build(BuildContext context) {
        return Container(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            onPressed: onSelected,
            child: Text(texto),
          ),
        );
      }
    }    