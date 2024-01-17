import 'package:bloc/bloc.dart';
import 'package:bloc_tutorials/bloc/favourite/favourite_event.dart';
import 'package:bloc_tutorials/bloc/favourite/favourite_state.dart';
import '../../model/favoruite/favourite_item_model.dart';
import '../../repository/favourite_reposiotry.dart';


class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {

  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];

  FavouriteRepository favouriteRepository ;

  FavouriteBloc(this.favouriteRepository) : super(const FavouriteState()) {
    on<FetchFavouriteList>(fetchFavouriteList);
    on<FavouriteItem>(_addFavourite);
    on<DeleteItem>(deleteItem);
    on<SelectItem>(selectedItem);
    on<UnSelectItem>(unSelectItem);
  }

  void selectedItem(SelectItem events , Emitter<FavouriteState> emit)async{
    tempFavouriteList.add(events.item);
    emit(state.copyWith(tempFavouriteList: List.from(tempFavouriteList)));
  }
  void unSelectItem(UnSelectItem events , Emitter<FavouriteState> emit)async{
    tempFavouriteList.remove(events.item);
    emit(state.copyWith(tempFavouriteList: List.from(tempFavouriteList)));
  }


  void fetchFavouriteList(FetchFavouriteList events , Emitter<FavouriteState> emit)async{
    favouriteList = await favouriteRepository.fetchItems();
    emit(
        state.copyWith(
        favouriteList: List.from(favouriteList),
        listStatus: ListStatus.success
    ));
  }

  void _addFavourite(FavouriteItem events , Emitter<FavouriteState> emit)async{

    final personIndex = favouriteList.indexWhere((person) => person.id == events.item.id);
    if(events.item.isFavourite){
      if(tempFavouriteList.contains(favouriteList[personIndex])){
        tempFavouriteList.remove(favouriteList[personIndex]);
        tempFavouriteList.add(events.item);
      }
    }else {
      if(tempFavouriteList.contains(favouriteList[personIndex])){
        tempFavouriteList.remove(favouriteList[personIndex]);
        tempFavouriteList.add(events.item);
      }
    }
    favouriteList[personIndex] = events.item;
    emit(state.copyWith(favouriteList: List.from(favouriteList) , tempFavouriteList: List.from(tempFavouriteList)));
  }

  void deleteItem(DeleteItem events , Emitter<FavouriteState> emit)async{

    for(int i = 0 ; i< tempFavouriteList.length ; i++){
      favouriteList.remove(tempFavouriteList[i]);
    }

    tempFavouriteList.clear();
    emit(
        state.copyWith(
            favouriteList: List.from(favouriteList),
            tempFavouriteList: List.from(tempFavouriteList),
        ));
  }
}


