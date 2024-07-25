import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';
void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaototal = 0;
    final _perguntas = const [
      {
        'texto': 'Qual é sua cor favorita?',
        'respostas': [
        {'texto':'Amarelo', 'pontuação': 10},
        {'texto':'Preto', 'pontuação': 5},
        {'texto': 'Azul', 'pontuação': 3},
        {'texto': 'Rosa', 'pontuação': 1}],
      },
      {
        'texto': 'Qual é seu animal favorito?',
        'respostas': [
         {'texto': 'Cachorrinhos', 'pontuação': 10},
          {'texto':'Gatos', 'pontuação': 8},
          {'texto':'Cavalos', 'pontuação': 1},
          {'texto':'Bisão', 'pontuação': 9}
        ], //usasse o Object pois a resposta é uma lista
      },
      {
        'texto': 'Qual é minha cantora preferida?',
        'respostas': [
        {'texto':'Taylor Swift','pontuação': 1 },
        {'texto':'Beyonce', 'pontuação': 5} , 
        {'texto':'Sza', 'pontuação': 10},
        {'texto':'Duquesa','pontuação': 8}],
      },
    ];

  void _responder(int pontuacao) {
    if(temPerguntaSelecionada){
          setState(() {
      _perguntaSelecionada++;
      _pontuacaototal += pontuacao;
    });
    }

    print(_pontuacaototal);
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
