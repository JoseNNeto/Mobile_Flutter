import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manipulation/favorite_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteList(),
      child: MaterialApp(
        title: 'Favorite Items',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Items'),
      ),
      body: Consumer<FavoriteList>(
        builder: (context, favoriteList, child) {
          return ListView.builder(
            itemCount: favoriteList.items.length,
            itemBuilder: (context, index) {
              final item = favoriteList.items[index];
              return ListTile(
                title: Text(item.name),
                trailing: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    favoriteList.removeItem(item);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String itemName = '';
              return AlertDialog(
                title: const Text('Add Item'),
                content: TextField(
                  onChanged: (value) {
                    itemName = value;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      final favoriteList = Provider.of<FavoriteList>(context, listen: false);
                      favoriteList.addItem(itemName);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}