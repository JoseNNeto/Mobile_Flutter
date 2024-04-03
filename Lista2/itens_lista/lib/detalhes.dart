import 'package:flutter/material.dart';
import 'package:itens_lista/item.dart';

class DetalhesItem extends StatelessWidget {
  final Item item;

  const DetalhesItem({super.key, required this.item});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Column(
        children: [
          Image.network(item.image),
          Text(item.description),
        ],
      ),
    );
  }

  
}