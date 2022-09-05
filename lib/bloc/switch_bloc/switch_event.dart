
import 'package:equatable/equatable.dart';



abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}


class EnableChange extends SwitchEvent {
  const EnableChange({required this.enable}) ;

  final bool enable;

  @override
  List<Object> get props => [enable];
}


class CounterChange extends SwitchEvent {
  const CounterChange({required this.counter}) ;

  final int counter;

  @override
  List<Object> get props => [counter];
}

class SliderChange extends SwitchEvent {
  const SliderChange({required this.slider}) ;

  final double slider;

  @override
  List<Object> get props => [slider];
}
