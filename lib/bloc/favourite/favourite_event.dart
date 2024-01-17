


import 'package:bloc_tutorials/model/favoruite/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteEvent extends Equatable{
  const FavouriteEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavouriteEvent {}

class FavouriteItem extends FavouriteEvent {
  FavouriteItemModel item ;
  FavouriteItem({required this.item}) ;
}


class SelectItem extends FavouriteEvent {
  FavouriteItemModel item ;
  SelectItem({required this.item}) ;
}

class UnSelectItem extends FavouriteEvent {
  FavouriteItemModel item ;
  UnSelectItem({required this.item}) ;
}

class DeleteItem extends FavouriteEvent {
}