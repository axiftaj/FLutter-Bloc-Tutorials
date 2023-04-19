

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorials/bloc/post_bloc/post_event.dart';
import 'package:bloc_tutorials/bloc/post_bloc/post_state.dart';
import 'package:bloc_tutorials/repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent , PostState> {
  PostRepository postRepository  = PostRepository();


  PostBloc() :super(const PostState()){
    on<PostFetched>(
        fetchPostApi
    );
  }

  void fetchPostApi(PostFetched event, Emitter<PostState> emit)async {

    postRepository.fetchPost().then((value){
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
}