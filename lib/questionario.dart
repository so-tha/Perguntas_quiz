import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String,Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoresponder;

Questionario({
  required this.perguntas,
  required this.perguntaSelecionada,
  required this.quandoresponder,
  super.key,
});

  bool get temPerguntaSelecionada{
    return perguntaSelecionada < perguntas.length;

  }

  @override
  Widget build(BuildContext context){
     List<Map<String, Object>> respostas = temPerguntaSelecionada 
     ? perguntas[perguntaSelecionada]['respostas'] 
     as List<Map<String, Object>> : [];

    return Column(
          children: <Widget> [
            Questao(perguntas[perguntaSelecionada]['texto'] as String),
            ...respostas
            .map((resp){
              return Resposta(
              resp['texto'].toString(),
              () =>
             quandoresponder(resp['pontuacao'] as int),
             );
            }).toList(),
          ],
        );
  }
}