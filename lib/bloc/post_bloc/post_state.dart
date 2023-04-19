
import 'package:bloc_tutorials/model/post_model.dart';
import 'package:equatable/equatable.dart';

enum PostStatus { initial, success, failure }

class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <PostModel>[],
    this.hasReachedMax = false,
  });

  final PostStatus status;
  final List<PostModel> posts;
  final bool hasReachedMax;

  PostState copyWith({
    PostStatus? status,
    List<PostModel>? posts,
    bool? hasReachedMax,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax];
}
