
import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}


class CounterIncrement extends CounterEvent {}

class CounterDecrement extends CounterEvent {}


class SwitchEvent extends CounterEvent {}