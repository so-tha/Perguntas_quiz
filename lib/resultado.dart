import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacao;

  Resultado(this.pontuacao);

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
    return  Center (child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
        ));
  }
}