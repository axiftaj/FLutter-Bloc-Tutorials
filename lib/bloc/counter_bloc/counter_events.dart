
import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}


class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}

class SwitchEvent extends CounterEvent {}