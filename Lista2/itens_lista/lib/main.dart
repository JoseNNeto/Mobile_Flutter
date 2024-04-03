import 'package:flutter/material.dart';
import 'package:itens_lista/detalhes.dart';
import 'package:itens_lista/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Itens',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: ListaItens(title: 'Lista de Itens',),
    );
  }
}


class ListaItens extends StatelessWidget{
  final String title;
  ListaItens({super.key, required this.title});

  final List<Item> itens = [
    Item(title: 'Guitarra', description: 'Guitarra Les Paul', image: 'assets/GuitarLesPaul.jpg'),
    Item(title: 'Baixo', description: 'Baixo ', image: 'assets/Baixo.jpg'),
    Item(title: 'Violão', description: 'Violão', image: 'assets/Violao.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Itens"),
      ),
      body: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(itens[index].title),
            subtitle: Text(itens[index].description),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(itens[index].image),
            ),
            onTap: () {
              _mostrarDetalhes(context, itens[index]);
            },
          );
        },
      ),
    );
  }

  void _mostrarDetalhes(BuildContext context, Item item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesItem(item: item),
      ),
    );
  }
}