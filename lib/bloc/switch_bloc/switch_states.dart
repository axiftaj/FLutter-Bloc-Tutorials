
import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
   SwitchState({
     this.enable  = false,
     this.counter = 0,
     this.slider = 0.0
   });

  final bool enable;
  final int counter;
   final double slider;

  SwitchState copyWith({ bool? enable, int? counter , double? slider}) {
    return SwitchState(
      enable: enable ?? this.enable,
      counter: counter ?? this.counter,
      slider: slider ?? this.slider,
    );
  }
  @override
  List<Object> get props => [enable, counter, slider];
}