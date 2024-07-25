import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacao;
  final void Function() quandoreiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoreiniciarQuestionario);

  String get fraseResultado{
    if(pontuacao < 8){
      return 'Poderia melhorar';
    } else if(pontuacao < 12){
      return 'Arrasou!';
    }else if(pontuacao < 16){
      return 'EBAAA!!!! Parabéns';
    }else{
      return 'Porra, congratulations!';
    }
  }

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,//alinha no centro os objetos
        children: <Widget> [
        Center (child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
        ),
        ),
        TextButton(
             onPressed: (){},
              child: Text("Jogar Novamente"),
              style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
          ),  
          )
         ],
    );
  } 
}