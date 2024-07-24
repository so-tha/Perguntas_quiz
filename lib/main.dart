import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

    final _perguntas = const [
      {
        'texto': 'Qual é sua cor favorita?',
        'respostas': ['Amarelo', 'Preto', 'Azul'],
      },
      {
        'texto': 'Qual é seu animal favorito?',
        'respostas': [
          'Cachorrinhos',
          'Gatos',
          'Cavalos'
        ], //usasse o Object pois a resposta é uma lista
      },
      {
        'texto': 'Qual é minha cantora preferida?',
        'respostas': ['Taylor Swift', 'Beyonce', 'Sza'],
      },
    ];

  void _responder() {
    if(temPerguntaSelecionada){
          setState(() {
      _perguntaSelecionada++;
    });
    }
  }

  bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;

  }
  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada ? _perguntas[_perguntaSelecionada]['respostas'].call(): [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body:  temPerguntaSelecionada ? Column(
          children: <Widget> [
            Questao(_perguntas[_perguntaSelecionada]['texto'].call()),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        )
        : Center (child: Text(
            'Parabéns',
            style: TextStyle(fontSize: 28),
        ),
        )
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
