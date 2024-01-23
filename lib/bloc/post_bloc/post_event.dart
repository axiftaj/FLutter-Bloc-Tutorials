
import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetched extends PostEvent {}

class SearchItem extends PostEvent {
  final String stSearch ;
  SearchItem(this.stSearch);

}


class FetchPostWithLazyLoading extends PostEvent {}