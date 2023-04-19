
import 'package:equatable/equatable.dart';

class ConterState extends Equatable {
  const ConterState({
    this.counter = 0,
  });

  final int counter;

  ConterState copyWith({ int? counter ,}) {
    return ConterState(
      counter: counter ?? this.counter,
    );
  }
  @override
  List<Object> get props => [ counter];
}