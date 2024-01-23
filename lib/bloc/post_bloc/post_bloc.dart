

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
              posts: value ,
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
      emit(state.copyWith(searchPostList: [] , searchMessage: ''));
    }else {
      tempPostList = state.posts.where((map)=>map.userId.toString() == event.stSearch).toList();
      print(tempPostList.length);
      if(tempPostList.isEmpty){
        emit(state.copyWith(searchPostList: tempPostList , searchMessage: 'No data found'));
      }else {
        emit(state.copyWith(searchPostList: tempPostList ));
      }
    }

  }

}