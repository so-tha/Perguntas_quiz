
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
        {'texto':'Amarelo', 'pontuacao': 10},
        {'texto':'Preto', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 3},
        {'texto': 'Rosa', 'pontuacao': 1}],
      },
      {
        'texto': 'Qual é seu animal favorito?',
        'respostas': [
         {'texto': 'Cachorrinhos', 'pontuacao': 10},
          {'texto':'Gatos', 'pontuacao': 8},
          {'texto':'Cavalos', 'pontuacao': 1},
          {'texto':'Bisão', 'pontuacao': 9}
        ], //usasse o Object pois a resposta é uma lista
      },
      {
        'texto': 'Qual é minha cantora preferida?',
        'respostas': [
        {'texto':'Taylor Swift','pontuacao': 1 },
        {'texto':'Beyonce', 'pontuacao': 5} , 
        {'texto':'Sza', 'pontuacao': 10},
        {'texto':'Duquesa','pontuacao': 8}],
      },
    ];

  void _responder(int pontuacao) {
    if(temPerguntaSelecionada){
          setState(() {
      _perguntaSelecionada++;
      _pontuacaototal += pontuacao;
    });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaototal = 0;
    });
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
        body: Padding(padding: const EdgeInsets.all(16.0),
        child: temPerguntaSelecionada 
        ? Questionario(
          perguntas: _perguntas,
           perguntaSelecionada: _perguntaSelecionada,
            quandoresponder: _responder
          ) 
        :Resultado(_pontuacaototal, _reiniciarQuestionario), //comunicação direta
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
