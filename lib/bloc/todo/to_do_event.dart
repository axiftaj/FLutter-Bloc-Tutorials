import 'package:equatable/equatable.dart';

abstract class ToDoEvent extends Equatable {
  const ToDoEvent();
}

class AddTodoEvent extends ToDoEvent {
  final String task;

  const AddTodoEvent(this.task);

  @override
  List<Object?> get props => [task];
}

class RemoveTodoEvent extends ToDoEvent {
  final Object index;
  const RemoveTodoEvent(this.index);

  @override
  List<Object?> get props => [index];
}
