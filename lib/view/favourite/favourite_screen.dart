import 'package:bloc_tutorials/bloc/favourite/favourite_bloc.dart';
import 'package:bloc_tutorials/bloc/favourite/favourite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/favourite/favourite_event.dart';
import '../../model/favoruite/favourite_item_model.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocBuilder<FavouriteBloc , FavouriteState>(
        builder: (BuildContext context, state) {
          switch(state.listStatus){
            case ListStatus.loading:
              return const Center(child:  CircularProgressIndicator());
            case ListStatus.failure:
              return const Center(child: Text('error'));
            case ListStatus.success:
              return ListView.builder(
                  itemCount: state.favouriteList.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(state.favouriteList[index].value),
                      trailing: IconButton(
                        onPressed: (){
                          FavouriteItemModel item =  state.favouriteList[index];

                          item = item.copyWith(isFavourite:  true);
                          print(item);
                          context.read<FavouriteBloc>().add(FavouriteItem(item: FavouriteItemModel(id: item.id, isFavourite: item.isFavourite ? false :true, value:  item.value)));
                        },
                        icon: Icon(state.favouriteList[index].isFavourite ? Icons.favorite:  Icons.favorite_outline),
                      ),
                    );
                  }
              );
          }
        },

      ),
    );
  }
}
