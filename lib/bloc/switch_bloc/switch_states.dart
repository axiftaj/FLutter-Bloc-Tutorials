
import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
   const SwitchState({
     this.enable  = false,
     this.counter = 0,
     this.slider = 0.0 ,
     this.productList = const []
   });

  final bool enable;
  final int counter;
   final double slider;
   final List<int> productList;

  SwitchState copyWith({ bool? enable, int? counter , double? slider , List<int>? productList}) {
    return SwitchState(
      enable: enable ?? this.enable,
      counter: counter ?? this.counter,
      slider: slider ?? this.slider,
      productList: productList ?? this.productList,
    );
  }
  @override
  List<Object> get props => [enable, counter, slider, productList];
}