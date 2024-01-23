

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorials/bloc/post_bloc/post_event.dart';
import 'package:bloc_tutorials/bloc/post_bloc/post_state.dart';
import 'package:bloc_tutorials/repository/post_repository.dart';

import '../../model/post_model.dart';

class PostBloc extends Bloc<PostEvent , PostState> {
  PostRepository postRepository  = PostRepository();
   List<PostModel> tempPostList = [];

  PostBloc() :super(const PostState()){
    on<PostFetched>(fetchPostApi);
    on<SearchItem>(_searchItem);
  }

  Future<void> fetchPostApi(PostFetched event, Emitter<PostState> emit)async {

    await postRepository.fetchPost().then((value){
      emit(
          state.copyWith(
              status: PostStatus.success ,
              postsList: value ,
              message: 'success'
          )
      );
    }).onError((error, stackTrace){
      emit(
          state.copyWith(
              status: PostStatus.failure ,
              message: error.toString()
          )
      );
    });
  }

  void _searchItem(SearchItem event, Emitter<PostState> emit) {

    if(event.stSearch.isEmpty){
      emit(state.copyWith(tempSearchPostList: [] , searchMessage: ''));
    }else {
      tempPostList = state.posts.where((element) =>  element.title.toString().toLowerCase().toString().contains(event.stSearch.toString().toLowerCase())).toList();
      // tempPostList = state.posts.where((map)=>map.userId.toString() == event.stSearch).toList();
      if(tempPostList.isEmpty){
        emit(state.copyWith(tempSearchPostList: tempPostList , searchMessage: 'No data found'));
      }else {
        emit(state.copyWith(tempSearchPostList: tempPostList  ));
      }
    }

  }

}