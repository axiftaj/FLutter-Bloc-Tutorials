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
    on<FavouriteItem>(_fetchFavouriteList);
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

  void _fetchFavouriteList(FavouriteItem events , Emitter<FavouriteState> emit)async{
    final personIndex = favouriteList.indexWhere((person) => person.id == events.item.id);
    favouriteList[personIndex] = events.item;
    emit(state.copyWith(favouriteList: List.from(favouriteList)));
  }

  void deleteItem(DeleteItem events , Emitter<FavouriteState> emit)async{
    favouriteList.remove(events.object);
    emit(
        state.copyWith(
            favouriteList: List.from(favouriteList),
            listStatus: ListStatus.success
        ));
  }
}


