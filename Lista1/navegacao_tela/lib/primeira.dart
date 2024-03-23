import 'package:flutter/material.dart';
import 'package:navegacao_tela/segunda.dart';

class PrimeiraTela extends StatelessWidget {
  PrimeiraTela({required Key key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Tela'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder:(context) => SegundaTela()),
            );
          }, 
          child: Text('Mudar de Tela')),
      ),
    );
  }
}
