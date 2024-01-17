import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/favourite/favourite_bloc.dart';
import '../../../bloc/favourite/favourite_event.dart';
import '../../../bloc/favourite/favourite_state.dart';

class DeleteButtonWidget extends StatelessWidget {
  const DeleteButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      buildWhen: (previous, current) =>  previous.tempFavouriteList != current.tempFavouriteList,
      builder: (context, state) {
        return Visibility(
            visible: state.tempFavouriteList.isNotEmpty ?  true : false ,
            child: IconButton(onPressed: () {
              for(int i = 0; i < state.tempFavouriteList.length ; i++){
                context.read<FavouriteBloc>().add(DeleteItem(object: state.tempFavouriteList[i]));
                context.read<FavouriteBloc>().add(UnSelectItem(item: state.tempFavouriteList[i]));
              }
            },
                icon: const Icon(Icons.delete_outline , color: Colors.red,))
        );
      },
    );
  }
}
