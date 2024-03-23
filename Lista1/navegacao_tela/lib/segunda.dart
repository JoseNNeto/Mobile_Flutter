import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Tela'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          }, child: Text('Voltar para a Primeira Tela')),
      ),
    );
  }
}