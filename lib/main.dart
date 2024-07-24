import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';
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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada ? Questionario(
          perguntas: _perguntas,
           perguntaSelecionada: _perguntaSelecionada,
            quandoresponder: _responder) 
        :Resultado(),
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
