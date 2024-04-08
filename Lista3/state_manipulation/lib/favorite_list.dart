import 'package:flutter/material.dart';
import 'package:state_manipulation/favorite_item.dart';

class FavoriteList extends ChangeNotifier {
  final List<FavoriteItem> _items = [];

  List<FavoriteItem> get items => _items;

  void addItem(String name) {
    _items.add(FavoriteItem(name));
    notifyListeners();
  }

  void removeItem(FavoriteItem item) {
    _items.remove(item);
    notifyListeners();
  }
}