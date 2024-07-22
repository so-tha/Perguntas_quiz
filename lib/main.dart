import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
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
        'respostas': [
          'Taylor Swift',
          'Beyonce',
          'Sza'
        ], //usasse o Object pois a resposta é uma lista
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'].call()),
            Resposta('Resposta 1', _responder),
            Resposta('Resposta 2', _responder),
            Resposta('Resposta 3', _responder),
          ],
        ),
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
