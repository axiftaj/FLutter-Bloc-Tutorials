import 'package:bloc_tutorials/model/post_model.dart';
import 'package:equatable/equatable.dart';

enum PostStatus { initial, success, failure }

class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <PostModel>[],
    this.message = '',
    this.searchPostList = const <PostModel>[],
    this.searchMessage = ''
  });

  final PostStatus status;
  final List<PostModel> posts;
  final List<PostModel> searchPostList;

  final String message;
  final String searchMessage;


  PostState copyWith({
    PostStatus? status,
    List<PostModel>? postsList,
    String? message,
    String? searchMessage,
    List<PostModel>? tempSearchPostList
  }) {
    return PostState(
      status: status ?? this.status,
      posts: postsList ?? this.posts,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
      searchPostList: tempSearchPostList ?? this.searchPostList,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $message, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts, message, searchPostList , searchMessage];
}
