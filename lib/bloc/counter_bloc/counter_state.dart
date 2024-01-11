
import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counter;
  final bool isSwitchOn;
  const CounterState({
    this.counter = 20,
    this.isSwitchOn = false
  });


  CounterState copyWith({ int? counter ,bool? isSwitchOn }) {
    return CounterState(
      counter: counter ?? this.counter,
      isSwitchOn : isSwitchOn ?? this.isSwitchOn,
    );
  }

  @override
  List<Object> get props => [ counter, isSwitchOn];
}


class SwitchState extends Equatable {
  final bool isSwitchOn;

  SwitchState(this.isSwitchOn);

  SwitchState copyWith({bool? isSwitchOn}) {
    return SwitchState(isSwitchOn ?? this.isSwitchOn);
  }

  @override
  List<Object?> get props => [isSwitchOn];
}