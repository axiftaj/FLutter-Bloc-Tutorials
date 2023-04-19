

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorials/bloc/post_bloc/post_event.dart';
import 'package:bloc_tutorials/bloc/post_bloc/post_state.dart';
import 'package:bloc_tutorials/repository/post_repository.dart';
import 'package:bloc_tutorials/repository/user_repository.dart';

class PostBloc extends Bloc<PostEvent , PostState> {
  PostRepository postRepository  = PostRepository();


  PostBloc() :super(PostState()){
    on((event, emit) => fetchPostApi());
  }

  void fetchPostApi()async {

    postRepository.fetchPost().then((value){
      emit(
        state.copyWith(
          status: PostStatus.success ,
          posts: value ,
          hasReachedMax: false
        )
      );
    }).onError((error, stackTrace){
      emit(
          state.copyWith(
              status: PostStatus.failure ,
          )
      );
    });
  }
}