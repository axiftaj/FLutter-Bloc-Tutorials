import 'dart:async';
import 'dart:math';
import '../model/favoruite/favourite_item_model.dart';

class FavouriteRepository {

  Future<List<FavouriteItemModel>> fetchItems() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    return List.of(_generateItemsList(10));
  }

  List<FavouriteItemModel> _generateItemsList(int length) {
    return List.generate(
      length,
          (index) => FavouriteItemModel(id: '$index', value: 'Item $index'),
    );
  }

  Future<void> deleteItem(String id) async {
    await Future<void>.delayed(const Duration(seconds: 2));
  }
}
