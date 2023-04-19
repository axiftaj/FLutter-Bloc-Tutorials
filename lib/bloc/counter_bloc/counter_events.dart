
import 'package:equatable/equatable.dart';



abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}


class CounterIncrementPressed extends CounterEvent {
  const CounterIncrementPressed({required this.counter}) ;
  final int counter;

  @override
  List<Object> get props => [counter];
}

class CounterDecrementPressed extends CounterEvent {
  const CounterDecrementPressed({required this.counter}) ;
  final int counter;

  @override
  List<Object> get props => [counter];
}