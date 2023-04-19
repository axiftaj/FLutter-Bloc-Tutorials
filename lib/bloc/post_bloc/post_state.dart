
import 'package:bloc_tutorials/model/post_model.dart';
import 'package:equatable/equatable.dart';

enum PostStatus { initial, success, failure }

class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <PostModel>[],
    this.message = '',
  });

  final PostStatus status;
  final List<PostModel> posts;
  final String message;

  PostState copyWith({
    PostStatus? status,
    List<PostModel>? posts,
    String? message,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $message, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts, message];
}
