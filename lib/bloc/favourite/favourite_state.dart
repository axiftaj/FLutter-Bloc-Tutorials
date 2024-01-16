
import 'package:equatable/equatable.dart';

import '../../model/favoruite/favourite_item_model.dart';
enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable{

  final List<FavouriteItemModel> favouriteList ;
  final ListStatus  listStatus ;
  const FavouriteState({
     this.favouriteList = const  [],
    this.listStatus = ListStatus.loading
  });

  FavouriteState copyWith({ List<FavouriteItemModel>? favouriteList ,ListStatus?  listStatus  }) {
    return FavouriteState(
      favouriteList: favouriteList ?? this.favouriteList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [favouriteList, listStatus];
}


