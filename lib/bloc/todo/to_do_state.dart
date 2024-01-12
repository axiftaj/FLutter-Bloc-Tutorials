


import 'package:equatable/equatable.dart';

 class ToDoState extends Equatable {

  final List<String> todos;

  const ToDoState( { this.todos = const [] });

  ToDoState copyWith({ List<String>? todos  }) {
    return ToDoState(
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object> get props => [ todos ];
}






